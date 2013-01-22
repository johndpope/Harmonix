//
//  HarmonicFunction.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChordScaleDegree;

@interface HarmonicFunction : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * abbrev;
@property (nonatomic, retain) NSSet *function;
@end

@interface HarmonicFunction (CoreDataGeneratedAccessors)

- (void)addFunctionObject:(ChordScaleDegree *)value;
- (void)removeFunctionObject:(ChordScaleDegree *)value;
- (void)addFunction:(NSSet *)values;
- (void)removeFunction:(NSSet *)values;

@end
