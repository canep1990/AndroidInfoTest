//
//  YVAndroidTableViewController.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidTableViewController.h"
#import "YVAndroidTableView.h"
#import "YVAndroidInfoOperation.h"
#import "YVAndroidSlideCollectionViewController.h"
#import "YVBackgroundObserver.h"

@interface YVAndroidTableViewController () <YVAndroidTableViewDelegate>
@property (nonatomic) BOOL loading;
@end

@implementation YVAndroidTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Androids", nil);
    [self loadJSONData];
}

#pragma mark - IBActions

- (IBAction)didTapRefreshButton:(id)sender
{
    [self loadJSONData];
}

#pragma mark - Loading data

- (void)loadJSONData
{
    if (!self.loading)
    {
        self.loading = YES;
        YVAndroidInfoOperation *operation = [YVAndroidInfoOperation new];
        [operation addObserver:self];
        YVBackgroundObserver *backgroundObserver = [YVBackgroundObserver new];
        [operation addObserver:backgroundObserver];
        [operation ins_addCompletionBlockInMainQueue:^(__kindof NSOperation * _Nonnull operation)
        {
            NSLog(@"completion called");
            self.loading = NO;
        }];
        [[INSOperationQueue globalQueue] addOperation:operation];
    }
}

- (void)operationDidFinishWithSuccess:(__kindof NSOperation *)operation
{
    if ([operation isKindOfClass:[YVAndroidInfoOperation class]])
    {
        YVAndroidInfoOperation *infoOperation = (YVAndroidInfoOperation *)operation;
        id <YVAndroidTableViewControllerDelegate> delegate = (id <YVAndroidTableViewControllerDelegate>)self.viewDelegate;
        if (delegate)
        {
            [delegate configureAndroidTableViewWithAndroidModelArray:infoOperation.loadedModels];
        }
    }
}

#pragma mark - YVAndroidTableViewDelegate

- (void)androidTableView:(YVAndroidTableView *)adapter didSelectItem:(YVAndroidModel *)model atIndex:(NSInteger)index allModels:(NSArray <YVAndroidModel *> *)array
{
    YVAndroidSlideCollectionViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([YVAndroidSlideCollectionViewController class])];
    controller.modelsArray = array;
    controller.selectedIndex = index;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)androidTableViewDidActivatePullToRefresh:(YVAndroidTableView *)view
{
    [self loadJSONData];
}

@end
