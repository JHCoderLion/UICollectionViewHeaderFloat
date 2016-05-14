//
//  JHHomeModel.m
//  collectionView的首页
//
//  Created by 会跳舞的狮子 on 16/5/4.
//  Copyright © 2016年 会跳舞的狮子. All rights reserved.
//

#import "JHHomeModel.h"

@implementation JHHomeModel
+ (instancetype)homeWithDict:(NSDictionary *)dict
{
    JHHomeModel *home = [[JHHomeModel alloc] init];
    home.tag_name = dict[@"tag_name"];
    home.section_count  = dict[@"section_count"];
    home.color = dict[@"color"];
    
    //字典数组转模型
    //保存模型的临时数组
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dictArray in dict[@"body"]) {
        JHBodyModel *body = [JHBodyModel bodyWithDict:dictArray];
        [temp addObject:body];
    }
    home.body = temp;
    
    return home;

}
@end
