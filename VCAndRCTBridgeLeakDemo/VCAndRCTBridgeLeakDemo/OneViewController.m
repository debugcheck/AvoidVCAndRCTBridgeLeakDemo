//
//  OneViewController.m
//  TestBridge
//
//  Created by baidu on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "OneViewController.h"
#import "RCTRootView.h"
#import "VCRouter.h"

@implementation OneViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"One";
    
//    [self addJSView];
    [self addNativeView];
}


//- (void)addJSView{
//    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/One.bundle"];
//    
//    RCTBridgeModuleProviderBlock block = ^{
//        return @[[VCRouter sharedRouter]];
//    };
//    
//    RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation moduleProvider:block launchOptions:nil];
//    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
//                                                     moduleName:@"One"];
//    rootView.frame = self.view.bounds;
//    rootView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    [self.view addSubview:rootView];
//}

- (void)addNativeView{
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100,100, 100, 100)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)push{
    [[VCRouter sharedRouter] toTwo];
}

@end
