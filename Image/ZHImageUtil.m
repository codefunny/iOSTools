//
//  ZHImageUtil.m
//
//  Created by peter zheng on 14/10/24.
//  Copyright (c) 2014年 codefunny. All rights reserved.
//

#import "ZHImageUtil.h"

@implementation ZHImageUtil

//添加文字水印
+ (UIImage *)addText:(UIImage *)useImage text:(NSString *)text
{
    float width = useImage.size.width;
    float height = useImage.size.height;
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    [text drawAtPoint:CGPointMake(width/2, height-20) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Georgia" size:15],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

//图片
+ (UIImage *)waterMark:(UIImage *)useImage andImage:(UIImage *)newImage
{
    float width = useImage.size.width;
    float height = useImage.size.height;
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    [newImage drawInRect:CGRectMake(width/2, height-20, 18, 18)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

//图片和文字
+ (UIImage *)waterMark:(UIImage *)useImage andImage:(UIImage *)newImage text:(NSString *)text
{
    float width = useImage.size.width;
    float height = useImage.size.height;
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    [newImage drawInRect:CGRectMake(width/2, height-20, 18, 18)];
    [text drawAtPoint:CGPointMake(width/2 + 25, height-20) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Georgia" size:15],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

//截屏
+ (UIImage *)ScreenShot:(UIView *)view
{
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    
    UIGraphicsBeginImageContext(mainRect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillRect(context, mainRect);
    [view.layer renderInContext:context];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
