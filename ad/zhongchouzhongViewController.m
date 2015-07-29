//
//  zhongchouzhongViewController.m
//  ad
//
//  Created by apple on 15/7/29.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "zhongchouzhongViewController.h"
#import "tabViewController.h"

@interface zhongchouzhongViewController ()



@end

@implementation zhongchouzhongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
   
    
  
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    myTabBarController.customTabBar.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
