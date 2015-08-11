//
//  testViewController.m
//  ZBT
//
//  Created by apple on 15/8/11.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()
- (IBAction)back:(UIButton *)sender;

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
