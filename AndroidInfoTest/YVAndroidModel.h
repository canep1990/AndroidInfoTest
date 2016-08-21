//
//  YVAndroidModel.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Model object for android models
@interface YVAndroidModel : NSObject

@property (strong, nonatomic) NSNumber *numberId;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *imageURLString;

+ (YVAndroidModel *)androidModelFromDictionary:(NSDictionary *)dictionary;
+ (NSArray <YVAndroidModel *> *)arrayOfAndroidModelsFromJSON:(id)json;

@end
