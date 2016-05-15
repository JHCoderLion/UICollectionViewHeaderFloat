//
//  JHHeaderReusableView.m
//  collectionView的首页
//
//  Created by 会跳舞的狮子 on 16/5/4.
//  Copyright © 2016年 会跳舞的狮子. All rights reserved.
//

#import "JHHeaderReusableView.h"
#import "JHHomeModel.h"
@interface JHHeaderReusableView ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end
@implementation JHHeaderReusableView

- (void)awakeFromNib {


}

/** 赋值 */
- (void)setHomeModel:(JHHomeModel *)homeModel
{
    _homeModel = homeModel;

    self.nameLabel.text = homeModel.tag_name;
    self.countLabel.text = homeModel.section_count;
    
    self.backgroundColor = [UIColor colorWithHexString:homeModel.color];
//    self.backgroundColor = JHRandomColor;
}
/** 点击头部视图的跳转 */
- (IBAction)clickHeader:(UIButton *)sender {
    
    JHLogFunc;
}

@end
