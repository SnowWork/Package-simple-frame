//
//  PersonDetailVC.m
//  07-个人详情页
//
//  Created by xiaomage on 16/11/1.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "PersonDetailVC.h"
#import "UIImage+Image.h"

@interface PersonDetailVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCons;

@end

@implementation PersonDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    //设置数据源,和代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    /***
     
     导航条注意点
     1.凡是在导航在导航控制器下的scrollView. 在顶部都有自动添加一个偏移量
     把contentInSet属性设置{64, 0, 0, 0}
     2.导航条以及它里面的子控件设置透明度是没有效果的.
     3.设置导航条背景时,必须得要使用UIBarMetricsDefault
     4.如果导航条没有设置背景图片, 系统会自动创建一张白色半透明的图片,设置为背景.
     
     如何求一个变化的值?
     求变化的值. 找最大值. 最大等于大少
     1.最大等于大少.1
     2.什么情况下最大.
     
     
     */
    //不让ScrollView自动调整内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //隐藏导航条
    //self.navigationController.navigationBar.hidden = YES;
    
    //设置导航条的透明度()
    //self.navigationController.navigationBar.alpha = 0;
    
    //设置导航条背景
    //[self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
    //设置tableView的上部的内边距
    //当设置内边距时会自动调用scrollViewDidScroll
    self.tableView.contentInset = UIEdgeInsetsMake(244, 0, 0, 0);
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.text = @"个人详情页";
    [titleL sizeToFit];
    titleL.textColor = [UIColor colorWithWhite:0 alpha:0];
    self.navigationItem.titleView = titleL;

}

#define oriOffsetY -244
#define oriH 200
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat offset = scrollView.contentOffset.y - oriOffsetY;
    CGFloat h  = oriH - offset;
    if (h <= 64) {
        h = 64;
    }
    self.heightCons.constant = h;
    
    //把颜色生成一张图片,改颜色的透明度
    //求变化的值. 找最大值. 最大等于大少
    //1.最大等于大少.1
    //2.什么情况下最大.
    NSLog(@"offset = %f",offset);
    CGFloat alpha = offset * 1 / 136.0;
    if (alpha >= 1) {
        alpha = 0.99;
    }
    
    UILabel *titleL = (UILabel *)self.navigationItem.titleView;
    titleL.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
    
    
    //设置背景
    UIColor *color = [UIColor colorWithWhite:1 alpha:alpha];
    UIImage *image = [UIImage imageWithColor:color];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"xmg";
    
    
    return cell;
}



@end
