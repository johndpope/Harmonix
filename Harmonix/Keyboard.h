//
//  Keyboard.h
//  Pianoroll2
//
//  Created by Even Northug on 20.10.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Key.h"
#import "KeyLowerLabel.h"
#import "KeyboardTriangle.h"



@protocol KeyboardDelegate;

@interface Keyboard : UIView
{
    float wkWidth, wkHeight, wkBackWidth_C_E, wkBackWidth_F_B, bkWidth, bkHeight;
    // Touch detection data
    CGPoint tapLocation;         // Needed to record location of single tap, which will only be registered after delayed perform.
    BOOL multipleTouches;        // YES if a touch event contains more than one touch; reset when all fingers are lifted.
    BOOL twoFingerTapIsPossible; // Set to NO when 2-finger tap can be ruled out (e.g. 3rd finger down, fingers touch down too far apart, etc).
    id <KeyboardDelegate> delegate; // for calling protocol methods in delegate, where methods are implemented
}
// enable keyboard.delegate call to <KeyboardDelegate> methods implemented in mainVC.m
@property (nonatomic, strong) id <KeyboardDelegate> delegate;
@property (nonatomic, strong) NSNumber *triangleVisible;    // ref [NSNumber numberWithBool:YES]

- (id)initWithSetup:(NSNumber *)numInitWhites fromVisibleWidth:(NSNumber *)visibleWidth;
- (void)clearKeyboard;

@end


@protocol KeyboardDelegate <NSObject>   // implements 3 NSObject protocol methods ??
// @protocol UITouchEventDelegate........ to implement 3 tap methods,, allowing them to be called

@optional
- (void)Keyboard:(Keyboard *)view gotSingleTapAtPoint:(CGPoint)tapPoint;
- (void)Keyboard:(Keyboard *)view gotDoubleTapAtPoint:(CGPoint)tapPoint;
- (void)Keyboard:(Keyboard *)view gotTwoFingerTapAtPoint:(CGPoint)tapPoint;

- (void)updateDataAndTableRow;
//- (void)Keyboard:(Keyboard *)view updateDataAndTableRow;
@end
