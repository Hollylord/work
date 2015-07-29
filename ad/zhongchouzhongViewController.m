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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
