//
//  dengluViewController.m
//  ad
//
//  Created by apple on 15/7/23.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "dengluViewController.h"

@interface dengluViewController ()


- (IBAction)weiboBtn:(id)sender;

@end

@implementation dengluViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"您输入的密码错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil] ;
    [alert  show];
}

- (IBAction)weiboBtn:(id)sender {
    
}
@end
