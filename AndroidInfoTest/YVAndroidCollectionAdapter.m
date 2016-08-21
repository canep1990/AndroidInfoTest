//
//  YVAndroidCollectionAdapter.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidCollectionAdapter.h"
#import "YVAndroidCollectionCell.h"

@implementation YVAndroidCollectionAdapter

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.modelsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YVAndroidCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YVAndroidCollectionCellReuseIdentifier forIndexPath:indexPath];
    [cell configureAndroidCollectionCellWithAndroidModel:self.modelsArray[indexPath.row]];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentIndex = (NSInteger)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    NSString *pageInfo = [NSString stringWithFormat:@"%ld from %lu", currentIndex + 1, self.modelsArray.count];
    if (self.delegate && [self.delegate respondsToSelector:@selector(androidCollectionAdapter:didChangePageInfo:)])
    {
        [self.delegate androidCollectionAdapter:self didChangePageInfo:pageInfo];
    }
}

@end
