//
//  SongSetup.h
//  Harmonix
//
//  Created by Even Northug on 04.12.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongSetup : NSObject
{
    NSNumber *timeSignatureNominator;
    NSNumber *timeSignatureDenominator; // no subbeats in version 1!
    NSNumber *beatsInUpbeat;
    NSNumber *beatsPerMinute;
    NSNumber *incrementRows;        // move to Settings?
    NSNumber *numBeatsInSong;       // ref NUMCHORDROWS
}
@property(strong,nonatomic) NSNumber *timeSignatureNominator;
@property(strong,nonatomic) NSNumber *numBeatsInSong;

@end
