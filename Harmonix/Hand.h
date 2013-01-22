//
//  Hand.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Hand : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *structures;
@property (nonatomic, retain) NSManagedObject *voicing;
@end

@interface Hand (CoreDataGeneratedAccessors)

- (void)addStructuresObject:(NSManagedObject *)value;
- (void)removeStructuresObject:(NSManagedObject *)value;
- (void)addStructures:(NSSet *)values;
- (void)removeStructures:(NSSet *)values;

@end
