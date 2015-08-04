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
#import "customAnnotationView.h"
#import "popUpView.h"

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
    _map.translatesAutoresizingMaskIntoConstraints = NO;
    MACoordinateRegion customRegion = MACoordinateRegionMake(_map.centerCoordinate, MACoordinateSpanMake(0.1, 0.1));
    [_map setRegion:customRegion animated:YES];
    [self.view addSubview:mapView];
    [_map setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    
    //搜索设置
    _searchAPI = [[AMapSearchAPI alloc] initWithSearchKey:@"39bf91da25d83ab8d35f6e7e4a9ada45" Delegate:self];
    AMapGeocodeSearchRequest *request = [[AMapGeocodeSearchRequest alloc] init];
    request.city = @[@"深圳"];
    request.address = @"卫东龙商务大厦";
    [_searchAPI AMapGeocodeSearch:request];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - searchAPI 回调
- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response{
    AMapGeocode *geoCode = response.geocodes[0];
    
    //配置annotation
    _annotation = [[MAPointAnnotation alloc] init];
    _annotation.coordinate = CLLocationCoordinate2DMake(geoCode.location.latitude, geoCode.location.longitude);
    _annotation.title = @"工作地点";
    _annotation.subtitle = @"卫东龙商务大厦";
    [_map addAnnotation:_annotation];
    
}

#pragma mark - annotationView
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *reusedID = @"annotation";
        customAnnotationView *annotationView = (customAnnotationView *)[_map dequeueReusableAnnotationViewWithIdentifier:reusedID];
        if (annotationView == nil) {
            annotationView = [[customAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reusedID];
            
        }
        annotationView.image = [UIImage imageNamed:@"touhu"];
//        annotationView.canShowCallout = YES;r
        
        return annotationView;
    }
    return nil;
    
}
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view{
    
    view.selected = YES;
        
//        annotationView.translatesAutoresizingMaskIntoConstraints = NO;
//        annotationView.popView.translatesAutoresizingMaskIntoConstraints = NO;
//        
//        NSLayoutConstraint *center = [NSLayoutConstraint constraintWithItem:annotationView.popView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:annotationView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
//        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:annotationView.popView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:annotationView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
//        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:annotationView.popView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
//        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:annotationView.popView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
//        [callout addConstraints:@[width,height]];
//        [self.view addConstraints:@[center,bottom]];
//    }
//    else {
//        [annotationView setSelected:YES animated:YES];
//        [annotationView.popView removeFromSuperview];
//    }
//
//    NSLog(@"123");
}


@end
