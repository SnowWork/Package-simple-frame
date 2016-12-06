//
//  TableViewController.m
//  07-个人详情页
//
//  Created by xiaomage on 16/11/1.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    /***
     
     导航条注意点
     1.凡是在导航在导航控制器下的scrollView. 在顶部都有自动添加一个偏移量
       把contentInSet属性设置{64, 0, 0, 0}
     2.导航条以及它里面的子控件设置透明度是没有效果的.
     3.设置导航条背景时,必须得要使用UIBarMetricsDefault
     4.如果导航条没有设置背景图片, 系统会自动创建一张白色半透明的图片,设置为背景.
     
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
    
    
    //不要试图去改变tableHeaderView的位置,宽度.
    UIView *headV = [[UIView alloc] initWithFrame:CGRectMake(1000, 1000, 1000, 300)];
    headV.backgroundColor = [UIColor redColor];
    
    self.tableView.tableHeaderView = headV;

    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
     NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
     NSLog(@"%@",NSStringFromUIEdgeInsets(self.tableView.contentInset));
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
