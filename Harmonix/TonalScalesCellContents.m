//
//  TonalScalesCellContents.m
//  Harmonix
//
//  Created by Even Northug on 07.12.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "TonalScalesCellContents.h"

@implementation TonalScalesCellContents

@synthesize lblNum;
@synthesize lblName;
@synthesize lblShortName;
@synthesize lblGender;
@synthesize lblDegreeFamily;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float accumX = 0;

    /*
        lblNum = [[UILabel alloc]initWithFrame:
                  CGRectMake(frame.origin.x, frame.origin.y, frame.size.width*0.05, frame.size.height)];
        [lblNum setFont:[UIFont fontWithName:@"FontName" size:12.0]];
        //[lblNum setBackgroundColor:[UIColor lightGrayColor]];
        lblNum.highlightedTextColor = [UIColor whiteColor];
        [lblNum setFont:[UIFont boldSystemFontOfSize:20]];
        [lblNum setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:lblNum];
        accumX += lblNum.frame.size.width;
*/
        lblName = [[UILabel alloc]initWithFrame:
                        CGRectMake(accumX, frame.origin.y, frame.size.width*0.30, frame.size.height)];
        [lblName setFont:[UIFont fontWithName:@"FontName" size:12.0]];
        //[lblName setBackgroundColor:[UIColor lightGrayColor]];
        lblName.highlightedTextColor = [UIColor whiteColor];
        [lblName setFont:[UIFont boldSystemFontOfSize:20]];
        [lblName setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:lblName];
        accumX += lblName.frame.size.width;
/*
        lblShortName = [[UILabel alloc]initWithFrame:
                   CGRectMake(accumX, frame.origin.y, frame.size.width*0.06, frame.size.height)];
        [lblShortName setFont:[UIFont fontWithName:@"FontName" size:12.0]];
        //[lblShortName setBackgroundColor:[UIColor lightGrayColor]];
        lblShortName.highlightedTextColor = [UIColor whiteColor];
        [lblShortName setFont:[UIFont boldSystemFontOfSize:20]];
        [lblShortName setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:lblShortName];
        accumX += lblShortName.frame.size.width;
        
        lblGender = [[UILabel alloc]initWithFrame:
                   CGRectMake(accumX, frame.origin.y, frame.size.width*0.04, frame.size.height)];
        [lblGender setFont:[UIFont fontWithName:@"FontName" size:12.0]];
        //[lblGender setBackgroundColor:[UIColor lightGrayColor]];
        lblGender.highlightedTextColor = [UIColor whiteColor];
        [lblGender setFont:[UIFont boldSystemFontOfSize:20]];
        [lblGender setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:lblGender];
        accumX += lblGender.frame.size.width;
  */
        UILabel *lbl;
        lblDegreeFamily = [NSMutableArray arrayWithCapacity:7];
        float colWidth = ((frame.size.width - accumX) / 7);
        for (int col=0; col<7; col++) {
            lbl = [[UILabel alloc]initWithFrame:
                        CGRectMake(accumX, frame.origin.y, colWidth, frame.size.height)];
            [lbl setFont:[UIFont fontWithName:@"FontName" size:12.0]];
            [lbl setBackgroundColor:[UIColor whiteColor]];
            lbl.highlightedTextColor = [UIColor whiteColor];
            [lbl setFont:[UIFont boldSystemFontOfSize:20]];
            [lbl setTextAlignment:NSTextAlignmentLeft];
            [lblDegreeFamily addObject:lbl];
            [self addSubview:lbl];
            accumX += lbl.frame.size.width;

        }
    }
    return self;
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
