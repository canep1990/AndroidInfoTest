//
//  UIViewController+viewDelegateAdditions.h
//  UserLoadTest
//
//  Created by Юрий Воскресенский on 17.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVViewControllerDelegate.h"

@interface UIViewController (viewDelegateAdditions)

/** Property for supporting MVP style messaging between presenter and view */
@property (weak, nonatomic) id <YVViewControllerDelegate> viewDelegate;

@end
