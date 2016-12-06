//
//  UIImage+image.h
//  05-带有边框圆形图片裁剪
//
//  Created by xiaomage on 16/11/7.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)


+  (UIImage *)imageWithBorder:(CGFloat)borderWH color:(UIColor *)borderColor image:(UIImage *)image;

@end
