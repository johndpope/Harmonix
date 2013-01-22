//
//  Scale.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChordType, TonalScale;

@interface Scale : NSManagedObject

@property (nonatomic, retain) NSString * churchModeName;
@property (nonatomic, retain) NSString * commonName;
@property (nonatomic, retain) NSString * keyAndModeName;
@property (nonatomic, retain) NSNumber * selected;
@property (nonatomic, retain) NSNumber * tonalReset;
@property (nonatomic, retain) NSNumber * tonalSelected;
@property (nonatomic, retain) NSSet *chordType;
//@property (nonatomic, retain) NSOrderedSet *degree;
@property (nonatomic, retain) NSArray *degree;
@property (nonatomic, retain) TonalScale *tonalScale;
@end

@interface Scale (CoreDataGeneratedAccessors)

- (void)addChordTypeObject:(ChordType *)value;
- (void)removeChordTypeObject:(ChordType *)value;
- (void)addChordType:(NSSet *)values;
- (void)removeChordType:(NSSet *)values;

- (void)insertObject:(NSManagedObject *)value inDegreeAtIndex:(NSUInteger)idx;
- (void)removeObjectFromDegreeAtIndex:(NSUInteger)idx;
- (void)insertDegree:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeDegreeAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInDegreeAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceDegreeAtIndexes:(NSIndexSet *)indexes withDegree:(NSArray *)values;
- (void)addDegreeObject:(NSManagedObject *)value;
- (void)removeDegreeObject:(NSManagedObject *)value;
- (void)addDegree:(NSOrderedSet *)values;   // NB: degree changed to NSArray
- (void)removeDegree:(NSOrderedSet *)values;
- (void)insertObject:(TonalScale *)value inTonalScaleAtIndex:(NSUInteger)idx;
- (void)removeObjectFromTonalScaleAtIndex:(NSUInteger)idx;
- (void)insertTonalScale:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeTonalScaleAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTonalScaleAtIndex:(NSUInteger)idx withObject:(TonalScale *)value;
- (void)replaceTonalScaleAtIndexes:(NSIndexSet *)indexes withTonalScale:(NSArray *)values;
- (void)addTonalScaleObject:(TonalScale *)value;
- (void)removeTonalScaleObject:(TonalScale *)value;
- (void)addTonalScale:(NSOrderedSet *)values;   // NB: changed from NSOrderedSet to TonalScale;
- (void)removeTonalScale:(NSOrderedSet *)values;
@end
