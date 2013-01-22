//
//  Degree.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Scale;

@interface Degree : NSManagedObject

@property (nonatomic, retain) NSString * degree;
@property (nonatomic, retain) NSOrderedSet *scale;
@end

@interface Degree (CoreDataGeneratedAccessors)

- (void)insertObject:(Scale *)value inScaleAtIndex:(NSUInteger)idx;
- (void)removeObjectFromScaleAtIndex:(NSUInteger)idx;
- (void)insertScale:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeScaleAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInScaleAtIndex:(NSUInteger)idx withObject:(Scale *)value;
- (void)replaceScaleAtIndexes:(NSIndexSet *)indexes withScale:(NSArray *)values;
- (void)addScaleObject:(Scale *)value;
- (void)removeScaleObject:(Scale *)value;
- (void)addScale:(NSOrderedSet *)values;
- (void)removeScale:(NSOrderedSet *)values;
@end
