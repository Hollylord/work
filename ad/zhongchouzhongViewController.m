//
//  zhongchouzhongViewController.m
//  ad
//
//  Created by apple on 15/7/29.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "zhongchouzhongViewController.h"
#import "tabViewController.h"
#import "sponsorsList.h"

@interface zhongchouzhongViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstViewHeight;
- (IBAction)firstExtention:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet sponsorsList *view4;






@end

@implementation zhongchouzhongViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
//    self.view4.tableView.delegate = self;
//    self.view4.tableView.dataSource = self;
    
//    UINib *sponsorsCell = [UINib nibWithNibName:@"sponsorCell" bundle:nil];
//    [self.sponsorsTableview registerNib:sponsorsCell forCellReuseIdentifier:@"sponsors"];
    

    
    
  
    
    
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

@end
