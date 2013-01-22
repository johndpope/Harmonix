//
//  Key.m
//  Pianoroll2
//
//  Created by Even Northug on 09.10.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "Key.h"


@implementation Key


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);    // Black stroke
    CGContextSetLineWidth(context, 1.0);
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor); // Black or white fill
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
