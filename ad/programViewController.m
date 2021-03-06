//
//  programViewController.m
//  ad
//
//  Created by apple on 15/7/21.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "programViewController.h"
#import "INSSearchBar.h"
#import "ASProgressPopUpView.h"
#import "recommendView.h"
#import "segmentView.h"
#import "tabViewController.h"
#import "zhongchouzhongViewController.h"
<<<<<<< HEAD

#import "segmentView6p.h"


=======
#import "TalkingData.h"
>>>>>>> origin/master

@interface programViewController () <INSSearchBarDelegate,recommendViewDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet segmentView *segmentView;



@property (nonatomic, strong) INSSearchBar *searchBarWithDelegate;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *onGoingBtn;     // 众筹中
@property (weak, nonatomic) IBOutlet UIButton *prepareBtn;     // 预热中
@property (weak, nonatomic) IBOutlet UIButton *abroadBtn;     // 海外项目

@property (weak,nonatomic)   UIButton *call;

//用来存放recommendViews
@property (strong,nonatomic) NSMutableArray *programs;





- (IBAction)onGoingBtn:(id)sender;   // 众筹中IBAction
- (IBAction)prepareBtn:(id)sender;     // 预热中IBAction
- (IBAction)abroad:(UIButton *)sender; // 海外项目IBAction


@end

@implementation programViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //去除弹簧效果；
    //self.scrollView.bounces =NO;
    //添加一个大背景
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
    //这种方式设置imageview 默认大小和图片一样
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dabeijing"]];
    [self.view insertSubview:background belowSubview:self.scrollView];
    
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:background attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:background attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:background attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:background attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.view addConstraints:@[leading,trailing,top,bottom]];

    background.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    
    //添加搜索框
    self.searchBarWithDelegate = [[INSSearchBar alloc] initWithFrame:CGRectMake(15, 25, 44, 34)];
    self.searchBarWithDelegate.delegate = self;
    [self.view addSubview:self.searchBarWithDelegate];
    
    //添加电话按键
    UIButton *callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.call = callBtn;
    
    self.call.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - 40, 28, 27, 27);
#warning -这里修改了
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
        [self.call setBackgroundImage:[UIImage imageNamed:@"call"] forState:UIControlStateNormal];

    }else{
        [self.call setImage:[UIImage imageNamed:@"call"] forState:UIControlStateNormal];
    }
    
    [self.view addSubview:self.call];
    [self.call addTarget:self action:@selector(phoneCall) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    //配置segmentView 这个包装三个btn的
    segmentView *segmentView = [[[NSBundle mainBundle] loadNibNamed:@"segmentView" owner:self options:nil] firstObject];
    
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
        segmentView = [[[NSBundle mainBundle] loadNibNamed:@"segmentView6p" owner:self options:nil] firstObject];
        
    }
    self.segmentView = segmentView;
    
    
    
    //*** frame 是按照父view为参照来算的，所以是152，如果是按照self.view来算就是216了
    segmentView.frame = CGRectMake(0, 152, self.view.frame.size.width, 42); // 这个包装三个btn的
    
    [self.scrollView addSubview:segmentView];
    self.onGoingBtn.selected = YES;
    
    
    
    //配置第一个recommendView   recommendView下面这个就是那个xib
    recommendView *recommendView = [[[NSBundle mainBundle] loadNibNamed:@"recommend" owner:self options:nil] firstObject];
    
