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
- (IBAction)programBtn:(id)sender; // 项目selectedIndex = 0
- (IBAction)newsBtn:(id)sender;   //新闻selectedIndex = 1
- (IBAction)foundBtn:(id)sender;   //发现
- (IBAction)BBSBtn:(id)sender;     //社区selectedIndex = 2
- (IBAction)personCenterBtn:(id)sender;   //个人中心selectedIndex = 3


@property (strong, nonatomic) IBOutlet RainBow *rainBowView; // 彩虹桥

- (IBAction)neighbor:(id)sender;   // 附近的人  selectedIndex = 4
- (IBAction)message:(UIButton *)sender;  // 语音留言 selectedIndex = 7
- (IBAction)activity:(UIButton *)sender;   //活动 selectedIndex = 6
- (IBAction)speech:(UIButton *)sender;   // 路演 selectedIndex = 5

@end

@implementation tabViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //删除系统自带的tabBar
    [self.tabBar removeFromSuperview];
   // NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    
    
    
    
    //加载自定义的tabbar
    UIView *myTabBar = [[[NSBundle mainBundle] loadNibNamed:@"MyTabBar" owner:self options:nil] firstObject];
    myTabBar.backgroundColor = [UIColor clearColor];
//    myTabBar.frame = CGRectMake(0, 606, 375, 61);
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
        myTabBar.frame = CGRectMake(0, 675, 414, 61);
    }else{
        myTabBar.frame = CGRectMake(0, 606, 375, 61);
    }

    [self.view addSubview:myTabBar];
    
//    NSLayoutConstraint *leadingofTabbar = [NSLayoutConstraint constraintWithItem:myTabBar attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
//    NSLayoutConstraint *trailingofTabbar = [NSLayoutConstraint constraintWithItem:myTabBar attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
//    NSLayoutConstraint *bottomofTabbar = [NSLayoutConstraint constraintWithItem:myTabBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-60];
//    NSLayoutConstraint *heightOfTabbar = [NSLayoutConstraint constraintWithItem:myTabBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:60];
//    myTabBar.translatesAutoresizingMaskIntoConstraints = NO;
//
//    [myTabBar addConstraint:heightOfTabbar];
//    [self.view addConstraints:@[leadingofTabbar,trailingofTabbar,bottomofTabbar]];
    
    
    
    //加载rainbow
    UIView *rainBow = [[[NSBundle mainBundle] loadNibNamed:@"RainBow" owner:self options:nil] firstObject];
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
       rainBow = [[[NSBundle mainBundle] loadNibNamed:@"RainBow6p" owner:self options:nil] firstObject];
    }
    
    rainBow.hidden = YES;
    rainBow.layer.anchorPoint = CGPointMake(0.5, 1);
    //    rainBow.center = CGPointMake(375/2, 667-49);
    rainBow.transform = CGAffineTransformMakeRotation(M_PI);
//    rainBow.backgroundColor = [UIColor redColor];
    [self.view insertSubview:rainBow belowSubview:myTabBar];
    
    
    
    
}
- (void)viewDidLayoutSubviews{
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.rainBowView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.rainBowView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:20];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.rainBowView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.rainBowView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:129];
    
    self.rainBowView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rainBowView addConstraint:height];
    [self.view addConstraints:@[leading,bottom,width]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 菜单按钮点击
// 项目
- (IBAction)programBtn:(id)sender {
    if (self.rainBowView.hidden == NO) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        }completion:^(BOOL finished) {
            //取消彩虹桥
            self.rainBowView.hidden = YES;
        }];
        
    }
    
    //切换控制器
    self.selectedIndex = 0;
    
}

//新闻
- (IBAction)newsBtn:(id)sender {
    if (self.rainBowView.hidden == NO) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        }completion:^(BOOL finished) {
            //取消彩虹桥
            self.rainBowView.hidden = YES;
        }];
        
    }
    self.selectedIndex = 1;
}



#warning - -这里是点击了中间的发现
 //发现
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


//社区
- (IBAction)BBSBtn:(id)sender {
    if (self.rainBowView.hidden == NO) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        }completion:^(BOOL finished) {
            //取消彩虹桥
            self.rainBowView.hidden = YES;
        }];
        
    }
    self.selectedIndex = 2;
}


//个人中心
- (IBAction)personCenterBtn:(id)sender {
    if (self.rainBowView.hidden == NO) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        }completion:^(BOOL finished) {
            //取消彩虹桥
            self.rainBowView.hidden = YES;
        }];
        
    }
    self.selectedIndex =3;
}


#warning -这里开始是彩虹里的；

// 附近的人
- (IBAction)neighbor:(id)sender {
    if (self.rainBowView.hidden == NO) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        }completion:^(BOOL finished) {
            //取消彩虹桥
            self.rainBowView.hidden = YES;
        }];
        
    }
    
    self.selectedIndex = 4;
    self.moreNavigationController.navigationBarHidden = YES;
}

// 语音留言
- (IBAction)message:(UIButton *)sender {
    if (self.rainBowView.hidden == NO) {
        self.rainBowView.hidden = YES;
        self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        
        
    }
    self.selectedIndex = 7;
    self.moreNavigationController.navigationBarHidden = YES;
}

 //活动
- (IBAction)activity:(UIButton *)sender {
    if (self.rainBowView.hidden == NO) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        }completion:^(BOOL finished) {
            //取消彩虹桥
            self.rainBowView.hidden = YES;
        }];
        
    }
    self.selectedIndex = 6;
    self.moreNavigationController.navigationBarHidden = YES;
}


 // 路演
- (IBAction)speech:(UIButton *)sender {
    if (self.rainBowView.hidden == NO) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rainBowView.transform = CGAffineTransformMakeRotation(M_PI);
        }completion:^(BOOL finished) {
            //取消彩虹桥
            self.rainBowView.hidden = YES;
        }];
        
    }
    self.selectedIndex = 5;
    self.moreNavigationController.navigationBarHidden = YES;
}
@end
