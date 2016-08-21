//
//  YVBackgroundObserver.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 21.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVBackgroundObserver.h"

static NSString * const YVBackgroundTaskName = @"YVBackgroundTaskName";

@interface YVBackgroundObserver ()
@property (nonatomic) BOOL inBackground;
@property (nonatomic) UIBackgroundTaskIdentifier identifier;
@end

@implementation YVBackgroundObserver

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    if (self = [super init])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterForeground:) name:UIApplicationDidBecomeActiveNotification object:nil];
        self.inBackground = [UIApplication sharedApplication].applicationState == UIApplicationStateBackground;
        if (self.inBackground)
        {
            [self startBackgroundTask];
        }
    }
    return self;
}

- (void)didEnterBackground:(NSNotification *)notification
{
    if (!self.inBackground)
    {
        self.inBackground = YES;
        [self startBackgroundTask];
    }
}

- (void)didEnterForeground:(NSNotification *)notification
{
    if (self.inBackground)
    {
        self.inBackground = NO;
        [self endBackgroundTask];
    }
}

- (void)startBackgroundTask
{
    if (self.identifier == UIBackgroundTaskInvalid)
    {
        self.identifier = [[UIApplication sharedApplication] beginBackgroundTaskWithName:YVBackgroundTaskName expirationHandler:^
        {
            [self endBackgroundTask];
        }];
    }
}

- (void)endBackgroundTask
{
    if (self.identifier != UIBackgroundTaskInvalid)
    {
        [[UIApplication sharedApplication] endBackgroundTask:self.identifier];
        self.identifier = UIBackgroundTaskInvalid;
    }
}

#pragma mark - INSOperationObserverProtocol

- (void)operationDidStart:(INSOperation *)operation { }

- (void)operation:(INSOperation *)operation didProduceOperation:(NSOperation *)newOperation { }

- (void)operationDidFinish:(INSOperation *)operation errors:(NSArray<NSError *> *)errors
{
    [self endBackgroundTask];
}

@end
