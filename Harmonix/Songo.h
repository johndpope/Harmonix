//
//  Songo.h
//
//  Created by Even Northug on 16.11.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongSetup.h"



@interface Songo : NSObject
{
    SongSetup *songSetup;
    NSMutableArray *barAtBeat;
    NSMutableArray *beatInBar;
    NSMutableArray *midiNotes;  // array of array objects
}

@property (nonatomic, strong) SongSetup *songSetup;
@property (nonatomic, strong) NSMutableArray *barAtBeat;
@property (nonatomic, strong) NSMutableArray *beatInBar;
@property (nonatomic, strong) NSMutableArray *midiNotes;

- (void) setBarAndBeat;


@end


