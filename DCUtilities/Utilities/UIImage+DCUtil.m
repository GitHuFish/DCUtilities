//
//  UIImage+DCUtil.m
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#import "UIImage+DCUtil.h"

@implementation UIImage (DCUtil)

/// 压缩图片到指定尺寸大小
/// @param image 原始图片
/// @param size 目标大小
+ (UIImage *)compressImage:(UIImage *)image toSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0.f, 0.f, size.width, size.height)];
    // 从上下文中获取绘制好的图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

/// 压缩图片至指定宽度
/// @param image 原图片
/// @param width 目标宽度
+ (UIImage *)compressImage:(UIImage *)image toWidth:(CGFloat)width {
    // 获取原图片的大小尺寸
    CGSize imageSize = image.size;
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    // 根据目标图片的宽度计算目标图片的高度
    CGFloat height = (width / imageWidth) * imageHeight;
    // 开启图片上下文
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    // 绘制图片
    [image drawInRect:CGRectMake(0,0, width, height)];
    // 从上下文中获取绘制好的图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    
    return resultImage;
}

/// 压缩图片到指定文件大小
/// @param image 原图片
/// @param kb 目标大小(最大值, kb)
+ (NSData *)compressImage:(UIImage *)image toKBytes:(CGFloat)kb {
    NSData *imageData = UIImageJPEGRepresentation(image, 1.f);
    CGFloat imageKBytes = imageData.length / 1024.f;
    CGFloat compressionQuality = 1.f;
    CGFloat kbytes = imageKBytes;
    while (imageKBytes > kb && compressionQuality > 0.01f) {
        compressionQuality = compressionQuality - 0.01f;
        imageData = UIImageJPEGRepresentation(image, compressionQuality);
        imageKBytes = imageData.length / 1024.f;
        if (kbytes == imageKBytes) {
            break;
        } else {
            kbytes = imageKBytes;
        }
    }
    return imageData;
}

@end
