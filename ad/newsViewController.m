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
    
    NSURL *url = [NSURL URLWithString:@"http://www.touwho.com/topic_66.htm"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.browser loadRequest:request ];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer ];
    
    
    
    
    
    [manager GET:@"http://www.touwho.com/topic_66.htm" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
//        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",[error localizedDescription]);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
