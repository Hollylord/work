//
//  yuyinViewController.m
//  ad
//
//  Created by apple on 15/8/3.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "yuyinViewController.h"
#import "tabViewController.h"

@interface yuyinViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *toggleBtn;
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UIView *inputView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yOfInputView;

- (IBAction)toggleKey:(UIButton *)sender;
- (IBAction)talk:(UIButton *)sender;

@end

@implementation yuyinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.typeField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardRise:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.typeField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated{
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    [myTabBarController.customTabBar setHidden:YES];
    self.yOfInputView.constant = 0;
}
- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.typeField resignFirstResponder];
}
#pragma mark - 键盘响应的通知
- (void)keyboardRise:(NSNotification *)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    NSLog(@"123");

//    CGFloat y = 258 + self.yOfInputView.constant ;
    self.yOfInputView.constant = 258;
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.inputView layoutIfNeeded];
    }];
    
    
}

- (void)keyboardHide:(NSNotification *)aNotification{
    
    
    NSLog(@"%@",self.yOfInputView);
    
    self.yOfInputView.constant = 0;
    [UIView animateWithDuration:1.0 animations:^{
        [self.inputView layoutIfNeeded];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 按钮点击
- (IBAction)toggleKey:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        self.talkBtn.hidden = YES;
        self.typeField.hidden = NO;
    }
    else{
        self.talkBtn.hidden = NO;
        self.typeField.hidden = YES;
    }
    
    
    
}

- (IBAction)talk:(UIButton *)sender {
}
@end
