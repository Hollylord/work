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


@interface programViewController () <INSSearchBarDelegate,ASProgressPopUpViewDataSource>
@property (strong, nonatomic) IBOutlet segmentView *segmentView;
@property (strong, nonatomic) IBOutlet recommendView *recommendView;
@property (weak, nonatomic) IBOutlet ASProgressPopUpView *progressView;

@property (nonatomic, strong) INSSearchBar *searchBarWithDelegate;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *onGoingBtn;
@property (weak, nonatomic) IBOutlet UIButton *prepareBtn;







- (IBAction)onGoingBtn:(id)sender;
- (IBAction)prepareBtn:(id)sender;

@end

@implementation programViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
    //这种方式设置imageview 默认大小和图片一样
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dabeijing"]];
    
    [self.view insertSubview:background belowSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 800);
    
    
    //配置搜索框
    self.searchBarWithDelegate = [[INSSearchBar alloc] initWithFrame:CGRectMake(10, 20, 44, 34)];
    self.searchBarWithDelegate.delegate = self;
    [self.view addSubview:self.searchBarWithDelegate];
   
    //配置segementView
    segmentView *segmentView = [[[NSBundle mainBundle] loadNibNamed:@"segmentView" owner:self options:nil] firstObject];
    self.segmentView = segmentView;
    //*** frame 是按照父view为参照来算的，所以是152，如果是按照self.view来算就是216了
    segmentView.frame = CGRectMake(0, 152, self.view.frame.size.width, 42);
    [self.scrollView addSubview:segmentView];
    self.onGoingBtn.selected = YES;
    
    //配置recommendView
    recommendView *recommendView = [[[NSBundle mainBundle] loadNibNamed:@"recommend" owner:self options:nil] firstObject];
    self.recommendView = recommendView;
    recommendView.frame = CGRectMake(6.5, segmentView.frame.origin.y + segmentView.frame.size.height, 362, 212);
    [self.scrollView addSubview:recommendView];
    
    //配置progressView 进度条
    self.progressView.popUpViewCornerRadius = 8.0;
    self.progressView.popUpViewColor = [UIColor grayColor];
    self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:20];
    [self.progressView showPopUpViewAnimated:YES];
    self.progressView.progress = 0.0;
    self.progressView.dataSource = self;
    [self progress];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 搜索框代理


- (CGRect)destinationFrameForSearchBar:(INSSearchBar *)searchBar
{
    return CGRectMake(10, 20, CGRectGetWidth(self.view.bounds) - 40.0, 34.0);
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

#pragma mark - 进度条
- (void)progress
{
    float progress = self.progressView.progress;
    if (self.progressView.progress < 1.0 && self.onGoingBtn.selected) {
        
        progress += 0.005;
        
        [self.progressView setProgress:progress animated:YES];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1
                                         target:self
                                       selector:@selector(progress)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (BOOL)progressViewShouldPreCalculatePopUpViewSize:(ASProgressPopUpView *)progressView;
{
    return NO;
}

- (NSString *)progressView:(ASProgressPopUpView *)progressView stringForProgress:(float)progress{
    if (self.prepareBtn.selected) {
        return @"未开始";
    }
    else {
        return nil;
    }
}


- (IBAction)tapProgram:(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"program2zhongchouzhong" sender:nil];
}

#pragma mark - 进行中/预热中
- (IBAction)onGoingBtn:(id)sender {
    
    self.onGoingBtn.selected = YES;
    self.prepareBtn.selected = NO;
    self.progressView.popUpViewColor = [UIColor grayColor];
    [self progress];
    self.segmentView.backgroundImage.image = [UIImage imageNamed:@"segmentBackground1"];
    self.recommendView.backgroundImage.image = [UIImage imageNamed:@"recommendBackground"];
}

- (IBAction)prepareBtn:(id)sender {
    
    self.prepareBtn.selected = YES;
    self.onGoingBtn.selected = NO;
    [self.progressView setProgress:0.0 animated:YES];
    self.progressView.popUpViewColor = [UIColor redColor];
    self.segmentView.backgroundImage.image = [UIImage imageNamed:@"segmentBackground2"];
    self.recommendView.backgroundImage.image = [UIImage imageNamed:@"yurezhongBackground"];
}



@end
