//
//  YVViewDelegate.h
//  UserLoadTest
//
//  Created by Юрий Воскресенский on 17.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Common protocol for configuring views */
@protocol YVViewControllerDelegate <NSObject>

- (void)viewControllerDidLoadView:(__kindof UIViewController *)controller;

@end