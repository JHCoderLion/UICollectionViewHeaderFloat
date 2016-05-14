//
//  JHHeaderReusableView.h
//  collectionView的首页
//
//  Created by 会跳舞的狮子 on 16/5/4.
//  Copyright © 2016年 会跳舞的狮子. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHHomeModel;
@interface JHHeaderReusableView : UICollectionReusableView

/** 模型属性  */
@property (nonatomic, strong) JHHomeModel *homeModel;


@end
