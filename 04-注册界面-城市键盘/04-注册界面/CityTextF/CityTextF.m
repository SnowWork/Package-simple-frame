//
//  CityTextF.m
//  04-注册界面
//
//  Created by xiaomage on 16/10/29.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "CityTextF.h"
#import "ProvinceItem.h"

@interface CityTextF ()<UIPickerViewDataSource,UIPickerViewDelegate>

//省份数组.里面装的都是ProvincesItem模型.
@property(nonatomic,strong) NSMutableArray *provincesDataArray;

//记录当前选中的省份的角标
@property(nonatomic, assign) NSInteger seleIndex;

/** <#属性#> */
//@property (nonatomic, weak) UIPickerView *pick;

@end


@implementation CityTextF

//懒加载省份数据
-(NSMutableArray *)provincesDataArray{
    
    if (_provincesDataArray == nil) {
        _provincesDataArray = [NSMutableArray array];
        //获取plist文件的路径
        NSString *filePath =  [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
        //从plist文件当中加载数据
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:filePath];
        //遍历数组当中的每一个元素.每一个元素都是一个字典,把字典转成模型
        for (NSDictionary *dict in tempArray) {
            //创建省份模型对象.快速的将字典转成模型
            ProvinceItem *item =  [ProvinceItem provincesItemWithDict:dict];
            //把转好的对象保存到数组当中.
            [_provincesDataArray addObject:item];
        }
    }
    return _provincesDataArray;
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
//高内聚:在同一个类中,把相同的代码写到同一个方法当中.
- (void)setUp {
    //修改键盘的类型
    UIPickerView *pickV = [[UIPickerView alloc] init];
    pickV.dataSource = self;
    pickV.delegate = self;
    self.inputView = pickV;
    //self.pick = pickV;
}





- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
//每一列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provincesDataArray.count;
    }else {
        //当前选中省份下,城市的个数来决定,
        ProvinceItem *proItem = self.provincesDataArray[self.seleIndex];
        return proItem.cities.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        //省份的列
        ProvinceItem *proItem =  self.provincesDataArray[row];
        return proItem.name;
    }else {
        //获取当前选中的省份
        ProvinceItem *proItem = self.provincesDataArray[self.seleIndex];
        return proItem.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        NSLog(@"%ld",row);
        self.seleIndex = row;
        //重新执行数据源代理方法
        [pickerView reloadAllComponents];
        //让第一列滚动到第0行
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    //把当前选中省份下的名称,和城市名称显示到文本框当中.
    //获取当前选中的省份
    ProvinceItem *proItem = self.provincesDataArray[self.seleIndex];
    //获取城市名称
    //在第1列当中选中的行号
    NSInteger cityRow = [pickerView selectedRowInComponent:1];
    NSString *cityName =  proItem.cities[cityRow];
    self.text = [NSString stringWithFormat:@"%@-%@",proItem.name, cityName];
    
}


//初始化文字
- (void)setInitText {
    [self pickerView:(UIPickerView *)self.inputView didSelectRow:0 inComponent:0];
}



@end
