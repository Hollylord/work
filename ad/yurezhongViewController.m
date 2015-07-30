//
//  yurezhongViewController.m
//  ad
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "yurezhongViewController.h"
#import "ASProgressPopUpView.h"
#import "tabViewController.h"

@interface yurezhongViewController () <ASProgressPopUpViewDataSource>
@property (weak, nonatomic) IBOutlet ASProgressPopUpView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *extention1Btn;
- (IBAction)extention:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightOfView1;

@end

@implementation yurezhongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //配置progressView 进度条
    self.progressView.popUpViewCornerRadius = 8.0;
    self.progressView.popUpViewColor = [UIColor redColor];
    self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:20];
    [self.progressView showPopUpViewAnimated:YES];
    self.progressView.progress = 0.0;
    self.progressView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    myTabBarController.customTabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
}

- (BOOL)progressViewShouldPreCalculatePopUpViewSize:(ASProgressPopUpView *)progressView;
{
    return NO;
}

- (NSString *)progressView:(ASProgressPopUpView *)progressView stringForProgress:(float)progress{
    //默认是数字
    return nil;
}

- (IBAction)extention:(UIButton *)sender {
    if (self.extention1Btn.selected == NO) {
        [self.extention1Btn setSelected:YES];
        self.heightOfView1.constant = 200;
        [UIView animateWithDuration:1.0 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
    else {
        [self.extention1Btn setSelected:NO];
        self.heightOfView1.constant = 130;
        [UIView animateWithDuration:1.0 animations:^{
            [self.view layoutIfNeeded];
        }];
        
    }
}
@end
