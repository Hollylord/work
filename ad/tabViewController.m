//
//  tabViewController.m
//  ad
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "tabViewController.h"
#import "RainBow.h"
#import <QuartzCore/QuartzCore.h>

@interface tabViewController ()
- (IBAction)programBtn:(id)sender;
- (IBAction)newsBtn:(id)sender;
- (IBAction)foundBtn:(id)sender;
- (IBAction)BBSBtn:(id)sender;
- (IBAction)personCenterBtn:(id)sender;
@property (strong, nonatomic) IBOutlet RainBow *rainBowView;
- (IBAction)neighbor:(id)sender;

@end

@implementation tabViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //删除系统自带的tabBar
    [self.tabBar removeFromSuperview];
//    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    
    //加载自定义的tabbar
    UIView *myTabBar = [[[NSBundle mainBundle] loadNibNamed:@"MyTabBar" owner:self options:nil] firstObject];
    myTabBar.frame = CGRectMake(0, 1214/2, 750/2, 121/2);
    myTabBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myTabBar];
    
    
    //加载rainbow
    UIView *rainBow = [[[NSBundle mainBundle] loadNibNamed:@"RainBow" owner:self options:nil] firstObject];
    rainBow.frame = CGRectMake(0, 489, 375, 129);
    rainBow.hidden = YES;

//    rainBow.center = CGPointMake(375/2, 667-49);
    rainBow.transform = CGAffineTransformMakeRotation(M_PI);
    [self.view insertSubview:rainBow belowSubview:myTabBar];
//    
//    UIViewController *testViewcontroller = [[UIViewController alloc] init];
//    
//    testViewcontroller.view.backgroundColor = [UIColor redColor];
    
//    NSLog(@"%@",self.viewControllers);
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 菜单按钮点击
- (IBAction)programBtn:(id)sender {
    //取消彩虹桥
    self.rainBowView.hidden = YES;
    //切换控制器
    self.selectedIndex = 0;
    
}

- (IBAction)newsBtn:(id)sender {
    self.rainBowView.hidden = YES;
    self.selectedIndex = 1;
}

- (IBAction)foundBtn:(id)sender {
    if (self.rainBowView.hidden == NO) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        } completion:^(BOOL finished) {
            self.rainBowView.hidden = YES;
        }];
        
        
    }
    else {
        self.rainBowView.hidden = NO;
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformIdentity;
        }];
    }
    
    
}

- (IBAction)BBSBtn:(id)sender {
    self.rainBowView.hidden = YES;
    self.selectedIndex = 3;
}

- (IBAction)personCenterBtn:(id)sender {
    self.rainBowView.hidden = YES;
    self.selectedIndex =4;
}
- (IBAction)neighbor:(id)sender {
    
}
@end
