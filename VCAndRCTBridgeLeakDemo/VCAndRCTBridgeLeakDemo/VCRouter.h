//
//  VCRouter.h
//  TestBridge
//
//  Created by baidu on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"

@interface VCRouter : NSObject<RCTBridgeModule>

+(id)sharedRouter;

- (void)toTwo;
@end
