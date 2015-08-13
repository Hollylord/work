//
//  recommendView.h
//  ad
//
//  Created by apple on 15/7/21.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASProgressPopUpView.h"

@protocol recommendViewDelegate <NSObject>

- (void)tapProgram;

@end

@interface recommendView : UIView <ASProgressPopUpViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet ASProgressPopUpView *progressView;
@property (weak,nonatomic) id <recommendViewDelegate>delegate;

@end

