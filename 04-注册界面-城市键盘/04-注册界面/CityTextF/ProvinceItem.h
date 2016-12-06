//
//  ProvinceItem.h
//  03-拦截用户输入
//


#import <Foundation/Foundation.h>

@interface ProvinceItem : NSObject

//每个省下面的城市
@property (nonatomic, strong) NSArray *cities;
//省的名称
@property (nonatomic, strong) NSString *name;
//将一个字典转成模型
+ (instancetype)provincesItemWithDict:(NSDictionary *)dict;


@end
