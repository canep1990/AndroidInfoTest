//
//  UIViewController+viewDelegateAdditions.m
//  UserLoadTest
//
//  Created by Юрий Воскресенский on 17.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "UIViewController+viewDelegateAdditions.h"
@import ObjectiveC;

@implementation UIViewController (viewDelegateAdditions)

- (id<YVViewControllerDelegate>)viewDelegate
{
    return objc_getAssociatedObject(self, @selector(viewDelegate));
}

- (void)setViewDelegate:(id<YVViewControllerDelegate>)viewDelegate
{
    objc_setAssociatedObject(self, @selector(viewDelegate), viewDelegate, OBJC_ASSOCIATION_ASSIGN);
}

@end
