//
//  neighborViewController.m
//  ad
//
//  Created by apple on 15/7/24.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "neighborViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface neighborViewController () <MAMapViewDelegate>
@property (nonatomic,strong) MAMapView *map;
@end

@implementation neighborViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MAMapServices sharedServices].apiKey = @"39bf91da25d83ab8d35f6e7e4a9ada45";
    
    //添加地图
    self.map = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.map.delegate = self;
    //显示用户位置
    self.map.showsUserLocation = YES;
    //设置地图跟随模式
    [self.map setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    [self.view addSubview:self.map];
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
