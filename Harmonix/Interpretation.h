//
//  Interpretation.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChordType, NoteOffset;

@interface Interpretation : NSManagedObject

@property (nonatomic, retain) NSString * rootDegree;
@property (nonatomic, retain) NSSet *chordType;
@property (nonatomic, retain) NSSet *noteOffset;
@property (nonatomic, retain) NSSet *chord;
@end

@interface Interpretation (CoreDataGeneratedAccessors)

- (void)addChordTypeObject:(ChordType *)value;
- (void)removeChordTypeObject:(ChordType *)value;
- (void)addChordType:(NSSet *)values;
- (void)removeChordType:(NSSet *)values;

- (void)addNoteOffsetObject:(NoteOffset *)value;
- (void)removeNoteOffsetObject:(NoteOffset *)value;
- (void)addNoteOffset:(NSSet *)values;
- (void)removeNoteOffset:(NSSet *)values;

- (void)addChordObject:(NSManagedObject *)value;
- (void)removeChordObject:(NSManagedObject *)value;
- (void)addChord:(NSSet *)values;
- (void)removeChord:(NSSet *)values;

@end
