//
//  niuRenGuandianViewController.m
//  ad
//
//  Created by hollylord on 15/8/2.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "niuRenGuandianViewController.h"
#import "tabViewController.h"

@interface niuRenGuandianViewController ()

@end

@implementation niuRenGuandianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    [myTabBarController.customTabBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"points" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


@end
