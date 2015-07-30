//
//  zhongchouzhongViewController.m
//  ad
//
//  Created by apple on 15/7/29.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "zhongchouzhongViewController.h"
#import "tabViewController.h"

#import "ASProgressPopUpView.h"

@interface zhongchouzhongViewController () <ASProgressPopUpViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstViewHeight;
- (IBAction)firstExtention:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;

@property (weak, nonatomic) IBOutlet ASProgressPopUpView *progressView;






@end

@implementation zhongchouzhongViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    //配置progressView 进度条
    self.progressView.popUpViewCornerRadius = 8.0;
    self.progressView.popUpViewColor = [UIColor grayColor];
    self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:20];
    [self.progressView showPopUpViewAnimated:YES];
    self.progressView.progress = 0.0;
    self.progressView.dataSource = self;
    [self progress];
    

    
    
  
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    myTabBarController.customTabBar.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 展开按钮
- (IBAction)firstExtention:(UIButton *)sender {
    if (self.firstBtn.selected == NO) {
        [self.firstBtn setSelected:YES];
        self.firstViewHeight.constant = 200;
        [UIView animateWithDuration:1.0 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
    else {
        [self.firstBtn setSelected:NO];
        self.firstViewHeight.constant = 130;
        [UIView animateWithDuration:1.0 animations:^{
            [self.view layoutIfNeeded];
        }];
        
    }
    
    
}
#pragma mark - 进度条
- (void)progress
{
    float progress = self.progressView.progress;
    
    //0.9用来设置进度条的最终进度
    if (self.progressView.progress < 0.9 && self.isOnGoing) {
        
        progress += 0.005;
        
        [self.progressView setProgress:progress animated:YES];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1
                                         target:self
                                       selector:@selector(progress)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (BOOL)progressViewShouldPreCalculatePopUpViewSize:(ASProgressPopUpView *)progressView;
{
    return NO;
}

- (NSString *)progressView:(ASProgressPopUpView *)progressView stringForProgress:(float)progress{
    //默认是数字
    return nil;
}

@end
