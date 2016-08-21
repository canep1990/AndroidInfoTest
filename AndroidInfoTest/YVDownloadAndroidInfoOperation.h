//
//  YVDownloadAndroidInfoOperation.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>

/// Operation for loading information about androids
@interface YVDownloadAndroidInfoOperation : INSOperation

@property (strong, nonatomic) id responseObject;

@end
