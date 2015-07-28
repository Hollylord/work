//
//  lingtourenViewController.m
//  ad
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "lingtourenViewController.h"

@interface lingtourenViewController ()
@property (weak, nonatomic) IBOutlet UIButton *dagouBtn;
- (IBAction)dagou:(UIButton *)sender;

@end

@implementation lingtourenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 点击按钮
- (IBAction)dagou:(UIButton *)sender {
    if (self.dagouBtn.selected == NO) {
        self.dagouBtn.selected = YES;
    }
    else {
    self.dagouBtn.selected = NO;
    }
    
}
@end
