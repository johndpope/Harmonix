//
//  TonalScale.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChordFamily, Scale, TonalKey;

@interface TonalScale : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * abbrev;
@property (nonatomic, retain) NSString * tonalMode;
@property (nonatomic, retain) NSOrderedSet *scale;
@property (nonatomic, retain) NSOrderedSet *tonalKey;
@property (nonatomic, retain) NSOrderedSet *chordFamily;
@end

@interface TonalScale (CoreDataGeneratedAccessors)

- (void)insertObject:(Scale *)value inScaleAtIndex:(NSUInteger)idx;
- (void)removeObjectFromScaleAtIndex:(NSUInteger)idx;
- (void)insertScale:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeScaleAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInScaleAtIndex:(NSUInteger)idx withObject:(Scale *)value;
- (void)replaceScaleAtIndexes:(NSIndexSet *)indexes withScale:(NSArray *)values;
- (void)addScaleObject:(Scale *)value;
- (void)removeScaleObject:(Scale *)value;
- (void)addScale:(NSOrderedSet *)values;
- (void)removeScale:(NSOrderedSet *)values;
- (void)insertObject:(TonalKey *)value inTonalKeyAtIndex:(NSUInteger)idx;
- (void)removeObjectFromTonalKeyAtIndex:(NSUInteger)idx;
- (void)insertTonalKey:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeTonalKeyAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTonalKeyAtIndex:(NSUInteger)idx withObject:(TonalKey *)value;
- (void)replaceTonalKeyAtIndexes:(NSIndexSet *)indexes withTonalKey:(NSArray *)values;
- (void)addTonalKeyObject:(TonalKey *)value;
- (void)removeTonalKeyObject:(TonalKey *)value;
- (void)addTonalKey:(NSOrderedSet *)values;
- (void)removeTonalKey:(NSOrderedSet *)values;
- (void)insertObject:(ChordFamily *)value inChordFamilyAtIndex:(NSUInteger)idx;
- (void)removeObjectFromChordFamilyAtIndex:(NSUInteger)idx;
- (void)insertChordFamily:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeChordFamilyAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInChordFamilyAtIndex:(NSUInteger)idx withObject:(ChordFamily *)value;
- (void)replaceChordFamilyAtIndexes:(NSIndexSet *)indexes withChordFamily:(NSArray *)values;
- (void)addChordFamilyObject:(ChordFamily *)value;
- (void)removeChordFamilyObject:(ChordFamily *)value;
- (void)addChordFamily:(NSOrderedSet *)values;
- (void)removeChordFamily:(NSOrderedSet *)values;
@end
