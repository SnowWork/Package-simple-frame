//
//  ViewController.m
//  08-UIScrollView分页功能01-
//
//  Created by xiaomage on 16/10/17.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "ViewController.h"
#import "XMGPageView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XMGPageView *pageView = [XMGPageView pageView];
    pageView.backgroundColor = [UIColor redColor];
    pageView.center = CGPointMake(200, 200);
//    pageView.frame = CGRectMake(20, 20, 350, 170);
    pageView.imageNames = @[@"img_01",@"img_02",@"img_03",@"img_04",@"img_05"];
    [self.view addSubview:pageView];
    
//    pageView.imageNames = @[@"img_01",@"img_02"];
    
}

@end
