//
//  ChordType.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChordFamily, Interpretation, Scale;

@interface ChordType : NSManagedObject

@property (nonatomic, retain) NSString * notation;
@property (nonatomic, retain) NSNumber * sus4;
@property (nonatomic, retain) ChordFamily *chordFamily;
//@property (nonatomic, retain) NSSet *scale;   // to many
@property (nonatomic, retain) Scale *scale;     // to one
@property (nonatomic, retain) Interpretation *interpretation;
@end

@interface ChordType (CoreDataGeneratedAccessors)

- (void)addScaleObject:(Scale *)value;
- (void)removeScaleObject:(Scale *)value;
- (void)addScale:(NSSet *)values;
- (void)removeScale:(NSSet *)values;

@end
