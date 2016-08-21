//
//  YVAndroidTableView.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseView.h"
#import "YVAndroidModel.h"
#import "YVAndroidTableViewController.h"

@class YVAndroidTableView;

@protocol YVAndroidTableViewDelegate <YVBaseViewDelegate>

- (void)androidTableView:(YVAndroidTableView *)view didSelectItem:(YVAndroidModel *)model atIndex:(NSInteger)index allModels:(NSArray <YVAndroidModel *> *)array;

- (void)androidTableViewDidActivatePullToRefresh:(YVAndroidTableView *)view;

@end

/// View for displaying android models in table
@interface YVAndroidTableView : YVBaseView

@end
