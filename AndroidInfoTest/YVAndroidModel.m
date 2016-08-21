//
//  YVAndroidModel.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidModel.h"
#import "NSDictionary+ContainsKey.h"

static NSString * const kIdJSONKey = @"id";
static NSString * const kTitleJSONKey = @"title";
static NSString * const kImgJSONKey = @"img";

@implementation YVAndroidModel

+ (YVAndroidModel *)androidModelFromDictionary:(NSDictionary *)dictionary
{
    YVAndroidModel *androidModel = [YVAndroidModel new];
    
    if ([dictionary containsKey:kIdJSONKey])
    {
        androidModel.numberId = dictionary[kIdJSONKey];
    }
    
    if ([dictionary containsKey:kTitleJSONKey])
    {
        androidModel.title = dictionary[kTitleJSONKey];
    }

    if ([dictionary containsKey:kImgJSONKey])
    {
        androidModel.imageURLString = dictionary[kImgJSONKey];
    }
    
    return androidModel;
}

+ (NSArray <YVAndroidModel *> *)arrayOfAndroidModelsFromJSON:(id)json
{
    NSMutableArray <YVAndroidModel *> *modelsArray;
    if ([json isKindOfClass:[NSArray class]])
    {
        modelsArray = [NSMutableArray new];
        for (NSDictionary *dict in json)
        {
            YVAndroidModel *androidModel = [[self class] androidModelFromDictionary:dict];
            [modelsArray addObject:androidModel];
        }
    }
    return modelsArray;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"numberId: %@, title: %@ imageURLString: %@", self.numberId, self.title, self.imageURLString];
}

@end
