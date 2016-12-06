//
//  ProvinceItem.m
//  03-拦截用户输入
//


#import "ProvinceItem.h"

@implementation ProvinceItem

+(instancetype)provincesItemWithDict:(NSDictionary *)dict{
    //创建模型
    ProvinceItem *item = [[self alloc] init];
    //通过KVC将字典中的key,给item对象当中的属性进行赋值.
    [item setValuesForKeysWithDictionary:dict];
    //返回一个赋值好的模型.
    return item;
}



@end
