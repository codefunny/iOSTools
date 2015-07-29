//
//  ZHImageUtil.h
//  
//
//  Created by peter zheng on 14/10/24.
//  Copyright (c) 2014年 codefunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHImageUtil : NSObject

//添加文字
+(UIImage *)addText:(UIImage *)image text:(NSString *)text;

//添加图片
+ (UIImage *)waterMark:(UIImage *)useImage andImage:(UIImage *)newImage;

//添加图片和文字
+ (UIImage *)waterMark:(UIImage *)useImage andImage:(UIImage *)newImage text:(NSString *)text;

//截屏
+ (UIImage *)ScreenShot:(UIView *)view;

@end
