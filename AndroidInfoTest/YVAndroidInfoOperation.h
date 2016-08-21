//
//  YVAndroidInfoOperation.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>

@class YVAndroidModel;

/// Operation for getting android models
@interface YVAndroidInfoOperation : INSGroupOperation

@property (copy, nonatomic) NSArray <YVAndroidModel *> *loadedModels;

@end
