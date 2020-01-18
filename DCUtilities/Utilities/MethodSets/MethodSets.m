//
//  MethodSets.m
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#import "MethodSets.h"
//#import <CommonCrypto/CommonDigest.h>
//#import <sys/sysctl.h>

@implementation MethodSets

+ (NSString *)getUUID
{
    UIDevice *device = [UIDevice currentDevice];//创建设备对象
    NSUUID *UUID = [device identifierForVendor];
    NSString *deviceID = [UUID UUIDString];
    deviceID = [deviceID stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    NSLog(@"%@",deviceID);
    return deviceID;
}

+ (NSString *)createUUID
{
    // create a new UUID which you own
    CFUUIDRef uuidref = CFUUIDCreate(kCFAllocatorDefault);
    // create a new CFStringRef (toll-free bridged to NSString)
    // that you own
    CFStringRef uuid = CFUUIDCreateString(kCFAllocatorDefault, uuidref);
    NSString *result = (__bridge NSString *)uuid;
    
    // 去除'-'
    result = [result stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    // release the uuidref
    CFRelease(uuidref);
    // release the UUID
    CFRelease(uuid);
    
    // 小写
    return result.lowercaseString;
}

+ (NSInteger)getSystemVersion
{
    return [[[UIDevice currentDevice] systemVersion] integerValue];
}

//+ (NSString *)getCurrentDeviceModel
//{
//    int mib[2];
//    size_t len;
//    char *machine;
//
//    mib[0] = CTL_HW;
//    mib[1] = HW_MACHINE;
//    sysctl(mib, 2, NULL, &len, NULL, 0);
//    machine = malloc(len);
//    sysctl(mib, 2, machine, &len, NULL, 0);
//
//    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
//    free(machine);
//
////    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
////    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
////    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
////    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
////    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
////    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
////    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
////    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
////    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
////    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
////    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
////    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
////    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
////    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
////    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
////
////    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
////    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
////    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
////    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
////    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
////
////    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
////
////    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
////    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
////    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
////    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
////    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
////    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
////    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
////
////    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
////    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
////    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
////    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
////    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
////    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
////
////    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
////    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
////    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
////    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
////    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
////    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
////
////    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
////    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
//
//    // iPhone
//    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
//    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
//    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
//    if ([platform isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
//    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
//    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
//    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
//    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
//    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
//    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
//    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
//    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
//    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
//    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
//    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (CDMA)";
//    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
//    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (CDMA)";
//    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
//
//    // iPod
//    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
//    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
//    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
//    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
//    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
//
//    // iPad
//    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
//    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
//    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
//    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
//    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
//    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
//    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
//    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
//
//    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
//    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
//    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
//    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
//    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
//    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
//
//    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air";
//    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air";
//    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
//    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
//    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
//
//    if ([platform isEqualToString:@"iPad4,4"] ||
//        [platform isEqualToString:@"iPad4,5"] ||
//        [platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
//
//    if ([platform isEqualToString:@"iPad4,7"] ||
//        [platform isEqualToString:@"iPad4,8"] ||
//        [platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
//
//    if ([platform isEqualToString:@"iPad6,3"] ||
//        [platform isEqualToString:@"iPad6,4"])      return @"iPad PRO 12.9";
//
//    // 模拟器
//    if ([platform isEqualToString:@"i386"])         return @"Simulator";
//    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
//
//    return nil;
//}

+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    
    // App版本
    NSString *currentVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    return currentVersion;
}

+ (NSString *)appBuildVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    
    // App Build版本
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    return app_build;
}

+ (NSString *)appName
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    
    // App名称
    NSString *app_name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    
    return app_name;
}

+ (NSString*)getPreferredLanguage
{
    NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    NSLog(@"Preferred Language:%@", preferredLang);
    return preferredLang;
}

+ (NSInteger)keyboardHeight:(NSNotification *)notification
{
    //获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    
    return keyboardRect.size.height;
}

