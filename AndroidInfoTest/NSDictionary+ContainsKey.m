//
//  NSDictionary+ContainsKey.m
//  Neural
//
//  Created by Юрий Воскресенский on 10.05.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "NSDictionary+ContainsKey.h"

@implementation NSDictionary (ContainsKey)

- (BOOL)containsKey:(NSString *)key
{
    BOOL retVal = NO;
    NSArray *allKeys = [self allKeys];
    retVal = [allKeys containsObject:key];
    return retVal;
}

@end
