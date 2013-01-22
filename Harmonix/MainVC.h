//
//  MainVC.h
//  Harmonix
//
//  Created by Even Northug on 28.11.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "ChordListTV.h"
#import "CellContens.h"
#import "Keyboard.h"
#import "Songo.h"

@interface MainVC : UIViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, KeyboardDelegate>
{
    Songo *songo;
    //IBOutlet UIView *chordlistHeader;
    CellContens *chordListHeader;       // ignore storyboard header view
    IBOutlet ChordListTV *chordListTV;
    IBOutlet UIView *keyboardButtonView;
    IBOutlet UIButton *btnClear;
    IBOutlet UIScrollView *zoomView;
    Keyboard *keyboard;
}

@property (nonatomic, strong) Songo *songo;
//@property (nonatomic, strong) IBOutlet UIView *chordlistHeader;
@property (nonatomic, strong) CellContens *chordlistHeader;
@property (nonatomic, strong) IBOutlet ChordListTV *chordListTV;
@property (nonatomic, strong) IBOutlet UIView *keyboardButtonView;   // each button controlled by mainVC ?
@property (nonatomic, strong) IBOutlet UIButton *btnClear;
@property (nonatomic, strong) IBOutlet UIScrollView *zoomView;
@property (nonatomic, strong) Keyboard *keyboard;

- (IBAction) BtnClear;

@end
