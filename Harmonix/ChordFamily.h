//
//  ChordFamily.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChordScaleDegree, ChordType, TonalScale;

@interface ChordFamily : NSManagedObject

@property (nonatomic, retain) NSString * fifthDegree;
@property (nonatomic, retain) NSString * seventhDegree;
@property (nonatomic, retain) NSString * symbol;
@property (nonatomic, retain) NSString * thirdOrFourthDegree;
@property (nonatomic, retain) NSSet *chordType;
@property (nonatomic, retain) NSSet *function;
@property (nonatomic, retain) NSSet *tonalScale;
@end

@interface ChordFamily (CoreDataGeneratedAccessors)

- (void)addChordTypeObject:(ChordType *)value;
- (void)removeChordTypeObject:(ChordType *)value;
- (void)addChordType:(NSSet *)values;
- (void)removeChordType:(NSSet *)values;

- (void)addFunctionObject:(ChordScaleDegree *)value;
- (void)removeFunctionObject:(ChordScaleDegree *)value;
- (void)addFunction:(NSSet *)values;
- (void)removeFunction:(NSSet *)values;

- (void)addTonalScaleObject:(TonalScale *)value;
- (void)removeTonalScaleObject:(TonalScale *)value;
- (void)addTonalScale:(NSSet *)values;
- (void)removeTonalScale:(NSSet *)values;

@end
