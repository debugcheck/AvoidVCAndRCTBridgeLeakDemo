//
//  TwoViewController.m
//  TestBridge
//
//  Created by baidu on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "TwoViewController.h"
#import "RCTRootView.h"


@implementation TwoViewController
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(foo){
    NSLog(@"%@ foo called",  self);
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"Two";
    
    [self addJSView];
}


- (void)addJSView{
    __weak typeof(self)  weakSelf = self;

    RCTBridgeModuleProviderBlock block = ^{
        return @[weakSelf];
    };
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/Two.bundle"];
    RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation moduleProvider:block launchOptions:nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                     moduleName:@"Two"];
    rootView.frame = self.view.bounds;
    rootView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:rootView];
}

- (void)dealloc{
    NSLog(@"\n********%@ dealloc**********\n", self);
}
@end
