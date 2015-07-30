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


@interface programViewController () <INSSearchBarDelegate,recommendViewDelegate>
@property (strong, nonatomic) IBOutlet segmentView *segmentView;



@property (nonatomic, strong) INSSearchBar *searchBarWithDelegate;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *onGoingBtn;
@property (weak, nonatomic) IBOutlet UIButton *prepareBtn;

//用来存放recommendViews
@property (strong,nonatomic) NSMutableArray *programs;





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
    self.programs  = [NSMutableArray arrayWithObject:recommendView];
    
    recommendView.frame = CGRectMake(6.5, segmentView.frame.origin.y + segmentView.frame.size.height, 362, 212);
    [self.scrollView addSubview:recommendView];
    //负责传递点击recommendView事件
    recommendView.delegate = self;
    
    [self progress];
 
    
    
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    tabViewController *myTabBarController = (tabViewController *)self.tabBarController;
    [myTabBarController.customTabBar setHidden:NO];
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


#pragma mark - 点击项目
- (void)tapProgram {
    
        [self performSegueWithIdentifier:@"program2zhongchouzhong" sender:nil];
   
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    programViewController *source = segue.sourceViewController;
    zhongchouzhongViewController *destination = segue.destinationViewController;
    if (source.prepareBtn.selected == YES) {
        destination.isOnGoing = NO;
        
    }
    else {
        destination.isOnGoing = YES;
    }
}

#pragma mark - 点击进行中/预热中
- (IBAction)onGoingBtn:(id)sender {
    
    self.onGoingBtn.selected = YES;
    self.prepareBtn.selected = NO;
    for (recommendView *view in self.programs) {
        view.progressView.popUpViewColor = [UIColor grayColor];
            view.backgroundImage.image = [UIImage imageNamed:@"recommendBackground"];
    }

    [self progress];
    self.segmentView.backgroundImage.image = [UIImage imageNamed:@"segmentBackground1"];
    
    recommendView *view = self.programs[1];
    [view removeFromSuperview];
    [self.programs removeObjectAtIndex:1];
    

}

- (IBAction)prepareBtn:(id)sender {
    
    self.prepareBtn.selected = YES;
    self.onGoingBtn.selected = NO;


    recommendView *View2 = [[[NSBundle mainBundle] loadNibNamed:@"recommend" owner:self options:nil] firstObject];
    UIView *view = self.programs[0];
    CGFloat y = view.frame.origin.y;
    CGFloat height = view.frame.size.height;
    View2.frame = CGRectMake(6.5, y + height +20 , 362, 212);
    [self.programs addObject:View2];
    [self.scrollView addSubview:View2];
    
    for (recommendView *view in self.programs) {
        [view.progressView setProgress:0 animated:YES];
        view.progressView.popUpViewColor = [UIColor redColor];
         view.backgroundImage.image = [UIImage imageNamed:@"yurezhongBackground"];
    }

    
    
    
    self.segmentView.backgroundImage.image = [UIImage imageNamed:@"segmentBackground2"];
   
}

#pragma mark - 进度条
- (void)progress
{
    recommendView *view1 = self.programs[0];
    float progress = view1.progressView.progress;
    if (progress < 1.0 && self.prepareBtn.selected == NO) {
        
        progress += 0.005;
        
        [view1.progressView setProgress:progress animated:YES];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1
                                         target:self
                                       selector:@selector(progress)
                                       userInfo:nil
                                        repeats:NO];
    }
}


@end
