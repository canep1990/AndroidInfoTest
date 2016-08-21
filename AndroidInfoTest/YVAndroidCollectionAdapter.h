//
//  YVAndroidCollectionAdapter.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVAndroidModel.h"

@class YVAndroidCollectionAdapter;

@protocol YVAndroidCollectionAdapterDelegate <NSObject>
- (void)androidCollectionAdapter:(YVAndroidCollectionAdapter *)adapter didChangePageInfo:(NSString *)pageInfo;
@end

@interface YVAndroidCollectionAdapter : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (copy, nonatomic) NSArray <YVAndroidModel *> *modelsArray;

@property (weak, nonatomic) id <YVAndroidCollectionAdapterDelegate> delegate;

@end
