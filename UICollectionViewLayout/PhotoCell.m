//
//  PhotoCell.m
//  UICollectionViewLayout
//
//  Created by linjianguo on 2018/7/3.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (void)awakeFromNib {
    self.imageV.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageV.layer.borderWidth = 10;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.imageV.image = [UIImage imageNamed:imageName];
}

@end
