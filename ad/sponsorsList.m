//
//  sponsorsList.m
//  ad
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 touwho. All rights reserved.
//

#import "sponsorsList.h"

@implementation sponsorsList

//用这个方法让storybord 调用xib
- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder{
    BOOL theThingThatGotLoadedWasJustAPlaceholder = ([[self subviews] count] == 0);
    if (theThingThatGotLoadedWasJustAPlaceholder) {
        UIView* theRealThing = [[[NSBundle mainBundle] loadNibNamed:@"sponsorsList" owner:nil options:nil] firstObject];
        
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
