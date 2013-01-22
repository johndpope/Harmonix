//
//  Song.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Row;

@interface Song : NSManagedObject

@property (nonatomic, retain) NSNumber * metricTempoBPM;
@property (nonatomic, retain) NSNumber * metricBarNominator;
@property (nonatomic, retain) NSNumber * metricBarDenominator;
@property (nonatomic, retain) NSNumber * harmonicPulseBeats;
@property (nonatomic, retain) NSNumber * metricUpBeats;
@property (nonatomic, retain) NSNumber * harmonicAutoPulse;
@property (nonatomic, retain) NSNumber * voicingHandSpan;
@property (nonatomic, retain) NSNumber * voicingSlashBass;
@property (nonatomic, retain) NSNumber * metricRows;
@property (nonatomic, retain) NSNumber * metricSubBeats;
@property (nonatomic, retain) NSNumber * incrementRows;
@property (nonatomic, retain) NSOrderedSet *rows;
@end

@interface Song (CoreDataGeneratedAccessors)

- (void)insertObject:(Row *)value inRowsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromRowsAtIndex:(NSUInteger)idx;
- (void)insertRows:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeRowsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInRowsAtIndex:(NSUInteger)idx withObject:(Row *)value;
- (void)replaceRowsAtIndexes:(NSIndexSet *)indexes withRows:(NSArray *)values;
- (void)addRowsObject:(Row *)value;
- (void)removeRowsObject:(Row *)value;
- (void)addRows:(NSOrderedSet *)values;
- (void)removeRows:(NSOrderedSet *)values;
@end
