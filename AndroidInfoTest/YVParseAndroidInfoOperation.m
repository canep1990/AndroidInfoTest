//
//  YVParseAndroidInfoOperation.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVParseAndroidInfoOperation.h"

@implementation YVParseAndroidInfoOperation

- (void)execute
{
    NSLog(@"YVParseAndroidInfoOperation %@", self.responseObject);
    if (self.responseObject)
    {
        self.parsedModels = [YVAndroidModel arrayOfAndroidModelsFromJSON:self.responseObject];
        NSLog(@"YVParseAndroidInfoOperation parsedModels: %@", self.parsedModels);
        [self finish];
    }
    else
    {
        [self finishWithError:[NSError errorWithDomain:@"Parse operation error domain" code:200 userInfo:@{ NSLocalizedDescriptionKey : @"Failed to parse Android Data" }]];
    }
}

@end
