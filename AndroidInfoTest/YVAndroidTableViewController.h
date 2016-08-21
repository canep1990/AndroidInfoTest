//
//  YVAndroidTableViewController.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseViewController.h"
#import "YVAndroidModel.h"

@protocol YVAndroidTableViewControllerDelegate <YVViewControllerDelegate>

//- (void)androidTableViewControllerDidStartLoadingData;

- (void)configureAndroidTableViewWithAndroidModelArray:(NSArray <YVAndroidModel *> *)androidModels;

@end

/// Presenter for android table models
@interface YVAndroidTableViewController : YVBaseViewController

@end
