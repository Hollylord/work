//
//  speechViewController.m
//  ad
//
//  Created by apple on 15/7/24.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "speechViewController.h"
#import "tabViewController.h"
#import  <MediaPlayer/MediaPlayer.h>

@interface speechViewController () <UIWebViewDelegate>
{
    MPMoviePlayerController *_play;
}


@end

@implementation speechViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _play = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://pl.youku.com/playlist/m3u8?vid=321514956&type=flv&ts=1439366893&keyframe=0&ep=dCaXE0qLUMYJ5ifaiz8bMyW0ISQOXP0I9xqEhdtnBtQlTuC2&sid=643936689345312d9fec1&token=1689&ctype=12&ev=1&oip=3071127905"]];
    _play.view.frame = CGRectMake(0, 0, 375, 400);
    _play.scalingMode = MPMovieScalingModeAspectFit;
//    [_play setFullscreen:YES animated:YES];
    
    [self.view addSubview:_play.view];
    [_play play];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    tabViewController *tabbarController = (tabViewController *)self.tabBarController;
    tabbarController.customTabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
