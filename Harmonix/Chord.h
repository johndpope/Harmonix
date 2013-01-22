//
//  Chord.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Interpretation, MidiNote, Row, Voicing;

@interface Chord : NSManagedObject

@property (nonatomic, retain) NSNumber * selInterp;
@property (nonatomic, retain) Voicing *voicing;
@property (nonatomic, retain) Row *row;
@property (nonatomic, retain) NSOrderedSet *midiNote;
@property (nonatomic, retain) NSSet *interpretation;
@end

@interface Chord (CoreDataGeneratedAccessors)

- (void)insertObject:(MidiNote *)value inMidiNoteAtIndex:(NSUInteger)idx;
- (void)removeObjectFromMidiNoteAtIndex:(NSUInteger)idx;
- (void)insertMidiNote:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeMidiNoteAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInMidiNoteAtIndex:(NSUInteger)idx withObject:(MidiNote *)value;
- (void)replaceMidiNoteAtIndexes:(NSIndexSet *)indexes withMidiNote:(NSArray *)values;
- (void)addMidiNoteObject:(MidiNote *)value;
- (void)removeMidiNoteObject:(MidiNote *)value;
- (void)addMidiNote:(NSOrderedSet *)values;
- (void)removeMidiNote:(NSOrderedSet *)values;
- (void)addInterpretationObject:(Interpretation *)value;
- (void)removeInterpretationObject:(Interpretation *)value;
- (void)addInterpretation:(NSSet *)values;
- (void)removeInterpretation:(NSSet *)values;

@end
