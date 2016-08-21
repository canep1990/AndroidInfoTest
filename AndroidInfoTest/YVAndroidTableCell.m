//
//  YVAndroidTableCell.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidTableCell.h"
#import <UIActivityIndicator-for-SDWebImage/UIImageView+UIActivityIndicatorForSDWebImage.h>

@interface YVAndroidTableCell()
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIImageView *androidDisplayImageView;
@end

@implementation YVAndroidTableCell

- (void)configureAndroidTableCellWithAndroidModel:(YVAndroidModel *)model
{
    self.label.text = model.title;
    [self.androidDisplayImageView setImageWithURL:[NSURL URLWithString:model.imageURLString] completed:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (highlighted)
    {
        [self highlightRow];
    }
    else
    {
        [self unhighlightRow:animated];
    }
}

- (void)highlightRow
{
    self.backgroundColor = [UIColor lightGrayColor];
}

- (void)unhighlightRow:(BOOL)animated
{
    if (animated)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor whiteColor];
        }];
    }
    else
    {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
