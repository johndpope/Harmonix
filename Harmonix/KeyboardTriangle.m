//
//  KeyboardTriangle.m
//  Pianoroll2
//
//  Created by Even Northug on 12.10.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "KeyboardTriangle.h"

@implementation KeyboardTriangle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, rect.size.width/2, 0);
    CGPathAddLineToPoint(path, NULL,rect.size.width, rect.size.height);
    CGPathAddLineToPoint(path, NULL,0,rect.size.height);
    //CGPathAddLineToPoint(path, NULL,rect.size.width/2, 0);
    CGPathCloseSubpath(path);

    CGContextAddPath(context, path);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextFillPath(context);
    
}


@end
