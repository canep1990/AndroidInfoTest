//
//  YVAndroidCollectionCell.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVAndroidModel.h"

/// Collection cell reuse identifier constant
static NSString * const YVAndroidCollectionCellReuseIdentifier = @"YVAndroidCollectionCellReuseIdentifier";

/// Collection cell for displaying model
@interface YVAndroidCollectionCell : UICollectionViewCell

- (void)configureAndroidCollectionCellWithAndroidModel:(YVAndroidModel *)model;

@end
