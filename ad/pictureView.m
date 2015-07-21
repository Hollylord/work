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
    
        NSLog(@"%@",NSStringFromCGRect(self.frame));
    
    //创建scrlloview
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, 400, 152);
    self.scrollView = scrollView;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(400 * images, 152);
    scrollView.backgroundColor = [UIColor redColor];
    NSLog(@"%@",NSStringFromCGRect(scrollView.frame));
    [self addSubview:scrollView];
    
    
    //创建pagecontrol
    UIPageControl *pageControl  = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    pageControl.frame = CGRectMake(200, 130, 100, 20);
    pageControl.userInteractionEnabled = YES;
    pageControl.numberOfPages = images ;
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPage = 0;
    pageControl.backgroundColor = [UIColor greenColor];
    [self addSubview:pageControl];
    
    //创建imageView
    
    for (i = 0; i < images; i ++) {
        
        CGRect imageFrame = CGRectMake(0,0,400 * (i + 1),152);
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        
        imageView.backgroundColor = [UIColor colorWithRed:(CGFloat)(i*100/256) green:(CGFloat)i*70/255 blue:(CGFloat)i*50/255 alpha:0.5];
        
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
        self.scrollView.contentOffset = CGPointMake(400 * pageNum, 0);
    }
    
    
}



@end
