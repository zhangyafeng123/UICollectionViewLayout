//
//  PhotoCell.h
//  UICollectionViewLayout
//
//  Created by linjianguo on 2018/7/3.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
/** 图片名字 */
@property (nonatomic,strong)NSString * imageName;
@end
