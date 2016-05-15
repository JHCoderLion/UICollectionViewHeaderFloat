//
//  JHHomeModel.h
//  collectionView的首页
//
//  Created by 会跳舞的狮子 on 16/5/4.
//  Copyright © 2016年 会跳舞的狮子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHBodyModel.h"
@interface JHHomeModel : NSObject
/** 颜色 */
@property (nonatomic, copy) NSString *color;

/** 名字 */
@property (nonatomic, copy) NSString *tag_name;

/** 精选个数 */
@property (nonatomic, copy) NSString *section_count;

/** 数组  */
@property (nonatomic, strong) NSArray *body;

+ (instancetype)homeWithDict:(NSDictionary *)dict;

@end
