//
//  yuyinViewController.m
//  ad
//
//  Created by apple on 15/8/3.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "yuyinViewController.h"
#import "tabViewController.h"
#import "Headers/BDRecognizerViewController.h"
#define API_KEY @"ZVijfxAIyfLMeqFAxylgCYWo" // 请修改为您在百度开发者平台申请的API_KEY
#define SECRET_KEY @"1103449e1c6520155a4ef7950ed1a6a6" // 请修改您在百度开发者平台申请的SECRET_KEY

@interface yuyinViewController () <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,BDRecognizerViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *toggleBtn;
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UIView *inputView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yOfInputView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) BDRecognizerViewController *recognizerViewController;
- (IBAction)toggleKey:(UIButton *)sender;
- (IBAction)talk:(UIButton *)sender;

@property (strong,nonatomic) NSMutableArray *heights;
@property (copy,nonatomic) NSString *inputString;
@property (assign,nonatomic) int messages;
@end

@implementation yuyinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.typeField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardRise:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
    self.messages = 1;
    self.heights = [NSMutableArray arrayWithObject:@50];
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
    
    NSLog(@"%d",self.messages);

    return self.messages;
}

//每次reload 高度会重新计算
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"reload %f",[[self.heights objectAtIndex:indexPath.row] floatValue] + 10);
    return [[self.heights objectAtIndex:indexPath.row] floatValue] + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"liuyan" forIndexPath:indexPath];
        
        UIImage *talkingBG = [[UIImage imageNamed:@"liuyan1"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
        UIImageView *talking = (UIImageView *)[cell viewWithTag:2];
        talking.image = talkingBG;
        UILabel *label = (UILabel *)[cell viewWithTag:3];
        label.text = @"我是项目经理，有什么问题请留言！";
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yuyin" forIndexPath:indexPath];
        
        UIImage *talkingBG = [[UIImage imageNamed:@"liuyan2"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
        UIImageView *talking = (UIImageView *)[cell viewWithTag:2];
        talking.image = talkingBG;
        UILabel *label = (UILabel *)[cell viewWithTag:3];
        label.text = self.inputString;
        return cell;
    }
    
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

//语音
- (IBAction)talk:(UIButton *)sender {
    BDRecognizerViewController *recognizerViewController = [[BDRecognizerViewController alloc] initWithOrigin:CGPointMake(30, 250) withTheme:[BDTheme defaultTheme]];
    recognizerViewController.enableFullScreenMode = NO; //设置是否全屏模式
    recognizerViewController.delegate = self;
    self.recognizerViewController = recognizerViewController;
    
    
    // 设置识别参数
    BDRecognizerViewParamsObject *paramsObject = [[BDRecognizerViewParamsObject alloc] init];
    
    // 开发者信息，必须修改API_KEY和SECRET_KEY为在百度开发者平台申请得到的值，否则示例不能工作
    paramsObject.apiKey = API_KEY;
    paramsObject.secretKey = SECRET_KEY;
    
    //    // 设置是否需要语义理解，只在搜索模式有效
    paramsObject.isNeedNLU = YES;
    paramsObject.tipsTitle = @"请说话";
    //
    //    // 设置识别语言
    //    paramsObject.language = [BDVRSConfig sharedInstance].recognitionLanguage;
    //
    //    // 设置识别模式，分为搜索和输入
    //    paramsObject.recogPropList = @[@1];
    
    paramsObject.resultShowMode = BDRecognizerResultShowModeContinuousShow;
    
    paramsObject.isShowTipAfter3sSilence = NO;
    paramsObject.isShowHelpButtonWhenSilence = NO;
    paramsObject.tipsTitle = @"可以使用如下指令记账";
    paramsObject.tipsList = [NSArray arrayWithObjects:@"我要记账", @"买苹果花了十块钱", @"买牛奶五块钱", @"第四行滚动后可见", @"第五行是最后一行", nil];
    
    
    
    // 设置城市ID，当识别属性包含EVoiceRecognitionPropertyMap时有效
    paramsObject.cityID = 1;
    
    [recognizerViewController startWithParams:paramsObject];
    
}

#pragma mark - textField
- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.inputString = textField.text;
    NSDictionary *attribute = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17.0] forKey:NSFontAttributeName];
    CGSize textRect = [self.inputString boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;

    NSString *height = [NSString stringWithFormat:@"%f",textRect.height];
    [self.heights addObject:height];
    self.messages += 1;
    [self.tableView reloadData];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.typeField endEditing:YES];
    self.typeField.text = nil;
    return YES;
}

#pragma mark - 百度语音回调
- (void)onEndWithViews:(BDRecognizerViewController *)aBDRecognizerViewController withResults:(NSArray *)aResults{
    if ([[BDVoiceRecognitionClient sharedInstance] getRecognitionProperty] != EVoiceRecognitionPropertyInput)
    {
        // 在非输入模式下，当 isNeedNLU = NO 时，结果是一个候选句列表，为 NSArray，
        // 元素是 NSString，例如["公园", "公元"]
        // 当 isNeedNLU = YES 时，结果类型仍为 NSArray，只有一个 NSString 元素，
        // 内容是 JSON 串，开发者需要自行解析，解析方法请参考语义解析文档
        NSMutableString *tmpString = [aResults objectAtIndex:0];
        self.inputString = tmpString;
    }
    else
    {
        
    }
}
@end
