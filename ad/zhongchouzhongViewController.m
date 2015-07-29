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
@property (weak, nonatomic) IBOutlet UISegmentedControl *chooseSegment;
@property (weak, nonatomic) IBOutlet UITextView *textInformation;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation zhongchouzhongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    [self.chooseSegment addTarget:self action:@selector(abc) forControlEvents:UIControlEventValueChanged];
    
  
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    myTabBarController.customTabBar.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - segment选择
- (void)abc {
    if (self.chooseSegment.selectedSegmentIndex == 3)
    {
        [self.textInformation removeFromSuperview];
       UITableView *sponsors = [[[NSBundle mainBundle] loadNibNamed:@"sponsorsList" owner:self options:nil] firstObject];
        
        //要用代码写autolayout 必须添加这句话。
        sponsors.translatesAutoresizingMaskIntoConstraints = NO;
        
        //tableview关联 xib中的cell
        UINib *nib  = [UINib nibWithNibName:@"detailCell" bundle:nil];
        [sponsors registerNib:nib forCellReuseIdentifier:@"details"];
        
        [self.scrollView addSubview:sponsors];
        
        
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:sponsors attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:sponsors.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:-10];
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:sponsors attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:355];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:sponsors attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.chooseSegment attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:sponsors attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300];
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:sponsors attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
        NSLayoutConstraint *bottom  = [NSLayoutConstraint constraintWithItem:sponsors attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1 constant:-100];
        
        [sponsors addConstraint:height];
        [self.scrollView addConstraint:leading];
        [sponsors addConstraint:width];
        [self.scrollView addConstraint:top];
        [self.view addConstraint:trailing];
        [self.view addConstraint:bottom];
        
        
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"details"];
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
