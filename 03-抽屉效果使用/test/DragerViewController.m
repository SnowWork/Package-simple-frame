

#import "DragerViewController.h"

#define screenW [UIScreen mainScreen].bounds.size.width

@interface DragerViewController ()



@end

@implementation DragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加子控件
    [self setUp];
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainV addGestureRecognizer:pan];
    
    //添加点按手势做复位
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    

}

- (void)tap {
    [UIView animateWithDuration:0.5 animations:^{
        //做复位
        self.mainV.frame = self.view.bounds;
    }];
   
}



#define targetR 275
#define targetL -275

- (void)pan:(UIPanGestureRecognizer *)pan {
    
    //获取偏移量 pan.view = self.mainV;
    CGPoint transP = [pan translationInView:pan.view];
    
    //平移
    //self.mainV.transform = CGAffineTransformTranslate(self.mainV.transform, transP.x, 0);
//    CGRect frame = self.mainV.frame;
//    frame.origin.x += transP.x;
//    self.mainV.frame = frame;
    
    self.mainV.frame = [self frameWithoffsetX:transP.x];
    
    if (self.mainV.frame.origin.x > 0) {
        //往右
        self.rightV.hidden = YES;
    }else if (self.mainV.frame.origin.x < 0){
        //往左
        self.rightV.hidden = NO;
    }
    
    //判断手势状态
    CGFloat target = 0;
    if (pan.state == UIGestureRecognizerStateEnded) {
        //自动定位.
        //当x值大于屏幕宽度一半时,定位到右侧
        if (self.mainV.frame.origin.x > screenW * 0.5) {
            target = targetR;
        }else if(CGRectGetMaxX(self.mainV.frame) < screenW * 0.5) {
              //当最大x值小于屏幕宽度一半时,定位到左侧
            target = targetL;
        }
        
        //开始定位.
        CGFloat offset = target - self.mainV.frame.origin.x;
        NSLog(@"offset===%f",offset);
        [UIView animateWithDuration:0.5 animations:^{
            self.mainV.frame = [self frameWithoffsetX:offset];
        }];
      
    }
    
    
    //复位操作
    [pan setTranslation:CGPointZero inView:self.mainV];    
}

#define maxY 100
//根据一个偏移量,求mainV的frame.
- (CGRect)frameWithoffsetX:(CGFloat)offsetX {
    CGRect frame = self.mainV.frame;
    NSLog(@"frame.origin.x%f",frame.origin.x);
    frame.origin.x += offsetX;
    NSLog(@"frame.origin.x%f",frame.origin.x);
    
    //取绝对值
    frame.origin.y = fabs(frame.origin.x * maxY / [UIScreen mainScreen].bounds.size.width);
    NSLog(@"%f",frame.origin.y);
    //计算高度
    frame.size.height = [UIScreen mainScreen].bounds.size.height - (2 * frame.origin.y);
    
    return frame;
}




 //添加子控件
- (void)setUp {
    //添加子控件
    UIView *leftV = [[UIView alloc] initWithFrame:self.view.bounds];
    leftV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:leftV];
    //self.leftV = leftV;
    _leftV = leftV;
    UIView *rightV = [[UIView alloc] initWithFrame:self.view.bounds];
    rightV.backgroundColor = [UIColor greenColor];
    [self.view addSubview:rightV];
    //self.rightV = rightV;
    _rightV = rightV;
    UIView *mainV = [[UIView alloc] initWithFrame:self.view.bounds];
    mainV.backgroundColor = [UIColor redColor];
    [self.view addSubview:mainV];
    //self.mainV = mainV;
    _mainV = mainV;
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
