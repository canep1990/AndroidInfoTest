//
//  YVAndroidCollectionCell.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidCollectionCell.h"
#import <UIActivityIndicator-for-SDWebImage/UIImageView+UIActivityIndicatorForSDWebImage.h>

@interface YVAndroidCollectionCell()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation YVAndroidCollectionCell

- (void)configureAndroidCollectionCellWithAndroidModel:(YVAndroidModel *)model
{
    self.label.text = model.title;
    [self.imageView setImageWithURL:[NSURL URLWithString:model.imageURLString] completed:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
}

@end
