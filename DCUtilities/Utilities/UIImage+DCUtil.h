//
//  UIImage+DCUtil.h
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DCUtil)

/// 压缩图片到指定尺寸大小
/// @param image 原始图片
/// @param size 目标大小
+ (UIImage *)compressImage:(UIImage *)image toSize:(CGSize)size;

/// 压缩图片至指定宽度
/// @param image 原图片
/// @param width 目标宽度
+ (UIImage *)compressImage:(UIImage *)image toWidth:(CGFloat)width;

/// 压缩图片到指定文件大小
/// @param image 原图片
/// @param kb 目标大小(最大值, kb)
+ (NSData *)compressImage:(UIImage *)image toKBytes:(CGFloat)kb;

@end

NS_ASSUME_NONNULL_END
