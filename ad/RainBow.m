//
//  RainBow.m
//  ad
//
//  Created by apple on 15/7/20.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "RainBow.h"

@implementation RainBow

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    self.layer.anchorPoint = CGPointMake(0.5, 1.6);
    return self;
}

@end
