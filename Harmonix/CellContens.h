//
//  CellContens.h
//  Harmonix
//
//  Created by Even Northug on 04.12.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellContens : UIView
{
    UILabel *lblBar;
    UILabel *lblMidiNotes;
}
@property (nonatomic, strong) UILabel *lblBar;
@property (nonatomic, strong) UILabel *lblMidiNotes;

- (void) setWithChordRowContent:(NSArray *)chords;

@end
