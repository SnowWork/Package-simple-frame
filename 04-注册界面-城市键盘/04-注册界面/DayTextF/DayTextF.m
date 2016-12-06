//
//  DayTextF.m
//  04-注册界面
//
//  Created by xiaomage on 16/10/29.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "DayTextF.h"

@implementation DayTextF

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     [self setUp];
    }
    return self;
}
- (void)setUp {
    
    UIDatePicker *dataPickV = [[UIDatePicker alloc] init];
    //修改日期格式
    dataPickV.datePickerMode = UIDatePickerModeDate;
    //设置地区
    dataPickV.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];

    //监听日期改变
    [dataPickV addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    //修改键盘的类型
    self.inputView = dataPickV;
    
}
- (void)change:(UIDatePicker *)datePickV {
    
    //获取当前选中的日期
    NSDate *date = datePickV.date;
    //把日期转成字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateString = [fmt stringFromDate:date];

    //设置日期
    self.text = dateString;
}
- (void)setInitText {
    [self change:(UIDatePicker *)self.inputView];
}



@end
