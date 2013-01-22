//
//  Voicing.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hand;

@interface Voicing : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * topNoteMelodic;
@property (nonatomic, retain) NSSet *hands;
@property (nonatomic, retain) NSSet *chord;
@end

@interface Voicing (CoreDataGeneratedAccessors)

- (void)addHandsObject:(Hand *)value;
- (void)removeHandsObject:(Hand *)value;
- (void)addHands:(NSSet *)values;
- (void)removeHands:(NSSet *)values;

- (void)addChordObject:(NSManagedObject *)value;
- (void)removeChordObject:(NSManagedObject *)value;
- (void)addChord:(NSSet *)values;
- (void)removeChord:(NSSet *)values;

@end
