//
//  alreadyloginViewController.m
//  ad
//
//  Created by apple on 15/7/24.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "alreadyloginViewController.h"

@interface alreadyloginViewController () <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@end

@implementation alreadyloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.bounces = NO;
    
    self.items = @[@"个人信息",@"申请成为领投人",@"我关注的投资人",@"发布项目",@"我发起的项目",@"我投资的项目",@"我关注的项目"];
}
- (void)viewWillAppear:(BOOL)animated{
    self.topConstraint.constant = -64;
    [self.view layoutIfNeeded];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableView代理
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        UIView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"dengluFooter" owner:nil options:nil] firstObject ];
        
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
        footerView = [[[NSBundle mainBundle] loadNibNamed:@"dengluFooter6p" owner:nil options:nil] firstObject ];
            
        }
        return footerView;
    }
    else{
        return  nil;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 35;
    }
    else {
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else {
        return  7;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 152;
    }
    else {
        return 50;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"denglu1" forIndexPath:indexPath];
        return cell;
    }
    else {
        
        //用这个带forIndexPath的，返回指定的cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"denglu2" forIndexPath:indexPath];
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
        NSString *imageName = [NSString stringWithFormat:@"%@",@(indexPath.row + 1)];
        imageView.image = [UIImage imageNamed:imageName];
        UILabel *label = (UILabel *)[cell viewWithTag:2];
        label.text = self.items[indexPath.row];
        return cell;
        
        
       
    }
    
   
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        return ;
    }
    
    if (indexPath.row == 0) {
        
        [self performSegueWithIdentifier:@"already2personinformation" sender:nil];
    }
    
    if (indexPath.row == 1) {
        
        [self performSegueWithIdentifier:@"already2lingtouren" sender:nil];
    }
    
    if (indexPath.row == 2) {
        
        [self performSegueWithIdentifier:@"already2sponsor" sender:nil];
    }
    if (indexPath.row == 3) {
        
        [self performSegueWithIdentifier:@"already2publish" sender:nil];
    }
    
    if (indexPath.row == 5) {
        [self performSegueWithIdentifier:@"person2myprogram" sender:nil];
    }
    
    if (indexPath.row == 6) {
        [self performSegueWithIdentifier:@"already2guanzhuprogram" sender:nil];
    }
    
}





@end