#warning -这里改了
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
        recommendView = [[[NSBundle mainBundle] loadNibNamed:@"recommend6p" owner:self options:nil] firstObject];
    }
    
    self.programs  = [NSMutableArray arrayWithObject:recommendView];
    
    // 下面这个就是那个xib
    recommendView.frame = CGRectMake(6.5, segmentView.frame.origin.y + segmentView.frame.size.height, 362, 212);
    
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
    recommendView.frame = CGRectMake(6.5, segmentView.frame.origin.y + segmentView.frame.size.height, 400, 212);
        
    }
    
    [self.scrollView addSubview:recommendView];
    
    //负责传递点击recommendView事件
    recommendView.delegate = self;
    //设置scrollView的滚动范围
    self.scrollView.contentSize = CGSizeMake(0,recommendView.frame.origin.y + recommendView.frame.size.height + 20 );
    
    [self progress];
 
    
    
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    [myTabBarController.customTabBar setHidden:NO];
    [TalkingData trackPageBegin:@"首页"];
}
- (void)viewDidDisappear:(BOOL)animated{
    [TalkingData trackPageEnd:@"首页"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 搜索框代理


- (CGRect)destinationFrameForSearchBar:(INSSearchBar *)searchBar
{
    return CGRectMake(15, 25, CGRectGetWidth(self.view.bounds) - 70.0, 30);
}

- (void)searchBar:(INSSearchBar *)searchBar willStartTransitioningToState:(INSSearchBarState)destinationState
{
    // Do whatever you deem necessary.
}

- (void)searchBar:(INSSearchBar *)searchBar didEndTransitioningFromState:(INSSearchBarState)previousState
{
    // Do whatever you deem necessary.
}

- (void)searchBarDidTapReturn:(INSSearchBar *)searchBar
{
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
}

- (void)searchBarTextDidChange:(INSSearchBar *)searchBar
{
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
}


#pragma mark - 点击项目
- (void)tapProgram {
    if (self.onGoingBtn.selected) {
        [self performSegueWithIdentifier:@"program2zhongchouzhong" sender:nil];
        [TalkingData trackEvent:@"点击项目" label:@"众筹中"];
    }
    else
    {
        [self performSegueWithIdentifier:@"program2yurezhong" sender:nil];
        [TalkingData trackEvent:@"点击项目" label:@"预热中"];
    }
    
   
    
}


#pragma mark - 点击进行中/预热中
// 众筹中IBAction
- (IBAction)onGoingBtn:(id)sender {
    
    self.onGoingBtn.selected = YES;
    self.prepareBtn.selected = NO;
    self.abroadBtn.selected = NO;
    
    for (recommendView *view in self.programs) {
        view.progressView.popUpViewColor = [UIColor grayColor];
            view.backgroundImage.image = [UIImage imageNamed:@"recommendBackground"];
    }

    //  进度条；
    [self progress];
    
    
    self.segmentView.backgroundImage.image = [UIImage imageNamed:@"segmentBackground1"];
    
    //拿到总共的recommendView数量
    NSInteger countOfRecommendViews = self.programs.count;
    //把除了第一个recommendView的其他recommendView删除
    for (int i = 1; i < countOfRecommendViews; i ++) {
        recommendView *view = [self.programs lastObject];
        [view removeFromSuperview];
        [self.programs removeLastObject];
    }
    //重新计算scrollView的滚动范围
    recommendView *lastView = [self.programs lastObject];
    self.scrollView.contentSize = CGSizeMake(0,lastView.frame.origin.y + lastView.frame.size.height + 20 );
    

}

// 预热中IBAction
- (IBAction)prepareBtn:(id)sender {
    
    self.prepareBtn.selected = YES;
    self.onGoingBtn.selected = NO;
    self.abroadBtn.selected = NO;
    
    //计算第一个recommendview的y 和高
    UIView *view = self.programs[0];
    CGFloat y = view.frame.origin.y;
    CGFloat height = view.frame.size.height;
    
    //拿到总共的recommendView数量
    NSInteger countOfRecommendViews = self.programs.count;
    //把所有recommendview清除
    for (int i = 0; i < countOfRecommendViews; i ++) {
        recommendView *view = [self.programs lastObject];
        [view removeFromSuperview];
        [self.programs removeLastObject];
    }
    
    

    
    
    //循环创建recommendview
    for (int i = 0; i < 5; i ++) {
        recommendView *View2 = [[[NSBundle mainBundle] loadNibNamed:@"recommend" owner:self options:nil] firstObject];
#warning -这里改了
        if ([[UIScreen mainScreen] bounds].size.width > 375) {
            View2 = [[[NSBundle mainBundle] loadNibNamed:@"recommend6p" owner:self options:nil] firstObject];
        }


        View2.frame = CGRectMake(6.5, y + (height +20) * i , 362, 212);
        if ([[UIScreen mainScreen] bounds].size.width > 375) {
        View2.frame = CGRectMake(6.5, y + (height +20) * i, 400, 212);
        }

        View2.delegate = self;
        [self.programs addObject:View2];
        [self.scrollView addSubview:View2];
        

    }
    
    //重新计算scrollView的滚动范围
    recommendView *lastView = [self.programs lastObject];
    self.scrollView.contentSize = CGSizeMake(0,lastView.frame.origin.y + lastView.frame.size.height + 20 );
    
    for (recommendView *view in self.programs) {
        [view.progressView setProgress:0 animated:YES];
        view.progressView.popUpViewColor = [UIColor redColor];
         view.backgroundImage.image = [UIImage imageNamed:@"yurezhongBackground"];
    }

    
    
    
    self.segmentView.backgroundImage.image = [UIImage imageNamed:@"segmentBackground2"];
   
}



// 海外项目IBAction
- (IBAction)abroad:(UIButton *)sender {
    self.prepareBtn.selected = NO;
    self.onGoingBtn.selected = NO;
    self.abroadBtn.selected = YES;
    
    //计算第一个recommendview的y 和高
    UIView *view = self.programs[0];
    CGFloat y = view.frame.origin.y;
    CGFloat height = view.frame.size.height;
    
    //拿到总共的recommendView数量
    NSInteger countOfRecommendViews = self.programs.count;
    //把所有recommendview清除
    for (int i = 0; i < countOfRecommendViews; i ++) {
        recommendView *view = [self.programs lastObject];
        [view removeFromSuperview];
        [self.programs removeLastObject];
    }
    
    //循环创建recommendview
    for (int i = 0; i < 5; i ++) {
        recommendView *View2 = [[[NSBundle mainBundle] loadNibNamed:@"recommend" owner:self options:nil] firstObject];
#warning -这里改了
        if ([[UIScreen mainScreen] bounds].size.width > 375) {
            View2 = [[[NSBundle mainBundle] loadNibNamed:@"recommend6p" owner:self options:nil] firstObject];
        }

        
        View2.frame = CGRectMake(6.5, y + (height +20) * i , 362, 212);
        if ([[UIScreen mainScreen] bounds].size.width > 375) {
            View2.frame = CGRectMake(6.5, y + (height +20) * i , 400, 212);
        }

        View2.delegate = self;
        [self.programs addObject:View2];
        [self.scrollView addSubview:View2];
        
        
    }
    
    //重新计算scrollView的滚动范围
    recommendView *lastView = [self.programs lastObject];
    self.scrollView.contentSize = CGSizeMake(0,lastView.frame.origin.y + lastView.frame.size.height + 20 );
    
    //设置每一个recommendView
    for (recommendView *view in self.programs) {
        [view.progressView setProgress:0 animated:YES];
        view.progressView.popUpViewColor = [UIColor redColor];
        view.backgroundImage.image = [UIImage imageNamed:@"yurezhongBackground"];
    }

    
    self.segmentView.backgroundImage.image = [UIImage imageNamed:@"segmentBackground3"];
    
}

#pragma mark - 打电话按钮
- (void)phoneCall{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"拨打热线电话" message:@"您将拨打投壶网" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
    [alert show];
    

}

#pragma mark - alertview代理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSString *phoneNumber = @"0755-23765675";
        NSString *num = [[NSString alloc]initWithFormat:@"tel://%@",phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
    }
}

#pragma mark - 进度条
- (void)progress
{
    recommendView *view1 = self.programs[0];
    float progress = view1.progressView.progress;
    //设置进度条的进度  //  预热中和总众筹中都没有选中的时候；
    if (progress < 0.5 && self.prepareBtn.selected == NO && self.abroadBtn.selected == 0) {
        
        progress += 0.005;
        
        [view1.progressView setProgress:progress animated:YES];
        
        //调进度条的速度    这里在自己调用自己
        [NSTimer scheduledTimerWithTimeInterval:0.03
                                         target:self
                                       selector:@selector(progress)
                                       userInfo:nil
                                        repeats:NO];
    }
}



@end
