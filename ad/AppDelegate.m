//
//  AppDelegate.m
//  ad
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"
#import "advertViewController.h"
#import "tabViewController.h"
#import "UMSocialWechatHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置友盟的appKey
    [UMSocialData setAppKey:@"55af41d967e58e3f30005565"];
    

    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wx43b8499d08842d8a" appSecret:@"80e470d7cc365cea2e677a87fb84e2bb" url:@"http://www.umeng.com/social"];
    
NSString *version = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"version"] == nil) {
        [[NSUserDefaults standardUserDefaults] setValue:version forKey:@"version"];
    }
    else if (![[[NSUserDefaults standardUserDefaults] valueForKey:@"version"] isEqualToString:version])
    {
        self.window.rootViewController = [[advertViewController alloc] init];
        
    }
    else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"tabbar"];
    }
    
    
    return YES;
}
//微信分享
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
