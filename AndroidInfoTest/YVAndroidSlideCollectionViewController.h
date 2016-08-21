//
//  YVAndroidSlideCollectionViewController.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseViewController.h"
#import "YVAndroidModel.h"

@protocol YVAndroidSlideCollectionViewControllerDelegate <YVViewControllerDelegate>

- (void)configureAndroidSlideCollectionViewWithAndroidModelArray:(NSArray <YVAndroidModel *> *)androidModels;

- (void)scrollToIndex:(NSInteger)index;

@end

/// Presenter for android slide models
@interface YVAndroidSlideCollectionViewController : YVBaseViewController

@property (nonatomic) NSInteger selectedIndex;
@property (copy, nonatomic) NSArray <YVAndroidModel *> *modelsArray;

@end
