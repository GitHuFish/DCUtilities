//
//  DCConsts.h
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#ifndef DCConsts_h
#define DCConsts_h

// MARK: - 长度 / 宽度 / 高度 常量
static float const kTabBarHeight            = 49.f;
static float const kNavigationBarHeight     = 44.f;

// MARK: - 字号
static float const kFontS                   = 13.f;
static float const kFontM                   = 14.f;
static float const kFontL                   = 15.f;
static float const kFontXL                  = 16.f;
static float const kFontXXL                 = 17.f;
static float const kFontXXXL                = 18.f;

// MARK: - 常用颜色值
// !!!: 如果是 iOS 11 及以上版本, 建议使用 colorNamed:
static NSString * const kColor000           = @"#000000";
static NSString * const kColor333           = @"#333333";
static NSString * const kColor666           = @"#666666";
static NSString * const kColor999           = @"#999999";
static NSString * const kColorAAA           = @"#AAAAAA";
static NSString * const kColorBBB           = @"#BBBBBB";
static NSString * const kColorCCC           = @"#CCCCCC";
static NSString * const kColorDDD           = @"#DDDDDD";
static NSString * const kColorEEE           = @"#EEEEEE";
static NSString * const kColorFFF           = @"#FFFFFF";
// 主色调
static NSString * const kColorMain          = @"#";
// 导航栏色调
static NSString * const kColorNavigation    = @"#";
// 分割线色调
static NSString * const kColorSeprator      = @"#";

// MARK: - NSUserDefaults Key / Flag for NSUserDefaults
// App 语言
static NSString * const kAppLanguage        = @"APPLANGUAGE";

#endif /* DCConsts_h */
