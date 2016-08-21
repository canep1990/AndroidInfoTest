//
//  YVDownloadAndroidInfoOperation.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDownloadAndroidInfoOperation.h"
#import "YVFixedURLSessionManager.h"
#import <AFNetworking/AFNetworking.h>
#import "YVURLSessionOperation.h"

@interface YVDownloadAndroidInfoOperation()
@property (strong, nonatomic) YVURLSessionOperation *sessionOperation;
@end

@implementation YVDownloadAndroidInfoOperation

- (instancetype)init
{
    if (self = [super init])
    {
        NSString *urlString = @"http://private-db05-jsontest111.apiary-mock.com/androids";
        YVFixedURLSessionManager *httpManager = [YVFixedURLSessionManager manager];
        NSURLSessionDataTask *dataTask = [httpManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject)
        {
            self.responseObject = responseObject;
            [self finish];
        }
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error)
        {
            [self finishWithError:error];
        }];
        self.sessionOperation = [YVURLSessionOperation operationWithTask:dataTask];
    }
    return self;
}

- (void)execute
{
    [self.sessionOperation execute];
}

@end
