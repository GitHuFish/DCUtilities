//
//  DCDefines.h
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#ifndef DCDefines_h
#define DCDefines_h

// MARK: 系统 safeAreaInsets, iOS 11 及之后有效
#define SAFEAREA_INSETS             UIApplication.sharedApplication.keyWindow.safeAreaInsets
#define SAFEAREA_BOTTOM             UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom

// MARK: 系统 控件尺寸
#define HEIGHT_STATUSBAR            [[UIApplication sharedApplication] statusBarFrame].size.height
#define HEIGHT_NAVIBAR              self.navigationController.navigationBar.frame.size.height
#define HEIGHT_TOPBAR               (HEIGHT_STATUSBAR + HEIGHT_NAVIBAR)
#define HEIGHT_BOTTOMBAR            (SAFEAREA_BOTTOM + kTabBarHeight)

// MARK: 屏幕尺寸
#define SIZE_SCREEN                 [UIScreen mainScreen].bounds.size
#define WIDTH_SCREEN                [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN               [UIScreen mainScreen].bounds.size.height

// MARK: UIWindow 尺寸
//#define SIZE_WINDOW                 (([UIApplication sharedApplication].delegate)).window.bounds.size
//#define WIDTH_WINDOW                (([UIApplication sharedApplication].delegate)).window.bounds.size.width
//#define HEIGHT_WINDOW               (([UIApplication sharedApplication].delegate)).window.bounds.size.height
//#define SIZE_WINDOW                 ((AppDelegate *)([UIApplication sharedApplication].delegate)).window.bounds.size
//#define WIDTH_WINDOW                ((AppDelegate *)([UIApplication sharedApplication].delegate)).window.bounds.size.width
//#define HEIGHT_WINDOW               ((AppDelegate *)([UIApplication sharedApplication].delegate)).window.bounds.size.height

// MARK: 颜色
#define RGBA(r, g, b, a)            [UIColor colorWithRed:(r / 255.f) green:(g / 255.f) blue:(b / 255.f) alpha:a]
#define RGB(r, g, b)                RGBA(r, g, b, 1.f)
#define RANDOMCOLOR                 [UIColor colorWithRed:random() % 255 / 255.f green:random() % 255 / 255.f blue:random() % 255 / 255.f alpha:1.f]

// MARK: 持久化 SET
#define USERDEFAULTS_OBJ_SET(key, value)    [[NSUserDefaults standardUserDefaults] setObject:(value) forKey:(key)];\
[[NSUserDefaults standardUserDefaults] synchronize];
#define USERDEFAULTS_INT_SET(key, value)    [[NSUserDefaults standardUserDefaults] setInteger:(value) forKey:(key)];\
[[NSUserDefaults standardUserDefaults] synchronize];
#define USERDEFAULTS_BOOL_SET(key, value)   [[NSUserDefaults standardUserDefaults] setBool:(value) forKey:(key)];\
[[NSUserDefaults standardUserDefaults] synchronize];

// MARK: 持久化 GET
#define USERDEFAULTS_OBJ(key)       [[NSUserDefaults standardUserDefaults] objectForKey:(key)]
#define USERDEFAULTS_INT(key)       [[NSUserDefaults standardUserDefaults] integerForKey:(key)]
#define USERDEFAULTS_BOOL(key)      [[NSUserDefaults standardUserDefaults] boolForKey:(key)]

// MARK: 持久化 REMOVE
#define USERDEFAULTS_REMOVE(key)    [[NSUserDefaults standardUserDefaults] removeObjectForKey:(key)]

// MARK: 角度 / 弧度 转换
#define ANGLE2RADIAN(degree)        (M_PI * (degree) / 180.f)
#define RADIAN2ANGLE(degree)        ((degree) * 180.f / M_PI)

// MARK: 文件管理(常用路径)
// Document
#define PATHDOCUMENT                [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
// Document: 文件下载路径
#define PATHDOWNLOAD                [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Download"]
// Document: 测试路径
#define TEST                        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Test"]

// MARK: 设备信息
// 设备类型: iPhone / iPad ...
#define DEVICETYPE                  [[UIDevice currentDevice] model]
#define DEVICEIDIOM                 [UIDevice currentDevice].userInterfaceIdiom
//#define DEVICEIDIOM                 UI_USER_INTERFACE_IDIOM()
#define PAD                         (DEVICEIDIOM == UIUserInterfaceIdiomPad)
//#define PAD                         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define PHONE                       (DEVICEIDIOM == UIUserInterfaceIdiomPhone)
//#define PHONE                       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// 系统版本
#define SYSTEMVERSION                               [[UIDevice currentDevice] systemVersion]
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// MARK: LOG
#ifdef DEBUG
#define NSLog(...)  NSLog(@"\n\n line: %d \n %s \n %@", __LINE__, __func__, [NSString stringWithFormat:__VA_ARGS__]);
#else
#define NSLog(...)
#endif /* DEBUG */

// MARK: 其他
#define NULLSTRING(string) (string == nil || (NSNull *)string == [NSNull null] || [string isEqualToString:@""])

// MARK: - 非通用
// MARK: 读取语言
#define LANGUAGE(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:kAppLanguage]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Languages"]

#endif /* DCDefines_h */
