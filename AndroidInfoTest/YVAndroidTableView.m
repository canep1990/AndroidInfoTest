//
//  YVAndroidTableView.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidTableView.h"
#import "YVAndroidTableAdapter.h"
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface YVAndroidTableView() <YVAndroidTableAdapterDelegate, YVAndroidTableViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) YVAndroidTableAdapter *adapter;

@end

@implementation YVAndroidTableView

- (void)awakeFromNib
{
    self.adapter = [YVAndroidTableAdapter new];
    self.adapter.delegate = self;
    self.tableView.delegate = self.adapter;
    self.tableView.dataSource = self.adapter;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YVAndroidTableCell class]) bundle:nil] forCellReuseIdentifier:YVAndroidTableCellReuseIdentifier];
    self.tableView.rowHeight = 66;
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^
    {
        id <YVAndroidTableViewDelegate> delegate = (id <YVAndroidTableViewDelegate>)weakSelf.delegate;
        if (delegate && [delegate respondsToSelector:@selector(androidTableViewDidActivatePullToRefresh:)])
        {
            [delegate androidTableViewDidActivatePullToRefresh:weakSelf];
        }
    }];
}

#pragma mark - YVAndroidTableViewControllerDelegate

- (void)configureAndroidTableViewWithAndroidModelArray:(NSArray<YVAndroidModel *> *)androidModels
{
    NSLog(@"configureAndroidTableViewWithAndroidModelArray: %@", androidModels);
    self.adapter.modelsArray = androidModels;
    [self.tableView reloadData];
    [self removeProgressHUDAndPullToRefresh];
}

#pragma mark - YVViewControllerDelegate;

- (void)viewControllerDidLoadView:(__kindof UIViewController *)controller
{
    NSLog(@"responds");
}

#pragma mark - YVAndroidTableAdapterDelegate

- (void)androidTableAdapter:(YVAndroidTableAdapter *)adapter didSelectItem:(YVAndroidModel *)model atIndex:(NSInteger)index allModels:(NSArray <YVAndroidModel *> *)array
{
    id <YVAndroidTableViewDelegate> delegate = (id <YVAndroidTableViewDelegate>)self.delegate;
    if (delegate && [delegate respondsToSelector:@selector(androidTableView:didSelectItem:atIndex:allModels:)])
    {
        [delegate androidTableView:self didSelectItem:model atIndex:index allModels:array];
    }
}

@end