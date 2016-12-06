//
//  FlagView.m
//  04-注册界面
//
//  Created by xiaomage on 16/10/29.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "FlagView.h"
#import "FlagItem.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end


@implementation FlagView

+ (instancetype)flagView {
   return   [[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil][0];
}
- (void)setFlagItem:(FlagItem *)flagItem {
    _flagItem = flagItem;
    
    //给内部子控件赋值
    self.titleLabel.text = flagItem.name;
    //在view当中,尽量少的处理业务逻辑.
    self.imageV.image = flagItem.icon;
    
}

@end
