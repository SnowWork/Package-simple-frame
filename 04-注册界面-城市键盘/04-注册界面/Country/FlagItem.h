//
//  FlagItem.h
//  04-注册界面
//
//  Created by xiaomage on 16/10/29.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlagItem : NSObject

//在kvc转的时候,不管这里写的是什么类型, 它只转它的真实类型.
@property (nonatomic ,strong) UIImage *icon;
@property (nonatomic ,copy) NSString *name;

+ (instancetype)flageItemWithDict:(NSDictionary *)dict;

@end
