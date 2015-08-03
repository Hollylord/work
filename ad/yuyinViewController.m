//
//  yuyinViewController.m
//  ad
//
//  Created by apple on 15/8/3.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "yuyinViewController.h"
#import "tabViewController.h"

@interface yuyinViewController ()
@property (weak, nonatomic) IBOutlet UIButton *toggleBtn;
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;
@property (weak, nonatomic) IBOutlet UITextField *typeBtn;
- (IBAction)toggleKey:(UIButton *)sender;
- (IBAction)talk:(UIButton *)sender;

@end

@implementation yuyinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    [myTabBarController.customTabBar setHidden:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toggleKey:(UIButton *)sender {
}

- (IBAction)talk:(UIButton *)sender {
}
@end