+ (CGFloat)calculateWidthWithString:(NSString *)string withMinWidth:(CGFloat)minWidth withRegularHeight:(CGFloat)regularHeight withFontSize:(CGFloat)fontSize;
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange allRange = [string rangeOfString:string];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:fontSize]
                    range:allRange];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor whiteColor]
                    range:allRange];
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, regularHeight)
                                        options:options
                                        context:nil];
    
    return (ceilf(rect.size.width + 10.f) > minWidth) ? (ceilf(rect.size.width + 10.f)) : minWidth;
}

+ (CGFloat)calculateHeightWithString:(NSString *)string withMinHeight:(CGFloat)minHeight withRegularWidth:(CGFloat)regularWidth withFontSize:(CGFloat)fontSize
{
    if (!string) string = @"";
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange allRange = [string rangeOfString:string];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:fontSize]
                    range:allRange];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor whiteColor]
                    range:allRange];
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(regularWidth, CGFLOAT_MAX)
                                        options:options
                                        context:nil];
    
    return (ceilf(rect.size.height) > minHeight)?(ceilf(rect.size.height)):minHeight;
}

//+ (NSString *)stringFromMD5:(NSString*)str
//{
//    if(str == nil || [str length] == 0)
//        return nil;
//
//    const char * value = [str UTF8String];
//
//    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(value, (unsigned int)strlen(value), outputBuffer);
//
//    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
//    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++) {
//        [outputString appendFormat:@"%02x",outputBuffer[count]];
//    }
//    return outputString;
//}

//+ (NSString *)signFromField:(NSDictionary *)dic
//{
//    NSLog(@"dicccccccccc: %@", dic);
//
//    NSMutableArray *keyArr = [NSMutableArray arrayWithCapacity:0];
//    for (NSString *str in [dic allKeys]) {
//        [keyArr addObject:str];
//    }
//    NSLog(@"keyArr: %@", keyArr);
//
//    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
//    NSArray *descriptorArr = [NSArray arrayWithObject:descriptor];
//    [keyArr sortUsingDescriptors:descriptorArr];
//
//    NSLog(@"keyArr: %@", keyArr);
//
//    NSString *sign;
//    for (int index = 0; index < keyArr.count; index++) {
//        NSString *str = keyArr[index];
//        if (index == 0) {
//            sign = [NSString stringWithFormat:@"%@=%@", str, [dic objectForKey:str]];
//        } else {
//            sign = [NSString stringWithFormat:@"%@,%@=%@",sign, str, [dic objectForKey:str]];
//        }
//    }
//
//    return [self stringFromMD5:sign];
//}

//+ (NSString *)signFromModel:(JSONModel *)model
//{
//    NSLog(@"modellllllllll: %@", model);
//
//    NSArray *allKeys = [self allPropertyNamesFromModel:model];
//
//    NSMutableArray *keyArray = [NSMutableArray arrayWithArray:allKeys];
//
//    for (NSString *key in allKeys) {
//        // 去除sign关键词
//        if ([key isEqualToString:@"sign"]) {
//            [keyArray removeObject:key];
//        }
//        // 去除空关键词
//        if (![model valueForKey:key]) {
//            [keyArray removeObject:key];
//        }
//    }
//    NSLog(@"keyArray: %@", keyArray);
//
//    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
//    NSArray *descriptorArr = [NSArray arrayWithObject:descriptor];
//    [keyArray sortUsingDescriptors:descriptorArr];
//
//    NSLog(@"keyArray: %@", keyArray);
//
//    NSString *sign;
//    for (int index = 0; index < keyArray.count; index++) {
//        NSString *str = keyArray[index];
//        if (index == 0) {
//            sign = [NSString stringWithFormat:@"%@=%@", str, [model valueForKey:str]];
//        } else {
//            sign = [NSString stringWithFormat:@"%@,%@=%@",sign, str, [model valueForKey:str]];
//        }
//    }
//    NSLog(@"signXXX: %@", sign);
//    return [self stringFromMD5:sign];
//}

//// 通过运行时获取当前对象的所有属性的名称，以数组的形式返回
//+ (NSArray *) allPropertyNamesFromModel:(JSONModel *)model {
//    ///存储所有的属性名称
//    NSMutableArray *allNames = [[NSMutableArray alloc] init];
//
//    ///存储属性的个数
//    unsigned int propertyCount = 0;
//
//    ///通过运行时获取当前类的属性
//    objc_property_t *propertys = class_copyPropertyList([model class], &propertyCount);
//
//    //把属性放到数组中
//    for (int i = 0; i < propertyCount; i ++) {
//        ///取出第一个属性
//        objc_property_t property = propertys[i];
//
//        const char * propertyName = property_getName(property);
//
//        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
//    }
//
//    ///释放
//    free(propertys);
//
//    return allNames;
//}

