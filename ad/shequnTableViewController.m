//
//  shequnTableViewController.m
//  ad
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "shequnTableViewController.h"
#import "tabViewController.h"
#import "yuyinViewController.h"

@interface shequnTableViewController ()


@end

@implementation shequnTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    [myTabBarController.customTabBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// 返回多少组；
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}
// 对应的组里面有多少行;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    else {
        return 1;
    }
    
    
}
//header高度设置
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else if (section == 1)
    {
        return 30;
    }
    else {
        return 0;
    }
}

//header内容设置
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1 ) {
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 30)];
        headerLabel.text = @"热门观点";
        headerLabel.textAlignment = NSTextAlignmentCenter ;
        headerLabel.backgroundColor = [UIColor colorWithRed:200 green:200 blue:200 alpha:1];
        return headerLabel;
    }
    else {
        return nil;
    }
    
}

//footer高度设置
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 20;
    }
    else {
        return 0;
    }
}


//cell内容设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shequn" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        
        //设置主标题
       UILabel *fenLei = (UILabel *)[cell viewWithTag:1];
        if (indexPath.row == 0){
            fenLei.text = @"行业讨论";
        }
        else if (indexPath.row == 1){
            fenLei.text = @"机构专题";
        }
        else if (indexPath.row == 2){
            fenLei.text = @"项目咨询";
        }
        else {
            fenLei.text = @"牛人观点";
        }
        
        //设置图片
        UIImageView *icon = (UIImageView *)[cell viewWithTag:2];
        if (indexPath.row == 2) {
            icon.image = [UIImage imageNamed:@"xiangmuzixun"];
        }
        else if (indexPath.row == 3)
        {
            icon.image = [UIImage imageNamed:@"niurenguandian"];
        }
        else if (indexPath.row == 0)
        {
            icon.image = [UIImage imageNamed:@"hangyetaolun"];
        }
        else if (indexPath.row == 1)
        {
            icon.image = [UIImage imageNamed:@"jigouzhuanti"];
        }
        
        UILabel *label2 = (UILabel *)[cell viewWithTag:3];
        if (indexPath.row == 0) {
            label2.text = @"最专业、最齐全的行业信息讨论";
        }
        else if (indexPath.row == 1)
        {
            label2.text = @"权威机构带你投资";
        }
        else if (indexPath.row == 2)
        {
            label2.text = @"项目经理一对一为你解答";
        }
        else {
            label2.text = @"在这里你也可以是权威";
        }
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"remendongtai" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        if (indexPath.row == 3) {
            [self performSegueWithIdentifier:@"shequn2points" sender:nil];
        }
        else if (indexPath.row == 1)
        {
            [self performSegueWithIdentifier:@"shequn2jigouzhuanti" sender:nil];
        }
        else if (indexPath.row == 0)
        {
            [self performSegueWithIdentifier:@"shequn2hangyetaolun" sender:nil];
        }
        else if (indexPath.row == 2)
        {
            [self performSegueWithIdentifier:@"shequn2yuyin" sender:nil];
            
        }
    }
}

//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section != 0) {
        //热门观点高度
        return 152;
    }
    else {
        //分类的高度
        return 75;
    }
}



@end
