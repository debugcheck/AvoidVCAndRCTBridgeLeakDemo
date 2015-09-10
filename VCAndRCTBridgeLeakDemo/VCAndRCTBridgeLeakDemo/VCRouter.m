//
//  VCRouter.m
//  TestBridge
//
//  Created by baidu on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "VCRouter.h"
#import "TwoViewController.h"
#import "AppDelegate.h"

static id sharedRouter = nil;

@implementation VCRouter
RCT_EXPORT_MODULE()

+(id)sharedRouter{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedRouter = [[VCRouter alloc] init];
    });
    
    return sharedRouter;
}

RCT_EXPORT_METHOD(toTwo){
    dispatch_async(dispatch_get_main_queue(), ^{
        TwoViewController *tvc = [[TwoViewController alloc] init];
        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appdelegate.navigationController pushViewController:tvc animated:YES];
    });
}

@end
