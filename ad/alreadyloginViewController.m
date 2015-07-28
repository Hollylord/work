//
//  alreadyloginViewController.m
//  ad
//
//  Created by apple on 15/7/24.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "alreadyloginViewController.h"

@interface alreadyloginViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *items;

@end

@implementation alreadyloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.items = @[@"个人信息",@"申请成为领投人",@"我关注的投资人",@"发布项目",@"我发起的项目",@"我投资的项目",@"我关注的项目"];
}

#pragma mark - tableView代理
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, cell.frame.size.width - 30, cell.frame.size.height)];
    label.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    label.text = self.items[indexPath.row];
    //把东西加载contentView上面 不能直接设置字了！
    [cell.contentView addSubview:label] ;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
