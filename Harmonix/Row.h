//
//  Row.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Row : NSManagedObject

@property (nonatomic, retain) NSNumber * bar;
@property (nonatomic, retain) NSNumber * beat;
@property (nonatomic, retain) NSNumber * row;
@property (nonatomic, retain) NSNumber * subBeat;
@property (nonatomic, retain) NSNumber * durationBeats;
@property (nonatomic, retain) NSManagedObject *chord;
@property (nonatomic, retain) NSSet *progression;
@property (nonatomic, retain) NSManagedObject *song;
@end

@interface Row (CoreDataGeneratedAccessors)

- (void)addProgressionObject:(NSManagedObject *)value;
- (void)removeProgressionObject:(NSManagedObject *)value;
- (void)addProgression:(NSSet *)values;
- (void)removeProgression:(NSSet *)values;

@end
