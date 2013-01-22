//
//  CellContens.m
//  Harmonix
//
//  Created by Even Northug on 04.12.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "CellContens.h"


@implementation CellContens

@synthesize lblBar;
@synthesize lblMidiNotes;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        lblBar = [[UILabel alloc]initWithFrame:
                  CGRectMake(frame.origin.x, frame.origin.y, frame.size.width/20, frame.size.height)];
        [lblBar setFont:[UIFont fontWithName:@"FontName" size:12.0]];
        //[lblBar setBackgroundColor:[UIColor lightGrayColor]];
        lblBar.highlightedTextColor = [UIColor whiteColor];
        [lblBar setFont:[UIFont boldSystemFontOfSize:20]];
        [lblBar setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:lblBar];

        lblMidiNotes = [[UILabel alloc]initWithFrame:
                  CGRectMake(lblBar.frame.size.width, frame.origin.y, frame.size.width/2, frame.size.height)];
        [lblMidiNotes setFont:[UIFont fontWithName:@"FontName" size:12.0]];
        //[lblMidiNotes setBackgroundColor:[UIColor lightGrayColor]];
        lblMidiNotes.highlightedTextColor = [UIColor whiteColor];
        [lblMidiNotes setFont:[UIFont boldSystemFontOfSize:20]];
        [lblMidiNotes setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:lblMidiNotes];
    }
    return self;
}

- (void) setWithChordRowContent:(NSArray *)chords
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
