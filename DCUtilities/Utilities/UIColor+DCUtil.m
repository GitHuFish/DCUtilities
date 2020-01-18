//
//  UIColor+DCUtil.m
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#import "UIColor+DCUtil.h"

@implementation UIColor (DCUtil)

// MARK: - Class Methods
+ (UIColor * _Nonnull)randomColor {
    CGFloat hue = (arc4random() % 256 / 256.f);                 // 0.0 to 1.0
    CGFloat saturation = (arc4random() % 128 / 256.f) + 0.5f;   // 0.5 to 1.0, away from white
    CGFloat brightness = (arc4random() % 128 / 256.f) + 0.5f;   // 0.5 to 1.0, away from black
    return [self colorWithHue:hue saturation:saturation brightness:brightness alpha:1.f];
    
//    CGFloat r = ( arc4random() % 255 / 255.0 ); // 0.0 to 1.0
//    CGFloat g = ( arc4random() % 255 / 255.0 ); // 0.5 to 1.0
//    CGFloat b = ( arc4random() % 255 / 255.0 ); // 0.5 to 1.0
//    return [self colorWithRed:r green:g blue:b alpha:1.f];
}

+ (UIColor * _Nonnull)colorWithHex:(UInt32)hex {
    return [self colorWithHex:hex alpha:1.f];
}

+ (UIColor * _Nonnull)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    return [self colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:alpha];
}

+ (UIColor * _Nonnull)colorWithHexString:(NSString * _Nonnull)hex {
    return [self colorWithHexString:hex alpha:1.0];
}

+ (UIColor * _Nonnull)colorWithHexString:(NSString * _Nonnull)hex alpha:(CGFloat)alpha {
    //去掉前后空格和换行符
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return self.clearColor;
    }
    
    // strip '0X' or '#' if it appears
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]) {
        cString = [cString substringFromIndex:2];
    } else if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return self.clearColor;
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.length = 2;
    // r
    range.location = 0;
    NSString *rString = [cString substringWithRange:range];
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [self colorWithRed:((float) r / 255.0f)
                        green:((float) g / 255.0f)
                         blue:((float) b / 255.0f)
                        alpha:alpha];
    
//    // hex
//    NSString *hexColor = @"#FF0000";
//    // 替换
//    hexColor = [hexColor stringByReplacingCharactersInRange:[hexColor rangeOfString:@"#" ] withString:@"0x"];
//    // 将十六进制字符串转成整型
//    long colorLong = strtoul([hexColor cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
//    // 通过位与方法获取三色值
//    int R = (colorLong & 0xFF0000 )>>16;
//    int G = (colorLong & 0x00FF00 )>>8;
//    int B = colorLong & 0x0000FF;
//    // 将 hex 转换成 color
//    return [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0];
}

+ (UIColor * _Nonnull)colorReverse:(nonnull id)color {
    // 1. color 转换 UIColor
    // 原色
    UIColor *primaryColor = self.clearColor;
    if ([color isKindOfClass:NSString.class]) {
        primaryColor = [self colorWithHexString:color];
    }
    if ([color isKindOfClass:UIColor.class]) {
        primaryColor = color;
    }
    // 2. 获取色值
    CGColorRef primaryColorRef = primaryColor.CGColor;
    size_t numComponents = CGColorGetNumberOfComponents(primaryColorRef);
    // rgba
    if (numComponents == 4) {
        CGFloat R = 0.f, G = 0.f, B = 0.f, A = 1.f;
        const CGFloat *components = CGColorGetComponents(primaryColorRef);
        R = components[0];
        G = components[1];
        B = components[2];
        A = components[3];
        // 反色
        UIColor *reverseColor = [self colorWithRed:1.f - R green:1.f - G blue:1.f - B alpha:A];
        return reverseColor;
    }
    // wa
    if (numComponents == 2) {
        CGFloat W = 0.f, A = 1.f;
        const CGFloat *components = CGColorGetComponents(primaryColorRef);
        W = components[0];
        A = components[1];
        // 反色
        UIColor *reverseColor = [self colorWithWhite:1.f - W alpha:A];
        return reverseColor;
    }
    return primaryColor;
}

+ (UIColor * _Nonnull)dynamicColorForWhite:(nonnull id)darkColor {
    return [self dynamicColorForAny:self.whiteColor forDarkMode:darkColor];
}

+ (UIColor * _Nonnull)autoDynamicColorForAny:(nonnull id)anyColor {
    return [self dynamicColorForAny:anyColor forDarkMode:[self colorReverse:anyColor]];
}

+ (UIColor * _Nonnull)dynamicColorForAny:(nonnull id)anyColor forDarkMode:(nonnull id)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                if ([darkColor isKindOfClass:UIColor.class]) return darkColor;
                if ([darkColor isKindOfClass:NSString.class]) return [self colorWithHexString:darkColor];
                return self.clearColor;
            }
            if ([anyColor isKindOfClass:UIColor.class]) return anyColor;
            if ([anyColor isKindOfClass:NSString.class]) return [self colorWithHexString:anyColor];
            return self.clearColor;
        }];
    } else {
        if ([anyColor isKindOfClass:UIColor.class]) return anyColor;
        if ([anyColor isKindOfClass:NSString.class]) return [self colorWithHexString:anyColor];
        return self.clearColor;
    }
}

// MARK: - Object Methods
- (UIColor * _Nonnull)colorReverse {
    // 获取色值
    CGColorRef primaryColorRef = self.CGColor;
    size_t numComponents = CGColorGetNumberOfComponents(primaryColorRef);
    // rgba
    if (numComponents == 4) {
        CGFloat R = 0.f, G = 0.f, B = 0.f, A = 1.f;
        const CGFloat *components = CGColorGetComponents(primaryColorRef);
        R = components[0];
        G = components[1];
        B = components[2];
        A = components[3];
        // 反色
        UIColor *reverseColor = [UIColor colorWithRed:1.f - R green:1.f - G blue:1.f - B alpha:A];
        return reverseColor;
    }
    // wa
    if (numComponents == 2) {
        CGFloat W = 0.f, A = 1.f;
        const CGFloat *components = CGColorGetComponents(primaryColorRef);
        W = components[0];
        A = components[1];
        // 反色
        UIColor *reverseColor = [UIColor colorWithWhite:1.f - W alpha:A];
        return reverseColor;
    }
    return self;
}

- (UIColor * _Nonnull)colorAutoDynamic {
    return [UIColor dynamicColorForAny:self forDarkMode:[self colorReverse]];
}

@end
