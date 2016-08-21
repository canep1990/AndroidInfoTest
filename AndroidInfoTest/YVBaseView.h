//
//  YVBaseView.h
//  WeatherTest
//
//  Created by Юрий Воскресенский on 19.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVViewControllerDelegate.h"

/** Protocol for sending events to presenter */
@protocol YVBaseViewDelegate <NSObject>

@end

/** Base view class. Contains functionality for loading view from xib */
@interface YVBaseView : UIView <YVViewControllerDelegate>

/** Current view controller reference for supporting MVP */
@property (weak, nonatomic) UIViewController *viewController;

/** Delegate property */
@property (weak, nonatomic) id <YVBaseViewDelegate> delegate;

- (void)addProgressHUD;

- (void)removeProgressHUDAndPullToRefresh;

@end