//
//  SongSetup.m
//  Harmonix
//
//  Created by Even Northug on 04.12.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "SongSetup.h"
#import "Constants.h"       // for NUMCHORDROWS

@implementation SongSetup

@synthesize timeSignatureNominator;
@synthesize numBeatsInSong;

- (id) init
{
    self = [super init];
    if (self) {
        self.timeSignatureNominator = [NSNumber numberWithInt:4];
        self.numBeatsInSong =[NSNumber numberWithInt:NUMCHORDROWS];
    }
    return self;
}

@end
