//
//  TonalKey.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TonalRelation, TonalScale;

@interface TonalKey : NSManagedObject

@property (nonatomic, retain) NSString * tonalDegree;
@property (nonatomic, retain) NSString * tonalMode;
@property (nonatomic, retain) NSNumber * secKeyMajor;
@property (nonatomic, retain) NSNumber * secKeyMinor;
@property (nonatomic, retain) NSSet *tonalScale;
@property (nonatomic, retain) NSManagedObject *tonalFunction;
@property (nonatomic, retain) TonalRelation *tonalRelation;
@end

@interface TonalKey (CoreDataGeneratedAccessors)

- (void)addTonalScaleObject:(TonalScale *)value;
- (void)removeTonalScaleObject:(TonalScale *)value;
- (void)addTonalScale:(NSSet *)values;
- (void)removeTonalScale:(NSSet *)values;

@end
