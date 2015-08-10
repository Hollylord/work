//
//  neighborViewController.m
//  ad
//
//  Created by apple on 15/7/24.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "neighborViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>

@interface neighborViewController () <MAMapViewDelegate,AMapSearchDelegate>

{
    MAMapView *_map;
    AMapSearchAPI *_searchAPI;
}
@end

@implementation neighborViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MAMapServices sharedServices].apiKey = @"39bf91da25d83ab8d35f6e7e4a9ada45";
    
    //添加地图
    _map = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _map.delegate = self;
    //显示用户位置
    _map.showsUserLocation = YES;
    _map.pausesLocationUpdatesAutomatically = YES;
    //设置地图跟随模式
    [_map setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    [self.view addSubview:_map];

    
}

#pragma mark - 地图代理


- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    if (_map.userLocation.subtitle != nil) {
        return ;
    }
    //搜索
    _searchAPI = [[AMapSearchAPI alloc] initWithSearchKey:@"39bf91da25d83ab8d35f6e7e4a9ada45" Delegate:self];
    AMapReGeocodeSearchRequest *request = [[AMapReGeocodeSearchRequest alloc] init];
    
    //获得用户坐标
    AMapGeoPoint *userLocation1 = [[AMapGeoPoint alloc] init];
    userLocation1.longitude = userLocation.location.coordinate.longitude;
    userLocation1.latitude = userLocation.location.coordinate.latitude;
    if (userLocation1 != nil) {
        request.location = userLocation1;
        
        [_searchAPI AMapReGoecodeSearch:request];
    }
    

    
}
#pragma mark - 搜索代理
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response{
    _map.userLocation.subtitle = response.regeocode.formattedAddress;
    NSLog(@"%@",response.regeocode.formattedAddress);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
