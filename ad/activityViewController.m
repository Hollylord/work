//
//  activityViewController.m
//  ad
//
//  Created by apple on 15/8/4.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "activityViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>

@interface activityViewController () <MAMapViewDelegate,AMapSearchDelegate>
{
    MAMapView *_map;
    MAPointAnnotation *_annotation;
    AMapSearchAPI *_searchAPI;
    CLLocation *_currentLocation;
}
@end

@implementation activityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MAMapServices sharedServices].apiKey = @"39bf91da25d83ab8d35f6e7e4a9ada45";
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _map = mapView;
    mapView.delegate = self;
    [self.view addSubview:mapView];
    [_map setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    
    //搜索设置
    _searchAPI = [[AMapSearchAPI alloc] initWithSearchKey:@"39bf91da25d83ab8d35f6e7e4a9ada45" Delegate:self];
    AMapGeocodeSearchRequest *request = [[AMapGeocodeSearchRequest alloc] init];
    request.city = @[@"深圳"];
    request.address = @"卫东龙商务大厦";
    [_searchAPI AMapGeocodeSearch:request];
    
    //配置annotation
    _annotation = [[MAPointAnnotation alloc] init];
    [_map addAnnotation:_annotation];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - searchAPI 回调
- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response{
    AMapGeocode *geoCode = response.geocodes[0];
    
    
    _annotation.coordinate = CLLocationCoordinate2DMake(geoCode.location.latitude, geoCode.location.longitude);
    
    
}

@end
