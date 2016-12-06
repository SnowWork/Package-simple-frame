//
//  UIImage+image.m
//  05-带有边框圆形图片裁剪
//
//  Created by xiaomage on 16/11/7.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)


+ (UIImage *)imageWithBorder:(CGFloat)borderWH color:(UIColor *)borderColor image:(UIImage *)image{
    
    //0.加载图片
    //UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    //CGFloat borderWH = 10;
    //1.开启位图上下文
    
    CGSize size = CGSizeMake(image.size.width + 2 * borderWH, image.size.height + 2 * borderWH);
    UIGraphicsBeginImageContext(size);
    //2.绘制一个大圆.要显示出来的.
    UIBezierPath *bigC = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [bigC fill];
    //3.绘制一个小圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWH, borderWH, image.size.width, image.size.height)];
    //4.设置小圆为裁剪区域
    [path addClip];
    //5.把图片绘制到上下文当中.
    [image drawAtPoint:CGPointMake(borderWH, borderWH)];
    //6.从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //7.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
}



@end
