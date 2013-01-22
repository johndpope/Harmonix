//
//  KeyLowerLabel.m
//  ChordEditor
//
//  Created by Erik Lillegraven on 16.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KeyLowerLabel.h"


@implementation KeyLowerLabel

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.hidden = YES; // set initially not visible
        [self setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        float labelHeight = self.frame.size.height;
        self.titleLabel.font = [UIFont systemFontOfSize:(labelHeight*0.8)];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
	CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextSetLineWidth(context, 1.0);
	CGContextAddEllipseInRect(context, rect); 
	CGContextDrawPath(context, kCGPathFillStroke);
    
}


@end
