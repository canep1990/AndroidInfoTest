//
//  YVAndroidTableCell.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVAndroidModel.h"

/// Table cell reuse identifier constant
static NSString * const YVAndroidTableCellReuseIdentifier = @"YVAndroidTableCellReuseIdentifier";

/// Table cell for displaying model
@interface YVAndroidTableCell : UITableViewCell

- (void)configureAndroidTableCellWithAndroidModel:(YVAndroidModel *)model;

@end
