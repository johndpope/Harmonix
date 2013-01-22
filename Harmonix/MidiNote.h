//
//  MidiNote.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MidiNote : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSSet *chord;
@end

@interface MidiNote (CoreDataGeneratedAccessors)

- (void)addChordObject:(NSManagedObject *)value;
- (void)removeChordObject:(NSManagedObject *)value;
- (void)addChord:(NSSet *)values;
- (void)removeChord:(NSSet *)values;

@end
