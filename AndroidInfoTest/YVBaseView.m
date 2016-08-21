//
//  YVBaseView.m
//  WeatherTest
//
//  Created by Юрий Воскресенский on 19.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseView.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface YVBaseView ()

@end

@implementation YVBaseView

- (void)viewControllerDidLoadView:(__kindof UIViewController *)controller
{
    NSLog(@"respondes to selector");
}

- (void)addProgressHUD
{
    MBProgressHUD *progressHUD = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:progressHUD];
    [progressHUD showAnimated:YES];
}

- (void)removeProgressHUDAndPullToRefresh
{
    for (UIView *view in self.subviews)
    {
        NSLog(@"iterating views");
        if ([view isKindOfClass:[MBProgressHUD class]])
        {
            NSLog(@"ProgressHUD");
            MBProgressHUD *progressHUD = (MBProgressHUD *)view;
            [progressHUD hideAnimated:YES];
            [progressHUD removeFromSuperview];
        }
        else if ([view isKindOfClass:[UITableView class]])
        {
            NSLog(@"TableView");
            UITableView *tableView = (UITableView *)view;
            [tableView.pullToRefreshView stopAnimating];
            [tableView.infiniteScrollingView stopAnimating];
        }
        else if ([view isKindOfClass:[UICollectionView class]])
        {
            NSLog(@"CollectionView");
            UICollectionView *collectionView = (UICollectionView *)view;
            [collectionView.pullToRefreshView stopAnimating];
            [collectionView.infiniteScrollingView stopAnimating];
        }
    }
}

@end