//
//  advertViewController.m
//  ad
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "advertViewController.h"

#import "tabViewController.h"

@interface advertViewController () <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,weak) UIButton *advertButton;
@end

@implementation advertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect imageFrame = self.view.frame;
    
    //创建1个scrollview
    self.scrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(imageFrame.origin.x, imageFrame.origin.y, imageFrame.size.width, imageFrame.size.height)];
    self.scrollView.contentSize = CGSizeMake(imageFrame.size.width * 3, imageFrame.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    //    self.scrollView.showsHorizontalScrollIndicator = NO;
    //    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    

    
    //创建3个imageview
    int i;
    for (i = 0; i < 3; i ++) {
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(imageFrame.origin.x + i * imageFrame.size.width, imageFrame.origin.y, imageFrame.size.width, imageFrame.size.height);
        NSString *imageName = [NSString stringWithFormat:@"advert%d",i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        imageView.image = image;
        [self.scrollView addSubview:imageView];
        
        if (i == 2) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            UIImage *buttonImage = [UIImage imageNamed:@"advertButton"];
//            [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
            [button setImage:buttonImage forState:UIControlStateNormal];

            button.frame = CGRectMake(imageView.frame.origin.x + 50, imageFrame.size.height - 150, 200, 100);
            self.advertButton = button;
            [button addTarget:self action:@selector(turnToHomeViewController) forControlEvents:UIControlEventTouchUpInside];
            //一定要把按钮添加到scrollview上面
            [self.scrollView addSubview:self.advertButton];
            
        }
        
    }
    
 
    
    //创建pagecontrol
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(100, imageFrame.size.height - 50, 100, 30);
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = 3;
    self.pageControl.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.pageControl];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint contentOffset = scrollView.contentOffset;
    int i = contentOffset.x / self.view.frame.size.width;
    
    self.pageControl.currentPage = i;
    
}

#pragma mark - 点击按钮
- (void)turnToHomeViewController{
//   UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"main" bundle:nil];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"tabbar"];
//    UIViewController *firstViewController = [[UIViewController alloc]initWithNibName:@"firstViewController" bundle:nil];
    [self presentViewController:viewController animated:YES completion:NULL];
    
}


@end
