//
//  Keyboard.m
//  Pianoroll2
//
//  Created by Even Northug on 20.10.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "Keyboard.h"
#import "Constants.h"


CGPoint midpointBetweenPoints(CGPoint a, CGPoint b);


@interface Keyboard ()
- (void)handleSingleTap;
//- (void)handleDoubleTap;
- (void)handleTwoFingerTap;
@end


@implementation Keyboard

@synthesize delegate;


- (id)initWithSetup:(NSNumber *)numInitWhites fromVisibleWidth:(NSNumber *)visibleWidth
{
    self = [super init];
    if (self)
    {
        wkWidth = visibleWidth.floatValue/numInitWhites.intValue;
        wkHeight = wkWidth * 147/23;
        [self setFrame:CGRectMake(0.0, 0.0, wkWidth*52, wkHeight+TRIANGLE_HEIGHT+PADDING) ];

        bkWidth = wkWidth * 13/23;
        bkHeight = wkHeight * 95/147;
        wkBackWidth_C_E = (wkWidth*3 - bkWidth*2)/3;
        wkBackWidth_F_B = (wkWidth*4 - bkWidth*3)/4;

        [self setMultipleTouchEnabled:YES];
        twoFingerTapIsPossible = YES;
        multipleTouches = NO;
    }
    return self;
}


/*
 Changing the frame rectangle automatically redisplays the receiver without invoking the drawRect: method. If you want the drawRect: method invoked when the frame rectangle changes, set the contentMode property to UIViewContentModeRedraw.
 */
// NB: Redraws also on rotation (no need), in addition to on statusbar change etc.

- (void)drawRect:(CGRect)rect
{
    // Draw white keys ...
    float xPosWhite;
    float negOffsetBlack;
    float width, height;
    int keyType;    // 0=white, 1=black
    UIColor *color;

    for (int keyGroup=0; keyGroup<2; keyGroup++) {  // for white keys first, then blacks
        xPosWhite = 0.0;
        for (int keyMIDI = 21; keyMIDI < 109; keyMIDI++) {
            int cSemiNoteOffset = (keyMIDI % 12);
            keyType = 1;
            switch (cSemiNoteOffset) {
                case 0:
                case 2:
                case 4:
                case 5:
                case 7:
                case 9:
                case 11:
                    keyType=0;
                    negOffsetBlack = 0.0;
                    break;
                case 1:     // C# or Db
                    negOffsetBlack = (1*wkWidth - 1*wkBackWidth_C_E - 0*bkWidth);
                    break;
                case 3:
                    negOffsetBlack = (2*wkWidth - 2*wkBackWidth_C_E - 1*bkWidth);
                    break;
                case 6:
                    negOffsetBlack = (1*wkWidth - 1*wkBackWidth_F_B - 0*bkWidth);
                    break;
                case 8:
                    negOffsetBlack = (2*wkWidth - 2*wkBackWidth_F_B - 1*bkWidth);
                    break;
                case 10:
                    negOffsetBlack = (3*wkWidth - 3*wkBackWidth_F_B - 2*bkWidth);
                    break;
            }
            if (keyType==0) {
                width = wkWidth;
                height = wkHeight;
                color = [UIColor whiteColor];
            } else {
                width = bkWidth;
                height = bkHeight;
                color = [UIColor blackColor];
            }
            if (keyType == keyGroup) {      // Create ALL white keys before blacks
                Key *anyKey = [[Key alloc]initWithFrame:CGRectMake((xPosWhite - negOffsetBlack), 0.0, width, height)];
                anyKey.backgroundColor = color;
                anyKey.tag = keyMIDI;

                [anyKey addTarget:self action:@selector(keyPressed:) forControlEvents:(UIControlEventTouchDown)];
                 /*
                 [anyKey addTarget:self action:@selector(keyReleased:) forControlEvents:(UIControlEventTouchUpInside)];
                 [anyKey addTarget:self action:@selector(keyReleased:) forControlEvents:(UIControlEventTouchUpOutside)];
                 */
                
                [self addSubview:anyKey];
                
                KeyLowerLabel *keyLowerLabel = [[KeyLowerLabel alloc] initWithFrame:
                                       CGRectMake(xPosWhite - negOffsetBlack +keyType*bkWidth/2 - keyType*wkWidth/2,
                                                  height*0.7, wkWidth, wkWidth*0.7)];
                
                keyLowerLabel.tag = keyMIDI + LABEL_TAG_OFFSET;
                NSString *title = [NSString stringWithFormat:@"%d", keyMIDI];
                [keyLowerLabel setTitle:title forState:UIControlStateNormal];
                
                [self addSubview:keyLowerLabel];
            }
            if (keyType==0)
                xPosWhite+=wkWidth;
        }
    }
    
    // Draw triangle at c4
    float peakX = wkWidth * 23;
    float X = peakX - TRIANGLE_HEIGHT*3/4;
    float W = TRIANGLE_HEIGHT*6/4;
    CGRect frame = CGRectMake(X, wkHeight, W, TRIANGLE_HEIGHT);
    KeyboardTriangle *keyboardTriangle = [[KeyboardTriangle alloc]initWithFrame:frame];
    keyboardTriangle.backgroundColor = self.backgroundColor;
    [self addSubview:keyboardTriangle];
}


