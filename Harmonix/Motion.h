//
//  Motion.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cell;

@interface Motion : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * isAtoB;
@property (nonatomic, retain) NSNumber * isResolving;
@property (nonatomic, retain) NSSet *cell;
@end

@interface Motion (CoreDataGeneratedAccessors)

- (void)addCellObject:(Cell *)value;
- (void)removeCellObject:(Cell *)value;
- (void)addCell:(NSSet *)values;
- (void)removeCell:(NSSet *)values;

@end
