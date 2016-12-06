//
//  CountryTextF.m
//  04-注册界面
//
//  Created by xiaomage on 16/10/29.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "CountryTextF.h"
#import "FlagItem.h"
#import "FlagView.h"

@interface CountryTextF()<UIPickerViewDataSource,UIPickerViewDelegate>

/** 存放的是FlagItem模型 */
@property (nonatomic, strong) NSArray *flagArray;

@end

@implementation CountryTextF

- (NSArray *)flagArray {
    
    if (!_flagArray) {
        
      NSString *path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
      NSArray *array =  [NSArray arrayWithContentsOfFile:path];
      NSMutableArray *tempArray =  [NSMutableArray array];
        //把数组当中的每一个字典转成模型
        for (NSDictionary *dict in array) {
            //把字典转模型
            FlagItem *flagItem = [FlagItem flageItemWithDict:dict];
            [tempArray addObject:flagItem];
            
        }
        _flagArray = tempArray;
        
    }
    return _flagArray;
}

//只是要绑定了类.就会调用这个方法.
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
//command + option + shift + 方向

//高内聚:在同一个类中,把相同的代码写到同一个方法当中.
- (void)setUp {
    //修改键盘的类型
    UIPickerView *pickV = [[UIPickerView alloc] init];
    pickV.dataSource = self;
    pickV.delegate = self;
    self.inputView = pickV;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.flagArray.count;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    FlagView *flagV = [FlagView flagView];
    //获取当前行的模型
    FlagItem *item = self.flagArray[row];
    flagV.flagItem = item;
    
    return flagV;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 70;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //获取当前的行模型
    FlagItem *item = self.flagArray[row];
    self.text = item.name;
    
}

- (void)setInitText {
    [self pickerView:(UIPickerView *)self.inputView didSelectRow:0 inComponent:0];
}


@end
