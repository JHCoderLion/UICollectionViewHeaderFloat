//
//  JHBodyModel.h
//  collectionView的首页
//
//  Created by 会跳舞的狮子 on 16/5/4.
//  Copyright © 2016年 会跳舞的狮子 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBodyModel : NSObject
/** 每一行的标题 */
@property (nonatomic, copy) NSString *section_title;
/** 图片的URL */
@property (nonatomic, copy) NSString *imageURL;
/** 喜欢的个数 */
@property (nonatomic, copy) NSString *fav_count	;
/** 行内名称 */
@property (nonatomic, copy) NSString *poi_name;

+ (instancetype)bodyWithDict:(NSDictionary *)dict;

@end
