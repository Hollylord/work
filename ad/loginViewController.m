//
//  loginViewController.m
//  ad
//
//  Created by apple on 15/7/22.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "loginViewController.h"
#import "UMSocial.h"

@interface loginViewController () <UMSocialUIDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *items;
- (IBAction)loginBtn:(UIButton *)sender;
- (IBAction)zhuceBtn:(UIButton *)sender;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *loginView = [[[NSBundle mainBundle] loadNibNamed:@"login" owner:self options:nil] firstObject];
    loginView.frame = CGRectMake(0, 128/2, 375, 152);
    [self.view addSubview:loginView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.items = @[@"个人信息",@"申请成为领投人",@"我关注的投资人",@"发布项目",@"我发起的项目",@"我投资的项目",@"我关注的项目"];
    
    

}
#pragma mark - tableView方法
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 按钮事件

- (IBAction)loginBtn:(UIButton *)sender {
    [self performSegueWithIdentifier:@"person2login" sender:nil];
}

- (IBAction)zhuceBtn:(UIButton *)sender {
    [self performSegueWithIdentifier:@"login2zhuce" sender:nil];
}
@end
