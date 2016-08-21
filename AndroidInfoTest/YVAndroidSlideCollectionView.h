//
//  YVAndroidSlideCollectionView.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseView.h"
#import "YVAndroidModel.h"

@class YVAndroidSlideCollectionView;

@protocol YVAndroidSlideCollectionViewDelegate <YVBaseViewDelegate>
- (void)androidSlideCollectionView:(YVAndroidSlideCollectionView *)view didChangePageInfo:(NSString *)pageInfo;
@end

/// View for displaying android models in sliding views
@interface YVAndroidSlideCollectionView : YVBaseView

@end
