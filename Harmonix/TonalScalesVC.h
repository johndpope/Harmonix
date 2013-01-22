//
//  TonalScalesVC.h
//  Harmonix
//
//  Created by Even Northug on 08.12.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TonalScalesCellContents.h"
#import "AppDelegate.h"
#import "Scale.h"

@interface TonalScalesVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    TonalScalesCellContents *tonalScalesHeader;       // ignore storyboard header view
    IBOutlet UITableView *tonalScalesTV;
}
@property(strong,nonatomic) TonalScalesCellContents *tonalScalesHeader;
@property(strong,nonatomic) IBOutlet UITableView *tonalScalesTV;

@property(strong, nonatomic) IBOutlet UISegmentedControl *majorMinorSelector;
@property(strong, nonatomic) IBOutlet UIBarButtonItem *btnReset;
@property(strong, nonatomic) NSArray *colHeaders;
@property(strong, nonatomic) NSManagedObjectContext *context;
@property(strong, nonatomic) NSArray *tonalScale;
@property(strong, nonatomic) NSArray *degreesArray;
//@property(strong, nonatomic) NSArray *chordScaleDegree;
//@property(strong, nonatomic) NSArray *chordFamily;


- (IBAction)btnResetPushed:(id)sender;
- (IBAction)minorMajorSelectorValueChanged:(id)sender;
- (void) selectGenderScales;
- (void) selectScaleDegrees: (Scale*) scl;

@end
