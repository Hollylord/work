//
//  programViewController.m
//  ad
//
//  Created by apple on 15/7/21.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "programViewController.h"
#import "INSSearchBar.h"


@interface programViewController () <INSSearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) INSSearchBar *searchBarWithDelegate;
@end

@implementation programViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 800);
    
    
    //配置搜索框
    self.searchBarWithDelegate = [[INSSearchBar alloc] initWithFrame:CGRectMake(10, 20, 44, 34)];
    self.searchBarWithDelegate.delegate = self;
    [self.view addSubview:self.searchBarWithDelegate];
   
    //配置segementView
    UIView *segmentView = [[[NSBundle mainBundle] loadNibNamed:@"segmentView" owner:self options:nil] firstObject];
    //*** frame 是按照父view为参照来算的，所以是152，如果是按照self.view来算就是216了
    segmentView.frame = CGRectMake(0, 152, self.view.frame.size.width, 42);
    [self.scrollView addSubview:segmentView];
    
    //配置recommendView
    UIView *recommendView = [[[NSBundle mainBundle] loadNibNamed:@"recommend" owner:self options:nil] firstObject];
    recommendView.frame = CGRectMake(6.5, segmentView.frame.origin.y + segmentView.frame.size.height, 362, 212);
    [self.scrollView addSubview:recommendView];
    
    
    
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

@end
