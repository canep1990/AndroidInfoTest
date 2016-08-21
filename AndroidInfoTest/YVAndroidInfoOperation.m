//
//  YVAndroidInfoOperation.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidInfoOperation.h"
#import "YVDownloadAndroidInfoOperation.h"
#import "YVParseAndroidInfoOperation.h"

@implementation YVAndroidInfoOperation

- (instancetype)init
{
    self = [super initWithOperations:@[]];
    if (self)
    {
        YVDownloadAndroidInfoOperation *downloadOperation = [YVDownloadAndroidInfoOperation new];
        YVParseAndroidInfoOperation *parseOperation = [YVParseAndroidInfoOperation new];
        [parseOperation addDependency:downloadOperation];
        [downloadOperation ins_addCompletionBlock:^(__kindof NSOperation * _Nonnull operation)
        {
            parseOperation.responseObject = downloadOperation.responseObject;
        }];
        [self addOperation:downloadOperation];
        [self addOperation:parseOperation];
    }
    return self;
}

- (void)operationDidFinish:(NSOperation *)operation withErrors:(NSArray<NSError *> *)errors
{
    if (errors.count == 0)
    {
        if ([operation isKindOfClass:[YVParseAndroidInfoOperation class]])
        {
            YVParseAndroidInfoOperation *parseOperation = (YVParseAndroidInfoOperation *)operation;
            self.loadedModels = parseOperation.parsedModels;
        }
    }
}

@end
