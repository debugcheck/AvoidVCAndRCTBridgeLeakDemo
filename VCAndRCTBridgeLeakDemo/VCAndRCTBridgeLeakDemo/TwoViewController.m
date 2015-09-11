//
//  TwoViewController.m
//  TestBridge
//
//  Created by baidu on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "TwoViewController.h"
#import "RCTRootView.h"

@interface TwoViewController()
@property(nonatomic, weak) RCTBridge *rootViewBridge;
@end

@implementation TwoViewController
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(foo){
    NSLog(@"%@ foo called",  self);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *temp = [[UIViewController alloc]  init];
        temp.navigationItem.title = @"Three";
        [self.navigationController pushViewController:temp animated:YES];
    });
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"Two";
    
    [self addJSView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(self.rootViewBridge && !self.rootViewBridge.isValid){
        [self.rootViewBridge reload];
    }
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if(self.rootViewBridge && self.rootViewBridge.isValid){
        [self.rootViewBridge invalidate];
    }
}

- (void)addJSView{
    __weak typeof(self)  weakSelf = self;
    
    //'block' won't retain a reference to 'self' because of using 'weakSelf';  But... the array is retaining a reference to 'self'.
    //Use `[self.rootViewBridge invalidate]` to  break the retain cycle between 'self' and self.rootViewBrige.
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
    
    self.rootViewBridge = bridge;
}

- (void)dealloc{
    NSLog(@"\n********%@ dealloc**********\n", self);
}
@end
