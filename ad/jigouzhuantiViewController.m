//
//  jigouzhuantiViewController.m
//  ad
//
//  Created by apple on 15/8/3.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "jigouzhuantiViewController.h"
#import "tabViewController.h"

@interface jigouzhuantiViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *imageNames;
@property (strong,nonatomic) NSMutableArray *companyNames;
@property (strong,nonatomic) NSMutableArray *companyFullNames;
@end

@implementation jigouzhuantiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageNames = [NSMutableArray arrayWithObjects:@"tong",@"gao",@"da",@"tongchuang",@"jun", nil];
    self.companyNames = [NSMutableArray arrayWithObjects:@"同威创投",@"高特佳",@"大正元",@"同创伟业",@"君盛投资", nil];
    self.companyFullNames = [NSMutableArray arrayWithObjects:@"深圳市同威创业投资有限公司",@"深圳市高特佳投资集团有限公司",@"深圳市大元股份投资基金管理有限公司",@"深圳市同创伟业资产管理股份有限公司",@"深圳市君盛投资管理有限公司", nil];
}

- (void)viewWillAppear:(BOOL)animated{
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    [myTabBarController.customTabBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jigoutupian" forIndexPath:indexPath];
        return cell;
    }
    else {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jigou" forIndexPath:indexPath];
        UIImageView *icon = (UIImageView *)[cell viewWithTag:1];
        NSString *name = self.imageNames[indexPath.section - 1];
        icon.image = [UIImage imageNamed:name];
        UILabel *companyName = (UILabel *)[cell viewWithTag:2];
        companyName.text = self.companyNames[indexPath.section - 1];
        UILabel *time = (UILabel *)[cell viewWithTag:3];
        time.text = @"2015.7.31";
        UILabel *fullName = (UILabel *)[cell viewWithTag:4];
        fullName.text = self.companyFullNames[indexPath.section - 1];
        
    
    
    return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

@end
