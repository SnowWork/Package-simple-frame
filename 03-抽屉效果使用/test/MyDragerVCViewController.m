

#import "MyDragerVCViewController.h"
#import "TableViewController.h"

@interface MyDragerVCViewController ()

@end

@implementation MyDragerVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    TableViewController *tableVC = [[TableViewController alloc] init];
    tableVC.view.frame = self.mainV.bounds;
    [self.mainV addSubview:tableVC.view];
    //如果说一个控制器的View成为另一个控制器View的子控件.
    //那么这个控制器也要成为另一个控制器的子控制器.
    [self addChildViewController:tableVC];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
