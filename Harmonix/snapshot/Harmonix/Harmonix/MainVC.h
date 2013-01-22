//
//  MainVC.h
//  Harmonix
//
//  Created by Even Northug on 28.11.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController
{
    UITableViewCell *tableViewHeader;
    UITableView *chordListTV;
    UIToolbar *keyboardButtonView;
    UIScrollView *zoomView;
    UIView *keyboard;
}

@property (nonatomic, strong) IBOutlet UITableViewCell *tableViewHeader;
@property (nonatomic, strong) IBOutlet UITableView *chordListTV;
@property (nonatomic, strong) IBOutlet UIToolbar *keyboardButtonView;   // each button controlled by mainVC ?
@property (nonatomic, strong) IBOutlet UIScrollView *zoomView;
@property (nonatomic, strong) IBOutlet UIView *keyboard;

- (IBAction) pushHarmonicsView;

@end
