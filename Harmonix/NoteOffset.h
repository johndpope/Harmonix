//
//  NoteOffset.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NoteOffset : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSSet *interpretation;
@end

@interface NoteOffset (CoreDataGeneratedAccessors)

- (void)addInterpretationObject:(NSManagedObject *)value;
- (void)removeInterpretationObject:(NSManagedObject *)value;
- (void)addInterpretation:(NSSet *)values;
- (void)removeInterpretation:(NSSet *)values;

@end
