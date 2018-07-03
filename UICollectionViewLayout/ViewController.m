//
//  ViewController.m
//  UICollectionViewLayout
//
//  Created by linjianguo on 2018/7/3.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import "ViewController.h"
#import "CustomFlowLayout.h"
#import "PhotoCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * myCollectionView;
/** 数据源 */
@property (nonatomic,strong)NSMutableArray * dataArr;
/** 自定义的CollectionView的流水布局 */
@property (nonatomic,strong)CustomFlowLayout * layout;
@end

@implementation ViewController
#pragma mark- 懒加载
-(NSMutableArray *)dataArr
{
    if(!_dataArr){
        _dataArr=[[NSMutableArray alloc] init];
        for (int i=0; i<16; i++) {
            [_dataArr addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
    }
    return _dataArr;
}

-(UICollectionView *)myCollectionView
{
    if(!_myCollectionView){
        /**
         注意：初始化collectionView 通过frame和layout 一定要传进去一个layout
         */
        _myCollectionView=[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.showsVerticalScrollIndicator=NO;
        _myCollectionView.showsHorizontalScrollIndicator=NO;
        //注册cell
        [_myCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    return _myCollectionView;
}

-(CustomFlowLayout *)layout
{
    if(!_layout){
        _layout=[[CustomFlowLayout alloc] init];
        _layout.itemSize=CGSizeMake(150, 150);
    }
    return _layout;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myCollectionView];
}


#pragma mark - CollectionView的Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageName = self.dataArr[indexPath.item];
    return cell;
}

#pragma mark ----  点击item的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataArr removeObjectAtIndex:indexPath.item];
    //TODO:  这个方法 特别注意 删除item的方法
    [self.myCollectionView deleteItemsAtIndexPaths:@[indexPath]];
}

@end