+ (NSMutableArray *)bubbleSort:(NSMutableArray *)tempArr
{
    //冒泡排序
    for (int row = 0; row < tempArr.count - 1; row++) {
        for (int col = 0 ; col < tempArr.count - 1 - row; col++) {
            
            if ([tempArr[col] intValue] > [tempArr[col + 1] intValue]) {
                [tempArr exchangeObjectAtIndex:col withObjectAtIndex:col + 1];
            }
        }
    }
    return tempArr;
}

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700,173,199
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700,173,199
     */
    NSString *CT = @"(^1(33|53|77|73|99|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)validateCellPhoneNumber:(NSString *)cellNum{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,177,180,189
     22         */
    NSString * CT = @"^1((33|53|77|8[09])[0-9]|349)\\d{7}$";
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    // NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if(([regextestmobile evaluateWithObject:cellNum] == YES)
       || ([regextestcm evaluateWithObject:cellNum] == YES)
       || ([regextestct evaluateWithObject:cellNum] == YES)
       || ([regextestcu evaluateWithObject:cellNum] == YES)){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)validateEmail:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

+ (NSString *)stringSequenceFromArray:(NSArray *)array
{
    NSString *string;
    for (int index = 0; index < array.count; index++) {
        if (index == 0) {
            string = array[index];
        } else {
            string = [string stringByAppendingString:[NSString stringWithFormat:@",%@", array[index]]];
        }
    }
    NSLog(@"string: %@", string);
    return string;
}

+ (NSString *)timeFormat:(NSString *)timeStr withFormatter:(NSString *)formatter isDividedThousand:(BOOL)divided //yyyy-MM-dd HH:mm:ss
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:formatter];
    
    //格式转换
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:divided ? ([timeStr longLongValue] / 1000) : ([timeStr longLongValue])];
    NSString *datestr = [dateFormatter stringFromDate:date];
    
    return datestr;
}

+ (NSString *)stringTrim:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

+ (NSAttributedString *)stringAttributes:(NSString *)string withHasPrefix:(NSString *)hasPrefix withSuffixColor:(NSString *)color
{
    NSUInteger strLength = string.length;
    NSInteger hasLength = hasPrefix.length;
    
    NSRange range = NSMakeRange(0, hasLength - 1);
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"000000"] range:range];
    
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:color] range:NSMakeRange(range.length + 1, strLength - 1 - range.length)];
    
//    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30.0] range:NSMakeRange(0, 5)];
//    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0] range:NSMakeRange(6, 12)];
//    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0] range:NSMakeRange(19, 6)];
    
    return attributedStr;
}

+ (NSAttributedString *)stringAttributes:(NSString *)currentText withDefaultColor:(NSString *)defaultColor withKeyword:(NSString *)keyword withKeyColor:(NSString *)keyColor
{
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:currentText];
    
    [attr setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:defaultColor]} range:NSMakeRange(0, attr.length)];
    
    if (keyword) {
        NSRange range = [currentText rangeOfString:keyword];
        [attr setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:keyColor]} range:range];
    }
    return attr;
}

+(NSString *) compareCurrentTime:(NSDate*) compareDate
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

+ (NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    
    while([scanner isAtEnd] == NO) {
        
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
//    NSString * regEx = @"<([^>]*)>";
//    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

//获取当前屏幕显示的ViewController
+ (UIViewController *)currentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

+ (NSDictionary *)filterNullInDictionary:(NSDictionary *)originalDic
{
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [tempDic setDictionary:originalDic];
    
    for (NSString *key in [tempDic allKeys]) {
        
        if ([[tempDic valueForKey:key] isKindOfClass:[NSNull class]]) {
            [tempDic setObject:@"" forKey:key];
        }
    }
    
    return tempDic;
}

+ (BOOL)isPureInt:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)isPureFloat:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

@end
