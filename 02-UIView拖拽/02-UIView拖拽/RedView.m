//
//  RedView.m
//  02-UIView拖拽
//
//  Created by xiaomage on 16/11/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "RedView.h"

@implementation RedView

//NSSet与NSArray相似
//不同点.NSSet元素它是无序的.
//NSArray 元素它是有序的.

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //NSArray *array = [touches allObjects];
    
    UITouch *touch = [touches anyObject];
    //1.获取当前手指的点
    CGPoint curP = [touch locationInView:self];
    NSLog(@"curP = %@",NSStringFromCGPoint(curP));
    //2.获取上一个手指的点
    CGPoint preP = [touch previousLocationInView:self];
    NSLog(@"preP = %@",NSStringFromCGPoint(preP));
    //3.计算x方向的偏移量
    CGFloat offsetX = curP.x - preP.x;
    //4.计算y方向的偏移量
    CGFloat offsetY = curP.y - preP.y;
    //5.移动位置
    CGPoint center = self.center;
    center.x += offsetX;
    center.y += offsetY;
    self.center = center;
    
}

@end
