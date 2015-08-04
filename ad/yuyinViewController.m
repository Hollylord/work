//
//  yuyinViewController.m
//  ad
//
//  Created by apple on 15/8/3.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "yuyinViewController.h"
#import "tabViewController.h"

@interface yuyinViewController () <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *toggleBtn;
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UIView *inputView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yOfInputView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)toggleKey:(UIButton *)sender;
- (IBAction)talk:(UIButton *)sender;

@property (strong,nonatomic) NSMutableArray *heights;
@property (copy,nonatomic) NSString *inputString;
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
//    NSDictionary *userInfo = [aNotification userInfo];
//    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    NSLog(@"123");
//
//    CGFloat y = keyboardRect.size.height + self.yOfInputView.constant ;
    self.yOfInputView.constant = 258;
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.inputView layoutIfNeeded];
    }];
    
    
}

- (void)keyboardHide:(NSNotification *)aNotification{
//    NSDictionary *userInfo = [aNotification userInfo];
//    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//    
//    CGFloat y =  self.yOfInputView.constant - keyboardRect.size.height ;
    self.yOfInputView.constant = 0;
    
    NSLog(@"%@",self.yOfInputView);
    
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.inputView layoutIfNeeded];
    }];
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[self.heights objectAtIndex:indexPath.row] floatValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"liuyan" forIndexPath:indexPath];
    
    UIImage *talkingBG = [[UIImage imageNamed:@"liuyan1"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    UIImageView *talking = (UIImageView *)[cell viewWithTag:2];
    talking.image = talkingBG;
    UILabel *label = (UILabel *)[cell viewWithTag:3];
    label.text = self.inputString;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


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

#pragma mark - textField
- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.inputString = textField.text;
    NSDictionary *attribute = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17.0] forKey:NSFontAttributeName];
    CGSize textRect = [self.inputString boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;

    NSString *height = [NSString stringWithFormat:@"%f",textRect.height];
    [self.heights addObject:height];
    [self.tableView reloadData];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.typeField endEditing:YES];
    return YES;
}
@end
