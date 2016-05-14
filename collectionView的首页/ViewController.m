//
//  ViewController.m
//  collectionView的首页
//
//  Created by 会跳舞的狮子 on 16/5/4.
//  Copyright © 2016年 会跳舞的狮子. All rights reserved.
//

#import "ViewController.h"
#import "JHBodyCell.h"
#import "JHBodyModel.h"
#import "JHHomeModel.h"
#import "JHHeaderReusableView.h"
#import "JHHeaderFlowLayout.h"
#define ScreenW  [UIScreen mainScreen].bounds.size.width
#define ScreenH  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
/** collectionView  */
@property (nonatomic,weak) UICollectionView *collectionView;
/** 保存模型属性的数组  */
@property (nonatomic, strong) NSMutableArray *bodyArray;

@end

@implementation ViewController
static NSString *const kBodyID = @"JHBodyCell";
static NSString *const kHeaderID = @"JHHeaderReusableView";


#pragma mark - 懒加载
- (NSMutableArray *)bodyArray
{
    if (!_bodyArray) {
        
        //保存模型的数组
        NSMutableArray *temp = [NSMutableArray array];
        //字典转模型
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"HomeDatas" ofType:@"plist"]];
        for (NSDictionary *dict in dictArray) {
            JHHomeModel *home = [JHHomeModel homeWithDict:dict];
            [temp addObject:home];
        }
        _bodyArray = temp;
    }
    
    return _bodyArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNav];
    
    //设置collectionView
    [self setupCollection];
}

/** 设置导航栏 */
- (void)setupNav
{
    self.navigationItem.title = @"collectionView做的首页";
    
    
    self.navigationController.navigationBar.translucent = NO;
}

/* 设置collectionView */
- (void)setupCollection
{
    //布局
    JHHeaderFlowLayout *layout = [[JHHeaderFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(ScreenW, 150);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    //设置头部视图的尺寸
    layout.headerReferenceSize = CGSizeMake(ScreenW, ScreenH * 0.085);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.showsVerticalScrollIndicator = NO;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    collectionView.bounces = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];

    //注册
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHBodyCell class]) bundle:nil] forCellWithReuseIdentifier:kBodyID];
    //注册头部视图
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHHeaderReusableView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderID];

}

/** 让状态栏隐藏 */
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}


#pragma mark - UICollectionViewDataSource
/** 返回有多少组  */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.bodyArray.count;
    
}

/** 返回每组有多少个item  */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    //每组的模型
    JHHomeModel *home = self.bodyArray[section];
    
    return home.body.count;

}
/** 返回每个item的具体内容  */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JHBodyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBodyID forIndexPath:indexPath];

    //组模型
    JHHomeModel *home = self.bodyArray[indexPath.section];
    
    //行模型
    JHBodyModel *body = home.body[indexPath.row];
    
    cell.bodyModel = body;
    
    return cell;
}


#pragma mark - UICollectionViewDelegate
//点击collectionView的item的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JHLogFunc;

}

#pragma mark - 头部或者尾部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头部视图
    if (kind == UICollectionElementKindSectionHeader) {
        JHHeaderReusableView *headerRV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeaderID forIndexPath:indexPath];
        headerRV.homeModel = self.bodyArray[indexPath.section];
        return headerRV;
        
    }else
    {
        return nil;
    }

}



@end
