//
//  hangyeViewController.m
//  ad
//
//  Created by apple on 15/8/3.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "hangyeViewController.h"
#import "tabViewController.h"

@interface hangyeViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation hangyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
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
    
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1){
        return 2;
    }
    else {
        return 1;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
        
    }
    else if (section == 1){
        return 0;
    }
    else {
        return 20;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    [view setHidden:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"picture" forIndexPath:indexPath];
        return cell;
    
    }
    else if (indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhiding" forIndexPath:indexPath];
        return cell;
    }
    else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taolun" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            UILabel *head = (UILabel *)[cell viewWithTag:4];
            head.text = @"互联网金融，要么创新，要么死";
            UILabel *detail = (UILabel *)[cell viewWithTag:5];
            NSString *article = @"入市谈判的时候，谈判长龙用途最担心的是银行和农业，五年前，最有智慧的金融学家们。。。。。。..........";
            detail.text = article;
            //获得自动换行后的UILabel的size
            NSDictionary *attribute = [NSDictionary dictionaryWithObject:detail.font forKey:NSFontAttributeName];
            
            //获得UILabel的size的方法：参数1：讲文字限制在多大的rect中
            //然后，它通过自动换行后计算出这个rect的实际大小。
            CGSize textSize = [detail.text boundingRectWithSize:CGSizeMake(350, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
//            NSLog(@"%@",NSStringFromCGSize(textSize));
            
           
            
            
            
        }
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    else if (indexPath.section == 1)
    {
        return 30;
    }
    else {
        return 150;
    }
}
@end
