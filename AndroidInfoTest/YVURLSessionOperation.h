//
//  NOURLSessionOperation.h
//  Neural
//
//  Created by Юрий Воскресенский on 13.05.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>

/// Fixed URL session operation
@interface YVURLSessionOperation : INSOperation
@property (nonatomic, strong, nonnull, readonly) NSURLSessionTask *task;
- (nonnull instancetype)initWithTask:(nonnull NSURLSessionTask *)task;
+ (nonnull instancetype)operationWithTask:(nonnull NSURLSessionTask *)task;
@end
