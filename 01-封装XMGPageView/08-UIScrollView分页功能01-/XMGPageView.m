//
//  XMGPageView.m
//  08-UIScrollView分页功能01-
//
//  Created by xiaomage on 16/10/18.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "XMGPageView.h"

@interface XMGPageView () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

/** 定时器 */
@property (nonatomic ,weak) NSTimer *timer;
@end
@implementation XMGPageView

- (void)awakeFromNib
{
    [super awakeFromNib];
    // 1.设置单页的时候是否隐藏pageControl
    self.pageControl.hidesForSinglePage = YES;

    
    // 2.设置pageControl显示的图片(KVC)
    [self.pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
    
    // 3.开启定时器
    [self startTimer];

}


+ (instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    // 0.移除之前添加的imageView
//    for (UIImageView *imageView in self.scrollView.subviews) {
//        [imageView removeFromSuperview];
//    }
    // makeObjectsPerformSelector会让数组中每一个对象都执行一次removeFromSuperview
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 1.根据传入的图片数据创建imageView添加到scrollView中
   
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    
    NSUInteger count = imageNames.count;
    for (int i = 0; i < count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    
    // 2.设置contentSize
    // 这里的0 表示 在垂直方向不可以滚动
    self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);

    // 3.设置总页数
    self.pageControl.numberOfPages = count;
}

#pragma mark - 定时器相关的方法
- (void)startTimer
{
    // 返回一个自动执行任务的定时器对象
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    
    // 将定时器添加到RunLoop中,以NSRunLoopCommonModes添加
    // NSDefaultRunLoopMode (默认):同一时间只能执行一个任务
    // NSRunLoopCommonModes (公用):可以分配一定的时间处理其它任务
    // 目的:不管主线程在做什么操作,都要分配一定的时间处理定时器
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
    //    self.timer = nil;
}
// 滚动到下一页
- (void)nextPage:(NSTimer *)timer
{
    // 计算下一页的页码
    NSInteger page = self.pageControl.currentPage + 1;
    
    // 超过最后一页
    if (page == 5) {
        page = 0;
    }
    
    // 滚动到下一页
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 四舍五入: (int)(小数 + 0.5)
    // 0.4 -> 0  (int)(0.4 + 0.5) -> 0
    // 0.7 -> 1  (int)(0.7 + 0.5) -> 1
    // 1.4 -> 1  (int)(1.4 + 0.5) -> 1
    // 1.6 -> 2  (int)(1.6 + 0.5) -> 2
    // 计算页码
    int page = (int)(self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5);
    
    // 设置页码
    self.pageControl.currentPage = page;
}

// 用户即将开始拖拽时,停止定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

// 用户已经停止拖拽时,开启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

@end
