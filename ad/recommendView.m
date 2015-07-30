//
//  recommendView.m
//  ad
//
//  Created by apple on 15/7/21.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "recommendView.h"
#import "programViewController.h"

@implementation recommendView
- (IBAction)tapProgram:(UITapGestureRecognizer *)sender {
    
    if ([self.delegate respondsToSelector:@selector(tapProgram)]) {
        [self.delegate tapProgram];
    }
    
}

//这个方法只对于自己的创建，这个方法当中，子控件并没有创建完；如果是用xib创建view，尽量不要用这个方法！
- (id)initWithCoder:(NSCoder *)aDecoder{
    
    
    self = [super initWithCoder:aDecoder];
    if (self) {
   
    }
    return self;
}

#pragma mark - 进度条

//子控件创建完了，可以对于子控件的配置写在这里
- (void)awakeFromNib{
    //配置progressView 进度条
    [self.progressView showPopUpViewAnimated:YES];
    self.progressView.progress = 0.0;
    
    self.progressView.popUpViewCornerRadius = 8.0;
    //    self.progressView.popUpViewColor = [UIColor grayColor];
    self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:20];
    self.progressView.dataSource = self;
    self.progressView.popUpViewColor = [UIColor redColor];
    [self progress];
}

- (BOOL)progressViewShouldPreCalculatePopUpViewSize:(ASProgressPopUpView *)progressView;
{
    return NO;
}

- (NSString *)progressView:(ASProgressPopUpView *)progressView stringForProgress:(float)progress{
    
        return nil;
    
}

- (void)progress
{
    
    float progress = self.progressView.progress;
    if (progress < 1.0 ) {
        
        progress += 0.005;
        
        [self.progressView setProgress:progress animated:YES];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1
                                         target:self
                                       selector:@selector(progress)
                                       userInfo:nil
                                        repeats:NO];
    }
}

@end
