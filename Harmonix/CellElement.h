//
//  CellElement.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cell, ChordScaleDegree;

@interface CellElement : NSManagedObject

@property (nonatomic, retain) NSString * cellPositionAB;
@property (nonatomic, retain) NSSet *function;
@property (nonatomic, retain) NSSet *cell;
@end

@interface CellElement (CoreDataGeneratedAccessors)

- (void)addFunctionObject:(ChordScaleDegree *)value;
- (void)removeFunctionObject:(ChordScaleDegree *)value;
- (void)addFunction:(NSSet *)values;
- (void)removeFunction:(NSSet *)values;

- (void)addCellObject:(Cell *)value;
- (void)removeCellObject:(Cell *)value;
- (void)addCell:(NSSet *)values;
- (void)removeCell:(NSSet *)values;

@end
