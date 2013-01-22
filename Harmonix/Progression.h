//
//  Progression.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Row;

@interface Progression : NSManagedObject

@property (nonatomic, retain) NSString * degree;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSOrderedSet *row;
@end

@interface Progression (CoreDataGeneratedAccessors)

- (void)insertObject:(Row *)value inRowAtIndex:(NSUInteger)idx;
- (void)removeObjectFromRowAtIndex:(NSUInteger)idx;
- (void)insertRow:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeRowAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInRowAtIndex:(NSUInteger)idx withObject:(Row *)value;
- (void)replaceRowAtIndexes:(NSIndexSet *)indexes withRow:(NSArray *)values;
- (void)addRowObject:(Row *)value;
- (void)removeRowObject:(Row *)value;
- (void)addRow:(NSOrderedSet *)values;
- (void)removeRow:(NSOrderedSet *)values;
@end
