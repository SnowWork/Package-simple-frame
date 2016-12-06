//
//  FlagItem.m
//  04-注册界面
//
//  Created by xiaomage on 16/10/29.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "FlagItem.h"

@interface FlagItem ()

@end

@implementation FlagItem

+ (instancetype)flageItemWithDict:(NSDictionary *)dict {
    
    FlagItem *flagItem = [[self alloc] init];
    //[flagItem setValuesForKeysWithDictionary:dict];
    
    //什么是KVC?
    //通过字符串,跟属性进行匹配,如果有该属性,就给该属性赋值.
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //NSLog(@"key = %@, value = %@",key,obj);
        [flagItem setValue:obj forKey:key];
    }];
    
    /**
     
     flagItem setValue:obj forKey:
     1.根据key值进行匹配. 看有没有叫key值的set方法.如果有,就调用该set方法.
     2.如果没有set方法, 就会看有没有跟key值相同,并且带有下划线的成员属性.如果有就给这个属性进行赋值.
     3.如果没有.就会看有没有跟key值相同的成员属性.如果有就给这个属性进行赋值.
     4.如果还没有,就会调用当前类的setValue:(id)value forUndefinedKey:(NSString *)key
     5.如果说没有实现此方法, 就会报错.

     */

    return flagItem;
}

- (void)setIcon:(UIImage *)icon {
    
   UIImage *image =  [UIImage imageNamed:(NSString *)icon];
    _icon = image;
}



@end
