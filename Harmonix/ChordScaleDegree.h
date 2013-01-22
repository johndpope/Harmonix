//
//  ChordScaleDegree.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cell, ChordFamily, HarmonicFunction;

@interface ChordScaleDegree : NSManagedObject

@property (nonatomic, retain) NSNumber * reset;
@property (nonatomic, retain) NSNumber * selected;
@property (nonatomic, retain) NSString * tonalDegree;
@property (nonatomic, retain) NSString * tonalMode;
@property (nonatomic, retain) ChordFamily *chordFamily;
@property (nonatomic, retain) NSSet *cellElement;
@property (nonatomic, retain) HarmonicFunction *harmonicFunction;
@property (nonatomic, retain) NSSet *subsequent;
@end

@interface ChordScaleDegree (CoreDataGeneratedAccessors)

- (void)addCellElementObject:(NSManagedObject *)value;
- (void)removeCellElementObject:(NSManagedObject *)value;
- (void)addCellElement:(NSSet *)values;
- (void)removeCellElement:(NSSet *)values;

- (void)addSubsequentObject:(Cell *)value;
- (void)removeSubsequentObject:(Cell *)value;
- (void)addSubsequent:(NSSet *)values;
- (void)removeSubsequent:(NSSet *)values;

@end
