//
//  MainVC.m
//  Harmonix
//
//  Created by Even Northug on 28.11.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end


@implementation MainVC

@synthesize tableViewHeader;
@synthesize chordListTV;
@synthesize keyboardButtonView;
@synthesize zoomView;
@synthesize keyboard;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pushHarmonicsView
{
   //[self.presentingViewController pushViewController:self animated:NO];
}

@end
