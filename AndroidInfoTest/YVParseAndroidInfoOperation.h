//
//  YVParseAndroidInfoOperation.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>
#import "YVAndroidModel.h"

/// Operation for parsing JSON data
@interface YVParseAndroidInfoOperation : INSOperation

/// Response object to parse
@property (strong, nonatomic) id responseObject;

/// Parsed data
@property (copy, nonatomic) NSArray <YVAndroidModel *> *parsedModels;

@end
