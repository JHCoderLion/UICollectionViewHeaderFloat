//
//  JHBodyModel.m
//  collectionView的首页
//
//  Created by 会跳舞的狮子 on 16/5/4.
//  Copyright © 2016年 会跳舞的狮子. All rights reserved.
//

#import "JHBodyModel.h"

@implementation JHBodyModel
+ (instancetype)bodyWithDict:(NSDictionary *)dict
{
    JHBodyModel *body = [[JHBodyModel alloc] init];
    body.poi_name = dict[@"poi_name"];
    body.imageURL = dict[@"imageURL"];
    body.section_title = dict[@"section_title"];
    body.fav_count = dict[@"fav_count"];
    
    return body;
}
@end
