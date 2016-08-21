//
//  YVAndroidTableAdapter.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVAndroidTableCell.h"

@class YVAndroidTableAdapter;

@protocol YVAndroidTableAdapterDelegate <NSObject>

- (void)androidTableAdapter:(YVAndroidTableAdapter *)adapter didSelectItem:(YVAndroidModel *)model atIndex:(NSInteger)index allModels:(NSArray <YVAndroidModel *> *)array;

@end

/// Adapter for table view
@interface YVAndroidTableAdapter : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id <YVAndroidTableAdapterDelegate> delegate;

@property (copy, nonatomic) NSArray <YVAndroidModel *> *modelsArray;

@end