// toggles pianokey ellipsis and calls to update table row
- (void)keyPressed:(id)sender {
	UInt32 keyNo = [sender tag];
	UIView *labelView = [self viewWithTag:keyNo+LABEL_TAG_OFFSET];
    if (labelView.hidden == YES) {
		labelView.hidden = NO;
	} else {
		labelView.hidden = YES;
	}
	//call delegate to populate note array
	if(self.delegate != nil)
		[self.delegate updateDataAndTableRow];
}


- (void) clearKeyboard
{
    //keyboard ....... pianorollVC
    for (int keyMIDI = 21; keyMIDI < 109; keyMIDI++) {
        UIView *labelView = [self viewWithTag:keyMIDI+LABEL_TAG_OFFSET];
        if (labelView.hidden == NO) // if ellipsis visible, then hide
            labelView.hidden = YES;
    }
}



#pragma -
#pragma - 3 of 4 UIResponder "Multiple touches" methods, inherited by UIView
// overriding touchesBegan without calling [super ...] requires ALL protocol methods to be declared, evt as empty stubs
// move to PianorollVC ?? as it gets touch messages BEFORE its view does



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Cancel any pending handleSingleTap messages.
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(handleSingleTap)
                                               object:nil];
    
    // Update the touch state.
    if ([[event touchesForView:self] count] > 1)
        multipleTouches = YES;
    if ([[event touchesForView:self] count] > 2)
        twoFingerTapIsPossible = NO;
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    BOOL allTouchesEnded = ([touches count] == [[event touchesForView:self] count]);
    
    // first check for plain single/double tap, which is only possible if we haven't seen multiple touches
    if (!multipleTouches) {
        UITouch *touch = [touches anyObject];
        tapLocation = [touch locationInView:self];
        
        if ([touch tapCount] == 1) {
            [self performSelector:@selector(handleSingleTap)
                       withObject:nil
                       afterDelay:DOUBLE_TAP_DELAY];
        } else if([touch tapCount] == 2) {
            //            [self handleDoubleTap];
        }
    }
    
    // Check for a 2-finger tap if there have been multiple touches
    // and haven't that situation has not been ruled out
    else if (multipleTouches && twoFingerTapIsPossible) {
        
        // case 1: this is the end of both touches at once
        if ([touches count] == 2 && allTouchesEnded) {
            int i = 0;
            int tapCounts[2];
            CGPoint tapLocations[2];
            for (UITouch *touch in touches) {
                tapCounts[i] = [touch tapCount];
                tapLocations[i] = [touch locationInView:self];
                i++;
            }
            if (tapCounts[0] == 1 && tapCounts[1] == 1) {
                // it's a two-finger tap if they're both single taps
                tapLocation = midpointBetweenPoints(tapLocations[0],
                                                    tapLocations[1]);
                [self handleTwoFingerTap];
            }
        }
        
        // Case 2: this is the end of one touch, and the other hasn't ended yet
        else if ([touches count] == 1 && !allTouchesEnded) {
            UITouch *touch = [touches anyObject];
            if ([touch tapCount] == 1) {
                // If touch is a single tap, store its location
                // so it can be averaged with the second touch location
                tapLocation = [touch locationInView:self];
            } else {
                twoFingerTapIsPossible = NO;
            }
        }
        
        // Case 3: this is the end of the second of the two touches
        else if ([touches count] == 1 && allTouchesEnded) {
            UITouch *touch = [touches anyObject];
            if ([touch tapCount] == 1) {
                // if the last touch up is a single tap, this was a 2-finger tap
                tapLocation = midpointBetweenPoints(tapLocation,
                                                    [touch locationInView:self]);
                [self handleTwoFingerTap];
            }
        }
    }
    
    // if all touches are up, reset touch monitoring state
    if (allTouchesEnded) {
        twoFingerTapIsPossible = YES;
        multipleTouches = NO;
    }
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    twoFingerTapIsPossible = YES;
    multipleTouches = NO;
}


#pragma mark Private

- (void)handleSingleTap {   // never called !!!
    if ([delegate respondsToSelector:@selector(Keyboard:gotSingleTapAtPoint:)]) {
        [delegate Keyboard:self gotSingleTapAtPoint:tapLocation];
        NSLog(@"Handles DELAYED singletap.");
    }
}

/*
 - (void)handleDoubleTap {
 if ([delegate respondsToSelector:@selector(Keyboard:gotDoubleTapAtPoint:)])
 [delegate Keyboard:self gotDoubleTapAtPoint:tapLocation];
 }
 */

- (void)handleTwoFingerTap {
    if ([delegate respondsToSelector:@selector(Keyboard:gotTwoFingerTapAtPoint:)])
        [delegate Keyboard:self gotTwoFingerTapAtPoint:tapLocation];
    
    // INSERT ACTION HERE !!!!!!!!!!!!!!!
}


CGPoint midpointBetweenPoints(CGPoint a, CGPoint b) {
    CGFloat x = (a.x + b.x) / 2.0;
    CGFloat y = (a.y + b.y) / 2.0;
    return CGPointMake(x, y);
}

@end
