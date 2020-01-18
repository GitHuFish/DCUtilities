//
//  UIColor+DCUtil.h
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (DCUtil)

// MARK: - Class Methods
/// 随机颜色
+ (UIColor * _Nonnull)randomColor;

/// 十六进制颜色 -> RGB
/// @param hex 十六进制色值, 如 0xFFFFFF
+ (UIColor * _Nonnull)colorWithHex:(UInt32)hex;

/// 十六进制颜色 -> RGB
/// @param hex 十六进制色值, 如 0xFFFFFF
/// @param alpha 透明度
+ (UIColor * _Nonnull)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;

/// 十六进制颜色(字符串) -> RGB
/// @param hex 十六进制色值, 如 #FFFFFF
+ (UIColor * _Nonnull)colorWithHexString:(NSString * _Nonnull)hex;

/// 十六进制颜色(字符串) -> RGB
/// @param hex 十六进制色值, 如 #FFFFFF
/// @param alpha 透明度
+ (UIColor * _Nonnull)colorWithHexString:(NSString * _Nonnull)hex alpha:(CGFloat)alpha;

/// 反色
/// @param color 原色, hex 字符串或 UIColor
+ (UIColor * _Nonnull)colorReverse:(nonnull id)color;

/// 适配深色模式, 任意模式颜色为白色的动态颜色
/// @param darkColor 深色模式颜色
+ (UIColor * _Nonnull)dynamicColorForWhite:(nonnull id)darkColor;

/// 适配深色模式, 自动取反色值
/// @param anyColor 任意模式颜色
+ (UIColor * _Nonnull)autoDynamicColorForAny:(nonnull id)anyColor;

/// 适配深色模式, 动态颜色
/// @param anyColor 任意模式颜色
/// @param darkColor 深色模式颜色
+ (UIColor * _Nonnull)dynamicColorForAny:(nonnull id)anyColor forDarkMode:(nonnull id)darkColor;

// MARK: - Object Methods
/// 反色
- (UIColor * _Nonnull)colorReverse;

/// 适配深色模式, 动态颜色
- (UIColor * _Nonnull)colorAutoDynamic;

@end

NS_ASSUME_NONNULL_END
