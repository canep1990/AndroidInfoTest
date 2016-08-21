//
//  YVBackgroundObserver.h
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 21.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <INSOperationsKit/INSOperationsKit.h>

/// Class for observing changes in Application's state
@interface YVBackgroundObserver : NSObject <INSOperationObserverProtocol>

@end
