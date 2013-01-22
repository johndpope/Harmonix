//
//  Songo.m
//
//  Created by Even Northug on 16.11.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "Songo.h"
#import "Constants.h"


@implementation Songo

@synthesize songSetup;
@synthesize barAtBeat;
@synthesize beatInBar;
@synthesize midiNotes;


- (id) init
{
    self = [super init];
    if (self) {
        self.songSetup = [[SongSetup alloc]init];
        
        midiNotes = [NSMutableArray arrayWithCapacity:NUMCHORDROWS];    // not affecting count, still being 0
        barAtBeat = [NSMutableArray arrayWithCapacity:NUMCHORDROWS];
        beatInBar = [NSMutableArray arrayWithCapacity:NUMCHORDROWS];
        for (int i=0; i<NUMCHORDROWS; i++ )        // fill arrays to allow replaceObjectAtIndex: array modification
            [midiNotes addObject:[NSMutableArray array]];
        [self setBarAndBeat];
        //[midiNotes replaceObjectAtIndex:0 withObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:60], nil]];
    }
    return self;
}


- (void) setBarAndBeat
{
    for (int i=0; i<NUMCHORDROWS; i++ ) {       // fill arrays to allow replaceObjectAtIndex: array modification
        [barAtBeat addObject:[NSNumber numberWithInt:(i/songSetup.timeSignatureNominator.intValue + 1)]];
        [beatInBar addObject:[NSNumber numberWithInt:i%songSetup.timeSignatureNominator.intValue + 1]];
    }
}


@end
