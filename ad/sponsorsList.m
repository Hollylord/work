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
//        UINib *sponsorsCell = [UINib nibWithNibName:@"sponsorCell" bundle:nil];
//        
//        [self.tableView registerNib:sponsorsCell forCellReuseIdentifier:@"sponsors"];
        
    }
    return self;
}

//用这个方法让storybord 调用xib
- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder{
    BOOL theThingThatGotLoadedWasJustAPlaceholder = ([[self subviews] count] == 0);
    if (theThingThatGotLoadedWasJustAPlaceholder) {
        UIView* theRealThing = [[[NSBundle mainBundle] loadNibNamed:@"sponsorsList" owner:self options:nil] firstObject];
        
        // pass properties through
        //        [self copyUIPropertiesTo:theRealThing];
        
        //auto layout
        //        self.translatesAutoresizingMaskIntoConstraints = NO;
        theRealThing.translatesAutoresizingMaskIntoConstraints = NO;
        
        return theRealThing;
    }
    return self;
}



@end
