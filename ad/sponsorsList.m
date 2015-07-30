//
//  sponsorsList.m
//  ad
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "sponsorsList.h"
#import "zhongchouzhongViewController.h"


@implementation sponsorsList

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
       UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"sponsorsList" owner:self options:nil] firstObject];
        [self addSubview:view];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        [self addConstraint:leading];
        [self addConstraint:trailing];
        [self addConstraint:top];
        [self addConstraint:bottom];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
            UINib *sponsorsCell = [UINib nibWithNibName:@"sponsorCell" bundle:nil];
            [self.tableView registerNib:sponsorsCell forCellReuseIdentifier:@"sponsors"];
    }
    return self;
}
#pragma mark - tableview 代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sponsors"];
    
    return cell;
}




@end
