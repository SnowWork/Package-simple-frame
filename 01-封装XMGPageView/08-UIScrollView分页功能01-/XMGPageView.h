//
//  XMGPageView.h
//  08-UIScrollView分页功能01-
//
//  Created by xiaomage on 16/10/18.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGPageView : UIView

/** 图片数据 */
@property (nonatomic, strong) NSArray *imageNames;


+ (instancetype)pageView;
@end
