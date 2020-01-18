//
//  NSString+DCUtil.m
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#import "NSString+DCUtil.h"
#import "MethodSets.h"

@implementation NSString (DCUtil)

+ (CGFloat)maxWidthForStrings:(NSArray<NSString *> *)strings {
    CGFloat maxWidth = 0.f;
    for (NSString *string in strings) {
        CGFloat stringWidth = [MethodSets calculateWidthWithString:string withMinWidth:0.f withRegularHeight:MAXFLOAT withFontSize:kFontL];
        maxWidth = MAX(maxWidth, stringWidth);
    }
    return maxWidth;
}

@end
