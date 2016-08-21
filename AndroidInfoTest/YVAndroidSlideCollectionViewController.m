//
//  YVAndroidSlideCollectionViewController.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidSlideCollectionViewController.h"
#import "YVAndroidSlideCollectionView.h"

@interface YVAndroidSlideCollectionViewController () <YVAndroidSlideCollectionViewDelegate>

@end

@implementation YVAndroidSlideCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    id <YVAndroidSlideCollectionViewControllerDelegate> delegate = (id <YVAndroidSlideCollectionViewControllerDelegate>)self.viewDelegate;
    if (delegate)
    {
        NSString *pageInfo = [NSString stringWithFormat:@"%ld from %lu", self.selectedIndex + 1, self.modelsArray.count];
        self.title = pageInfo;
        [delegate configureAndroidSlideCollectionViewWithAndroidModelArray:self.modelsArray];
        [delegate scrollToIndex:self.selectedIndex];
    }
}

#pragma mark - YVAndroidSlideCollectionViewDelegate

- (void)androidSlideCollectionView:(YVAndroidSlideCollectionView *)view didChangePageInfo:(NSString *)pageInfo
{
    self.title = pageInfo;
}

@end
