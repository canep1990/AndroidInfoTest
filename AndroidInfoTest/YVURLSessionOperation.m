//
//  NOURLSessionOperation.m
//  Neural
//
//  Created by Юрий Воскресенский on 13.05.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVURLSessionOperation.h"

static void *YVDownloadOperationContext = &YVDownloadOperationContext;

@interface YVURLSessionOperation()
@property (nonatomic, strong, nonnull, readwrite) NSURLSessionTask *task;
@property (nonatomic) BOOL observerRemoved;
@end

@implementation YVURLSessionOperation

- (instancetype)initWithTask:(NSURLSessionTask *)task
{
    if (self = [super init])
    {
        NSAssert(task.state == NSURLSessionTaskStateSuspended, @"Tasks must be suspended.");
        self.task = task;
    }
    return self;
}

+ (instancetype)operationWithTask:(NSURLSessionTask *)task
{
    return [[[self class] alloc] initWithTask:task];
}

- (void)execute
{
    if (self.isCancelled)
    {
        return;
    }
    
    NSAssert(self.task.state == NSURLSessionTaskStateSuspended, @"Task was resumed by sometion othen than %@.", NSStringFromClass([self class]));
    
    [self.task addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:YVDownloadOperationContext];
    [self.task resume];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context != YVDownloadOperationContext)
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }    
    @synchronized (self)
    {
        if (object == self.task && [keyPath isEqualToString:@"state"] && !self.observerRemoved)
        {
            switch (self.task.state)
            {
                case NSURLSessionTaskStateCompleted:
                    [self finish];
                case NSURLSessionTaskStateCanceling:
                    self.observerRemoved = YES;
                    [self.task removeObserver:self forKeyPath:@"state"];
                    break;
                default:
                    break;
            }
        }
    }
}

- (void)cancel
{
    [self.task cancel];
    [super cancel];
}

@end
