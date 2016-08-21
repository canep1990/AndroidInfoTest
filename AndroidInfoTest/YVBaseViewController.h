//
//  YVBaseViewController.h
//  Photo Editor Effects
//
//  Created by Юрий Воскресенский on 19.01.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+viewDelegateAdditions.h"
#import <INSOperationsKit/INSOperationsKit.h>

/// Base presenter with common functionality
@interface YVBaseViewController : UIViewController <INSOperationObserverProtocol>

- (void)operationDidFinishWithSuccess:(__kindof NSOperation * _Nonnull)operation;

- (void)showErrorMessage:(NSError * _Nonnull)error;

@end
