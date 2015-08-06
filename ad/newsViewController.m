//
//  newsViewController.m
//  ad
//
//  Created by apple on 15/7/24.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "newsViewController.h"
#import "AFNetworking.h"


@interface newsViewController () <NSURLSessionDelegate,NSURLSessionDataDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *browser;

@end

@implementation newsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://www.pedaily.cn/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //网页大小自适应功能
    self.browser.scalesPageToFit = YES;
    [self.browser loadRequest:request ];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
