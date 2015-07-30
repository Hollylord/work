//
//  zhongchouzhongViewController.m
//  ad
//
//  Created by apple on 15/7/29.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "zhongchouzhongViewController.h"
#import "tabViewController.h"

@interface zhongchouzhongViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstViewHeight;
- (IBAction)firstExtention:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;

@property (weak, nonatomic) IBOutlet UIView *sponsorsView;



@end

@implementation zhongchouzhongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
//    UINib *sponsorsCell = [UINib nibWithNibName:@"sponsorCell" bundle:nil];
    
//    [self.sponsorsTableView registerNib:sponsorsCell forCellReuseIdentifier:@"sponsors"];
#warning 关联xib的崩溃位置
//   UIView *sponsors = [[[NSBundle mainBundle] loadNibNamed:@"sponsorsList" owner:self options:nil] firstObject];
//    [self.view addSubview:sponsors];
    
    
  
    
    
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
#pragma mark - tableview 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sponsors"];
    
    return cell;
}
@end
