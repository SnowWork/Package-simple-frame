//
//  ViewController.m
//  04-注册界面
//
//  Created by xiaomage on 16/10/29.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+Test.h"


@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *countryTextF;
@property (weak, nonatomic) IBOutlet UITextField *cityTextF;
@property (weak, nonatomic) IBOutlet UITextField *birthTextF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

    
    
    
    self.countryTextF.delegate = self;
    self.birthTextF.delegate = self;
    self.cityTextF.delegate = self;

    
}


//是否允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //NSLog(@"%s",__func__);
    return YES;
}
//当开始编辑时调用
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    //NSLog(@"%s",__func__);
    [textField setInitText];
    
}
//是否允许结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}
//当结束编辑时调用
- (void)textFieldDidEndEditing:(UITextField *)textField {
     //NSLog(@"%s",__func__);
}
//是否允许改变文本内容
//等此方法执行完之后, 才决定要不要给文本框赋值.
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

//    NSLog(@"%@",string);
//    NSLog(@"---%@",self.countryTextF.text);
//    return YES;
    return NO;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
