//
//  MethodSets.h
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DCConsts.h"

@interface MethodSets : NSObject

/**
 * @brief 获取设备号
 */
+ (NSString *)getUUID;

/**
 UUID

 @return uuid
 */
+ (NSString *)createUUID;

/**
 * @brief 获取系统版本号
 */
+ (NSInteger)getSystemVersion;

/**
 * @brief 获取设备型号
 */
//+ (NSString *)getCurrentDeviceModel;

/**
 * @brief 获取App当前版本号
 */
+ (NSString *)appVersion;


/**
 获取 App Build 版本

 @return Build 版本号
 */
+ (NSString *)appBuildVersion;

/**
 获取 App 名称

 @return  App 名称
 */
+ (NSString *)appName;

/**
 * @brief 获取当前系统语言
 */
+ (NSString *)getPreferredLanguage;

/**
 * @brief 获取键盘高度
 */
+ (NSInteger)keyboardHeight:(NSNotification *)notification;

/**
 * @brief 高度固定, 根据文字计算宽度
 */
+ (CGFloat)calculateWidthWithString:(NSString *)string withMinWidth:(CGFloat)minWidth withRegularHeight:(CGFloat)regularHeight withFontSize:(CGFloat)fontSize;

/**
 * @brief 宽度固定, 根据文字计算高度
 */
+ (CGFloat)calculateHeightWithString:(NSString *)string withMinHeight:(CGFloat)minHeight withRegularWidth:(CGFloat)regularWidth withFontSize:(CGFloat)fontSize;

/**
 * @brief MD5--加密小写算法
 */
//+ (NSString *)stringFromMD5:(NSString *)string;

/**
 * @brief 签名算法
 */
//+ (NSString *)signFromField:(NSDictionary *)dic;

/**
 * @brief 签名算法
 */
//+ (NSString *)signFromModel:(JSONModel *)model;

/**
 * @brief 获取model所有属性
 */
//+ (NSArray *) allPropertyNamesFromModel:(JSONModel *)model;

/**
 * @brief 冒泡排序
 */
+ (NSMutableArray *)bubbleSort:(NSMutableArray *)tempArr;

/**
 * @brief 最新的验证是否是手机号码的正则表达式
 * @param mobileNum 手机号
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 * @brief 验证是否是合法邮箱地址
 * @param email 邮箱地址
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 * @brief 将数组元素依次排成字符串, 中间以","分割
 * @param array 需要转为字符串的数组
 */
+ (NSString *)stringSequenceFromArray:(NSArray *)array;

/**
 * @brief 时间格式化
 * @param timeStr 时间戳; formatter--时间格式; divided--是否除以1000
 * hh与HH的区别:分别表示12小时制,24小时制
 */
+ (NSString *)timeFormat:(NSString *)timeStr withFormatter:(NSString *)formatter isDividedThousand:(BOOL)divided;

/**
 * @brief 删除字符串首尾的空格, 无论空格有多少个, 字符串中间不处理.
 * @param string 传入的字符串
 */
+ (NSString *)stringTrim:(NSString *)string;

/**
 * @brief 文本处理, 根据需求控制某段文字颜色
 * @param string 需要处理的字符串
 */
+ (NSAttributedString *)stringAttributes:(NSString *)string withHasPrefix:(NSString *)hasPrefix withSuffixColor:(NSString *)color;

/**
 * @brief 指定字符串里相关词汇高亮显示
 * @param currentText 文本; keyword--关键词
 */
+ (NSAttributedString *)stringAttributes:(NSString *)currentText withDefaultColor:(NSString *)defaultColor withKeyword:(NSString *)keyword withKeyColor:(NSString *)keyColor;

/**
 * @brief 获取指定时间和当前时间的时间差
 * @param compareDate 指定时间
 */
+ (NSString *)compareCurrentTime:(NSDate*)compareDate;

/**
 * @brief 去除html代码中的节点, 只剩文字
 * @param html HTML字符串
 */
+ (NSString *)filterHTML:(NSString *)html;

/**
 * @brief 获取当前屏幕显示的ViewController
 */
+ (UIViewController *)currentVC;

/**
 * @brief 将Dictionary中的<null>值覆盖为@""
 */
+ (NSDictionary *)filterNullInDictionary:(NSDictionary *)originalDic;

/**
 * @brief 判断是否为整形
 * @param string 字符串
 */
+ (BOOL)isPureInt:(NSString*)string;

/**
 * @brief 判断是否为浮点形
 * @param string 字符串
 */
+ (BOOL)isPureFloat:(NSString*)string;

@end
