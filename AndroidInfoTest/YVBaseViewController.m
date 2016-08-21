//
//  YVBaseViewController.m
//  Photo Editor Effects
//
//  Created by Юрий Воскресенский on 19.01.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseViewController.h"
#import "YVBaseView.h"

@interface YVBaseViewController() <YVBaseViewDelegate>

@end

@implementation YVBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    YVBaseView *baseView = (YVBaseView *)self.view;
    baseView.delegate = self;
    self.viewDelegate = baseView;
    
    if ([baseView respondsToSelector:@selector(viewControllerDidLoadView:)])
    {
        [self.viewDelegate viewControllerDidLoadView:self];   
    }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - <INSOperationObserverProtocol>

- (void)operationDidStart:(INSOperation *)operation
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^
    {
        if ([self.view respondsToSelector:@selector(addProgressHUD)])
        {
            YVBaseView *baseView = (YVBaseView *)self.view;
            [baseView addProgressHUD];
        }
    }];
}

- (void)operationDidFinish:(INSOperation *)operation errors:(NSArray<NSError *> *)errors
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^
    {
        if (errors && errors.count > 0)
        {
            NSError *error = errors.firstObject;
            [self showErrorMessage:error];
            if ([self.view respondsToSelector:@selector(removeProgressHUDAndPullToRefresh)])
            {
                YVBaseView *baseView = (YVBaseView *)self.view;
                [baseView removeProgressHUDAndPullToRefresh];
            }
        }
        else
        {
            [self operationDidFinishWithSuccess:operation];
        }
    }];
}


- (void)showErrorMessage:(NSError *)error
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.localizedDescription message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)operationDidFinishWithSuccess:(__kindof NSOperation *)operation {}

@end
