//
//  Cell.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChordScaleDegree;

@interface Cell : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *function;
@property (nonatomic, retain) NSSet *motion;
@property (nonatomic, retain) NSOrderedSet *cellElement;
@end

@interface Cell (CoreDataGeneratedAccessors)

- (void)addFunctionObject:(ChordScaleDegree *)value;
- (void)removeFunctionObject:(ChordScaleDegree *)value;
- (void)addFunction:(NSSet *)values;
- (void)removeFunction:(NSSet *)values;

- (void)addMotionObject:(NSManagedObject *)value;
- (void)removeMotionObject:(NSManagedObject *)value;
- (void)addMotion:(NSSet *)values;
- (void)removeMotion:(NSSet *)values;

- (void)insertObject:(NSManagedObject *)value inCellElementAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCellElementAtIndex:(NSUInteger)idx;
- (void)insertCellElement:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCellElementAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCellElementAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceCellElementAtIndexes:(NSIndexSet *)indexes withCellElement:(NSArray *)values;
- (void)addCellElementObject:(NSManagedObject *)value;
- (void)removeCellElementObject:(NSManagedObject *)value;
- (void)addCellElement:(NSOrderedSet *)values;
- (void)removeCellElement:(NSOrderedSet *)values;
@end
