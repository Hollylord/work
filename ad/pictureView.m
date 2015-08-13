//
//  pictureView.m
//  test
//
//  Created by apple on 15/7/15.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "pictureView.h"

#define images 5

@interface pictureView ()
{
    int i;
    
}
@property (nonatomic,weak) UIPageControl *pageControl;
@end

@implementation pictureView

- (id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
//    self.backgroundColor = [UIColor blackColor];
    
    
    //创建scrlloview
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    
    if ([[UIScreen mainScreen] bounds].size.width <= 375) {
        scrollView.frame = CGRectMake(0, 0, 375, 152);
    }else{
        scrollView.frame = CGRectMake(0, 0, 414, 168);
    }
    self.scrollView = scrollView;
    scrollView.pagingEnabled = YES;
    
    
    if ([[UIScreen mainScreen] bounds].size.width <= 375) {
        scrollView.contentSize = CGSizeMake(375 * images, 152);
    }else{
        scrollView.contentSize = CGSizeMake(414 * images, 168);
    }


    scrollView.backgroundColor = [UIColor redColor];

    [self addSubview:scrollView];
    
    
    //创建pagecontrol
    UIPageControl *pageControl  = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
        
        pageControl.frame = CGRectMake(414-110, 130, 100, 20);
 
    }else{
        pageControl.frame = CGRectMake(375-110, 130, 100, 20);

    }

    pageControl.userInteractionEnabled = YES;
    pageControl.numberOfPages = images ;
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:5 green:140 blue:108 alpha:1];
    pageControl.currentPage = 0;
    
    [self addSubview:pageControl];
    
    //创建imageView
    
    for (i = 0; i < images; i ++) {
        
        CGRect imageFrame ;
        if ([[UIScreen mainScreen] bounds].size.width <= 375) {
              imageFrame = CGRectMake(375 * i,0,375,152);
            
        }else{
            imageFrame = CGRectMake(414 * i,0,414,168);

        }

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        NSString *imageName;
        
        if ([[UIScreen mainScreen] bounds].size.width <= 375) {
            imageName = [NSString stringWithFormat:@"picture%d",i + 1];
        }else{
            imageName = [NSString stringWithFormat:@"picture6p%d",i + 1];
            
        }
        imageView.image = [UIImage imageNamed:imageName];
        
        [self.scrollView addSubview:imageView];
        
    }
    //设定定时器，自动滚动
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(pictureViewScroll) userInfo:nil repeats:YES];
    
    
    return self;
    
}

- (void)pictureViewScroll{
    NSInteger pageNum = self.pageControl.currentPage ;
    
    if (pageNum == 4) {
        self.pageControl.currentPage = 0;
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
    else
    {
        self.pageControl.currentPage = pageNum + 1;
        
        
        if ([[UIScreen mainScreen] bounds].size.width <= 375) {
            self.scrollView.contentOffset = CGPointMake(375 * (pageNum + 1), 0);
            
        }else{
            self.scrollView.contentOffset = CGPointMake(414 * (pageNum + 1), 0);

        }
    }
    
    
}



@end
