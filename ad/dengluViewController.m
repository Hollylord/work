//
//  dengluViewController.m
//  ad
//
//  Created by apple on 15/7/23.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "dengluViewController.h"
#import "UMSocial_Sdk_4.2.3/Header/UMSocial.h"

@interface dengluViewController ()


- (IBAction)weiboBtn:(id)sender;
- (IBAction)weixinBtn:(UIButton *)sender;
- (IBAction)qqBtn:(UIButton *)sender;

@end

@implementation dengluViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"您输入的密码错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil] ;
    [alert  show];
}

- (IBAction)weiboBtn:(id)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToSina  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
    }];
    
}

- (IBAction)weixinBtn:(UIButton *)sender {
    
    
}

- (IBAction)qqBtn:(UIButton *)sender {
    
}
@end
