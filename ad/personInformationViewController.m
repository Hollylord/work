//
//  personInformationViewController.m
//  ad
//
//  Created by apple on 15/7/27.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "personInformationViewController.h"

@interface personInformationViewController ()

@end

@implementation personInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.backgroundColor = [UIColor colorWithRed:139 green:139 blue:139 alpha:1];
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
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
