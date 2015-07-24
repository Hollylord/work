//
//  speechViewController.m
//  ad
//
//  Created by apple on 15/7/24.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "speechViewController.h"

@interface speechViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *browser;

@end

@implementation speechViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.browser.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"http://v.youku.com/v_show/id_XMTI4NjA1OTgyNA==.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.browser loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
