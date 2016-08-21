//
//  YVAndroidSlideCollectionView.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidSlideCollectionView.h"
#import "YVAndroidCollectionCell.h"
#import "YVAndroidCollectionAdapter.h"
#import "YVAndroidSlideCollectionViewController.h"

@interface YVAndroidSlideCollectionView() <YVAndroidCollectionAdapterDelegate, YVAndroidSlideCollectionViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) YVAndroidCollectionAdapter *adapter;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@end

@implementation YVAndroidSlideCollectionView

- (void)awakeFromNib
{
    self.adapter = [YVAndroidCollectionAdapter new];
    self.adapter.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YVAndroidCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:YVAndroidCollectionCellReuseIdentifier];
    self.collectionView.delegate = self.adapter;
    self.collectionView.dataSource = self.adapter;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.pagingEnabled = YES;
    self.flowLayout = [UICollectionViewFlowLayout new];
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.sectionInset = UIEdgeInsetsZero;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.collectionViewLayout = self.flowLayout;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.flowLayout.itemSize = self.collectionView.bounds.size;
    [self.collectionView.collectionViewLayout invalidateLayout];
}

#pragma mark - YVAndroidSlideCollectionViewControllerDelegate

- (void)configureAndroidSlideCollectionViewWithAndroidModelArray:(NSArray<YVAndroidModel *> *)androidModels
{
    self.adapter.modelsArray = androidModels;
    [self.collectionView reloadData];
}

- (void)scrollToIndex:(NSInteger)index
{
    NSLog(@"scrollToIndex: %ld", (long)index);
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

#pragma mark - YVAndroidCollectionAdapterDelegate

- (void)androidCollectionAdapter:(YVAndroidCollectionAdapter *)adapter didChangePageInfo:(NSString *)pageInfo
{
    id <YVAndroidSlideCollectionViewDelegate> delegate = (id <YVAndroidSlideCollectionViewDelegate>)self.delegate;
    if (delegate && [delegate respondsToSelector:@selector(androidSlideCollectionView:didChangePageInfo:)])
    {
        [delegate androidSlideCollectionView:self didChangePageInfo:pageInfo];
    }
}

@end
