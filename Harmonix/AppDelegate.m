//
//  AppDelegate.m
//  Harmonix
//
//  Created by Even Northug on 28.11.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "AppDelegate.h"

#import "TonalScale.h"
#import "TonalKey.m"
#import "Degree.h"
#import "ChordFamily.h"
#import "Scale.h"
#import "Genre.h"
#import "ChordType.h"


@implementation AppDelegate

//@synthesize mainVC;
//@synthesize navController;

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

//@synthesize tonalScale;
//@synthesize degreeAndInterval;


+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *) [UIApplication sharedApplication].delegate;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [self addObjects];  // add data to data model
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Harmonix" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
        NSError *error = nil;
    
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
        // ALWAYS REMOVE EXISTING DATABASE
        // BOOL bln = [_persistentStoreCoordinator removePersistentStore:(NSPersistentStore *)_persistentStoreCoordinator error:&error];
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Harmonix.sqlite"];
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark - Core Data convenience methods


- (void) addObjects
{
    _managedObjectContext = [self managedObjectContext];
    TonalScale *tonalScale;
    TonalKey *tonalKey;
    ChordFamily *chordFamily;
    Scale *scale;
    ChordType *chordType;
    Degree *degree;
    Genre *genre;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity;

    NSError *error;
    NSPredicate *predicate;
    NSArray *fetchedObjects;

    NSMutableArray *stringArray;// = [[NSMutableArray alloc]init];
    NSMutableArray *offsetArray = [[NSMutableArray alloc]init];
    
    // Add "Genre" objects
    stringArray = [NSMutableArray arrayWithObjects:@"Jazz", @"Pop/Rock", @"Latin", @"Blues", @"Classical", nil];
    for (NSMutableString *str in stringArray) {
        genre = [NSEntityDescription insertNewObjectForEntityForName:@"Genre" inManagedObjectContext:_managedObjectContext];
        genre.name = str;
    }
    // temporarily: fetch jazz genre, assign this single element array to chordScaleDegree genre prop
    entity = [NSEntityDescription
              entityForName:@"Genre" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    predicate = [NSPredicate predicateWithFormat:@"%K like %@",
                 @"name", @"Jazz"];
    [fetchRequest setPredicate:predicate];
    fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];

    // chord family data
    NSMutableArray *cfiArray = [NSMutableArray array];
    
    NSMutableDictionary *chordFamInput = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               @"M7", @"symbol",
                                @"maj7", @"longSymbol",
                               [NSArray arrayWithObjects:@"1", @"3", @"5", @"7", nil], @"strDegree",
                               nil];
    [cfiArray addObject:chordFamInput];
    
    chordFamInput = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          @"m7", @"symbol",
                                          @"min7", @"longSymbol",
                                          [NSArray arrayWithObjects:@"1", @"b3", @"5", @"b7", nil], @"strDegree",
                                          nil];
    [cfiArray addObject:chordFamInput];
    
    chordFamInput = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          @"7", @"symbol",
                                          @"dom7", @"longSymbol",
                                          [NSArray arrayWithObjects:@"1", @"3", @"5", @"b7", nil], @"strDegree",
                                          nil];
    [cfiArray addObject:chordFamInput];
    
    chordFamInput = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                     @"m7b5", @"symbol",
                     @"min7b5", @"longSymbol",
                     [NSArray arrayWithObjects:@"1", @"b3", @"b5", @"b7", nil], @"strDegree",
                     nil];
    [cfiArray addObject:chordFamInput];
    
    chordFamInput = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                     @"mM7", @"symbol",
                     @"minmaj7", @"longSymbol",
                     [NSArray arrayWithObjects:@"1", @"b3", @"5", @"7", nil], @"strDegree",
                     nil];
    [cfiArray addObject:chordFamInput];
    
    chordFamInput = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                     @"dim7", @"symbol",
                     @"dim7", @"longSymbol",
                     [NSArray arrayWithObjects:@"1", @"b3", @"b5", @"bb7", nil], @"strDegree",
                     nil];
    [cfiArray addObject:chordFamInput];
    
    
    // tonal scales (ts) data. load input array ts
    NSNumber *y = [NSNumber numberWithBool:YES];
    NSNumber *n = [NSNumber numberWithBool:NO];
    NSMutableArray *tsArray = [NSMutableArray array];
    
    NSMutableDictionary *ts = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithInt:1], @"sortNumber",       // not active. replaced by Ordered=YES
                               @"Major", @"name",
                               @"M", @"shortName",
                               @"M", @"gender",
                               [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", nil], @"strDegree",
                               [NSArray arrayWithObjects:y, y, y, y, y, y, n, nil], @"selected",
                               nil];
    [tsArray addObject:ts];
    
    ts = [NSMutableDictionary dictionaryWithObjectsAndKeys:
           [NSNumber numberWithInt:2], @"sortNumber",
           @"Melodic Major", @"name",
           @"MM", @"shortName",
           @"M", @"gender",
           [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"b6", @"b7", nil], @"strDegree",
           [NSArray arrayWithObjects:y, n, n, y, n, y, y, nil], @"selected",
           nil];
    [tsArray addObject:ts];
    
    ts = [NSMutableDictionary dictionaryWithObjectsAndKeys:
           [NSNumber numberWithInt:3], @"sortNumber",
           @"Harmonic Major", @"name",
           @"HM", @"shortName",
           @"M", @"gender",
           [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"b6", @"7", nil], @"strDegree",
          [NSArray arrayWithObjects:y, n, y, y, y, y, y, nil], @"selected",
           nil];
    [tsArray addObject:ts];
    
    ts = [NSMutableDictionary dictionaryWithObjectsAndKeys:
          [NSNumber numberWithInt:4], @"sortNumber",
          @"Double Harmonic Major", @"name",
          @"dHM", @"shortName",
          @"M", @"gender",
          [NSArray arrayWithObjects:@"1", @"b2", @"3", @"4", @"5", @"b6", @"7", nil], @"strDegree",
          [NSArray arrayWithObjects:y, y, n, y, y, y, n, nil], @"selected",
          nil];
    [tsArray addObject:ts];
    
    ts = [NSMutableDictionary dictionaryWithObjectsAndKeys:
          [NSNumber numberWithInt:5], @"sortNumber",
          @"Natural minor", @"name",
          @"Nm", @"shortName",
          @"m", @"gender",
          [NSArray arrayWithObjects:@"1", @"2", @"b3", @"4", @"5", @"b6", @"b7", nil], @"strDegree",
          [NSArray arrayWithObjects:y, y, y, y, y, y, y, nil], @"selected",
          nil];
    [tsArray addObject:ts];

    ts = [NSMutableDictionary dictionaryWithObjectsAndKeys:
          [NSNumber numberWithInt:6], @"sortNumber",
          @"Melodic minor", @"name",
          @"Mm", @"shortName",
          @"m", @"gender",
          [NSArray arrayWithObjects:@"1", @"2", @"b3", @"4", @"5", @"6", @"7", nil], @"strDegree",
          [NSArray arrayWithObjects:y, y, y, y, y, n, n, nil], @"selected",
          nil];
    [tsArray addObject:ts];
    
    ts = [NSMutableDictionary dictionaryWithObjectsAndKeys:
          [NSNumber numberWithInt:7], @"sortNumber",
          @"Harmonic minor", @"name",
          @"Hm", @"shortName",
          @"m", @"gender",
          [NSArray arrayWithObjects:@"1", @"2", @"b3", @"4", @"5", @"b6", @"7", nil], @"strDegree",
          [NSArray arrayWithObjects:y, y, y, y, y, y, y, nil], @"selected",
          nil];
    [tsArray addObject:ts];
    
    ts = [NSMutableDictionary dictionaryWithObjectsAndKeys:
          [NSNumber numberWithInt:8], @"sortNumber",
          @"Double Harmonic minor", @"name",
          @"dHm", @"shortName",
          @"m", @"gender",
          [NSArray arrayWithObjects:@"1", @"2", @"b3", @"#4", @"5", @"b6", @"7", nil], @"strDegree",
          [NSArray arrayWithObjects:y, n, y, n, y, y, y, nil], @"selected",
          nil];
    [tsArray addObject:ts];
    
    
    NSArray *keyDegree = [NSMutableArray arrayWithObjects:            // only 12 degrees for keys!
                            @"1", @"b2", @"2", @"b3", @"3", @"4", @"#4", @"5", @"b6", @"6", @"b7", @"7", nil];
    
    
    // add tonal keys

    NSArray *mode = [NSArray arrayWithObjects:@"M", @"m", nil];
    for (int dgr=0; dgr<12;dgr++) {
        for (int mde=0; mde<2; mde++) {
            tonalKey = [NSEntityDescription insertNewObjectForEntityForName:@"TonalKey"
                                                   inManagedObjectContext:_managedObjectContext];
            //tonalKey.tonalDegree = [NSString stringWithFormat:@"%@", [degrees objectAtIndex:dgr]];
            tonalKey.tonalDegree = [keyDegree objectAtIndex:dgr];
            tonalKey.tonalMode = [mode objectAtIndex:mde];
        }
    }
    
    
    // add 12+6= 18 degrees (for scales)
    NSArray *tonalDegree = [NSArray arrayWithObjects:@"#1", @"#2", @"b5", @"#5", @"#6", @"bb6", nil];
    for (int i=0; i<12; i++) {
        degree = [NSEntityDescription insertNewObjectForEntityForName:@"Degree"
                                                   inManagedObjectContext:_managedObjectContext];
        degree.degree = [keyDegree objectAtIndex:i];
    }
    for (int i=0; i<[tonalDegree count]; i++) {
        degree = [NSEntityDescription insertNewObjectForEntityForName:@"Degree"
                                               inManagedObjectContext:_managedObjectContext];
        degree.degree = [tonalDegree objectAtIndex:i];
    }

    
    // add 6 chord families
    
    for (int i=0; i<[cfiArray count]; i++) {
        chordFamily = [NSEntityDescription insertNewObjectForEntityForName:@"ChordFamily" inManagedObjectContext:_managedObjectContext];
        chordFamily.thirdOrFourthDegree = [[cfiArray objectAtIndex:i]objectForKey:@"strDegree"];
        chordFamily.fifthDegree = [[cfiArray objectAtIndex:i]objectForKey:@"strDegree"];
        chordFamily.seventhDegree = [[cfiArray objectAtIndex:i]objectForKey :@"strDegree"];
        chordFamily.symbol = [[cfiArray objectAtIndex:i]objectForKey:@"symbol"];
    }
    
    
    // add 8 tonal scales, 56 scales, 56- chordtypes and 6+ chord families(?).
    for (int idx=0; idx<[tsArray count]; idx++) {     // for each tonal scale
        // add tonal scales
        tonalScale = [NSEntityDescription insertNewObjectForEntityForName:@"TonalScale"
                                                   inManagedObjectContext:_managedObjectContext];
        tonalScale.name = [[tsArray objectAtIndex:idx]objectForKey:@"name"];
        tonalScale.abbrev = [[tsArray objectAtIndex:idx]objectForKey:@"shortName"];
        tonalScale.tonalMode = [[tsArray objectAtIndex:idx]objectForKey:@"gender"];
        // tonalScale.tonalKey = fetch keys with matching tonalMode
        
        // add scales etc
        
        NSArray *degrees = [[tsArray objectAtIndex:idx]objectForKey:@"strDegree"];
        NSArray *selects = [[tsArray objectAtIndex:idx]objectForKey:@"selected"];
        // for all degrees of the tonal scale
        for (int i=0; i<[degrees count]; i++) {
            scale = [NSEntityDescription insertNewObjectForEntityForName:@"Scale" inManagedObjectContext:_managedObjectContext];
            scale.tonalScale = tonalScale;
            scale.selected = [NSNumber numberWithBool:YES];     // chords derived from ALL scales
            scale.tonalSelected = [selects objectAtIndex:i];    // whether function (or chordType?) exists at the related tonal scale degree
            if (scale.tonalSelected.intValue == 1)
                scale.tonalReset = [NSNumber numberWithBool:YES];   // resets to initial selections
            NSString *str = tonalScale.abbrev;
            str = [str stringByAppendingString:@" mode "];
            str = [str stringByAppendingString:[degrees objectAtIndex:i]];
            scale.keyAndModeName = str;
            
            //scaleNum+=1;    // ?
            
            // fetch degree objects with degree attribute matching degrees........
            NSFetchRequest *scaleDegreesRequest = [[NSFetchRequest alloc] init];
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Degree" inManagedObjectContext:_managedObjectContext];
            [scaleDegreesRequest setEntity:entity];
            NSMutableArray *predicates = [NSMutableArray array];    // makes several??
            for (int j=0; j<[degrees count]; j++) {
                str = [degrees objectAtIndex:((i+j) % 7)];          // all modal scales are 7-note
                predicate = [NSPredicate predicateWithFormat:@"%K like %@",
                         @"degree", str];
                [predicates addObject:predicate];
            }
            predicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
            [scaleDegreesRequest setPredicate:predicate];
            NSError *error = nil;
            scale.degree = [_managedObjectContext executeFetchRequest:scaleDegreesRequest error:&error];
            
            
            
            // convert degree array to base 1
            offsetArray = [self offsetDegree:degrees rootArrayIndex:i];
            NSString *familySymbol = [self familySymbolFromDegrees:offsetArray];
            if (familySymbol) {             // if chordType is recognizable as family, here 2 out of 56
                // add chordtype from scales
                chordType = [NSEntityDescription insertNewObjectForEntityForName:@"ChordType" inManagedObjectContext:_managedObjectContext];
                chordType.scale = scale;        // all scales have their respective chordtype (one-to-one)
                // connect chordtype to chordFamily
                //(to SEVERAL chordFamilies for some NON-MODAL modal chords)
                
                chordType.notation = familySymbol;
                
                ChordFamily *item;
                for (item in chordFamily) {
                    if (item.symbol = familySymbol) {
                        chordType.chordFamily = item;
                        break;
                    }
                }
            }

            /*
            // is familySymbol unique?
            NSFetchRequest *duplicateFamilyRequest = [[NSFetchRequest alloc] init];
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"ChordFamily" inManagedObjectContext:_managedObjectContext];
            [duplicateFamilyRequest setEntity:entity];
            predicate = [NSPredicate predicateWithFormat:@"%K like %@",
                             @"symbol", familySymbol];
            [duplicateFamilyRequest setPredicate:predicate];
            NSError *error = nil;
            NSUInteger count = [_managedObjectContext countForFetchRequest:duplicateFamilyRequest error:&error];
            if (!error && count==0){
                // buffer chordFamily
                chordFamily = [NSEntityDescription insertNewObjectForEntityForName:@"ChordFamily" inManagedObjectContext:_managedObjectContext];
                chordFamily.symbol = familySymbol;
                for (int i=0; i<[offsetArray count]; i++) {
                    switch (i) {
                        case 2:
                            chordFamily.thirdDegree = [degrees objectAtIndex:i];
                            break;
                        case 4:
                            chordFamily.fifthDegree = [degrees objectAtIndex:i];
                            break;
                        case 6:
                            chordFamily.seventhDegree = [degrees objectAtIndex:i];
                            break;
                    }
                }
                chordScaleDegree.chordFamily = chordFamily;
                //NSLog(@"%@", chordFamily.symbol);       // lists each new family symbol
            }
            else if (count == 1) {
                NSArray *existingFamilies = [_managedObjectContext executeFetchRequest:duplicateFamilyRequest error:&error];
                chordScaleDegree.chordFamily = [existingFamilies objectAtIndex:0];
            }
            */
                
            // log chordScaleDegree
            ChordFamily *cFam= chordType.chordFamily;
            NSNumber *bln = scale.tonalSelected;
            NSLog(@"%@ %@ sel%d", [scale.degree objectAtIndex:0], cFam.symbol, bln.intValue);
        }
    }
    
    // save to persistent store
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Error: %@", [error localizedFailureReason]);
    }
}


- (NSString *)familySymbolFromDegrees:chordFamilyDegrees
// works only for 7-note chords/scales(?)
{
    NSString *str;
    if ([chordFamilyDegrees objectAtIndex:2]==@"b3") {
        if ([chordFamilyDegrees objectAtIndex:6]==@"bb7")
            str = @"dim7";
        else if ([chordFamilyDegrees objectAtIndex:6]==@"b7")
            str = @"m7";
        else if ([chordFamilyDegrees objectAtIndex:6]==@"7")
            str = @"mM7";
    }
    else if ([chordFamilyDegrees objectAtIndex:2]==@"3") {
        if ([chordFamilyDegrees objectAtIndex:6]==@"b7")
            str = @"7";
        else if ([chordFamilyDegrees objectAtIndex:6]==@"7")
            str =@"M7";
        else if ([chordFamilyDegrees objectAtIndex:6]==@"bb7")
            str =@"Mbb7";   //no such family
    }
    else    // bb3
        return nil;
    
    if ([chordFamilyDegrees objectAtIndex:4] != @"5" && str != @"dim7") // #4 has index 3, b6 has index 5. ok
        // m7b5 is ok, m7#5 is NOT! Check printout.
        str = [str stringByAppendingString:[chordFamilyDegrees objectAtIndex:4]];
    
    return str;
}

/*
- (NSString *) accidFromString:(NSString *)str      // not in use
// returns prefix part of degree (f ex "bb7"), i.e. #, b, bb or empty
{
    NSMutableString *accid = [[NSMutableString alloc]initWithString:@""];
    char c;
    for (int i=0; i < [str length]; i++) {
        c = [str characterAtIndex:i];
        if (c == '#' || c == 'b')
            [accid appendFormat:@"%c", c];
    }
    return accid;
}
*/

- (NSNumber *) degreeFromString:(NSString *)str         // not in use
// returns number part of degree string (f ex "bb7"), i.e. 1, 2, 3 ...
{
    char c = [str characterAtIndex:([str length]-1)];
    return [NSNumber numberWithChar:c];
}


- (NSMutableArray *) offsetDegree:(NSArray *)stringArray rootArrayIndex:(int)rootArrayIndex
{
    NSMutableArray *retArray = [[NSMutableArray alloc]init];
    NSString *str;
    int arrayIdx;
    int chromRoot = [self chromNoteFromDegree:[stringArray objectAtIndex:rootArrayIndex]];
    int chromNote;
    int noteCnt = [stringArray count];
    for (int i=0; i<noteCnt; i++) {
        arrayIdx = (i+rootArrayIndex)%noteCnt;
        chromNote = [self chromNoteFromDegree:[stringArray objectAtIndex:arrayIdx]];
        chromNote -= chromRoot;
        chromNote = (chromNote+12) % 12;
        str = [self degreeFromChromNote:chromNote andDegreeNum:i+1];
        [retArray addObject:str];
    }
    return retArray;
}


- (NSString *) degreeFromChromNote:(int)chromNote andDegreeNum:(int)degreeNum
{
    NSString *str;
    switch (chromNote)
    {
        case 0:
            str = @"1";
            break;
        case 1:
            if (degreeNum==1)
                str = @"#1";
            else
                str = @"b2";
            break;
        case 2:
            str = @"2";
            break;
        case 3:
            if (degreeNum==2)
                str = @"#2";
            else
                str = @"b3";
            break;
        case 4:
            str = @"3";
            break;
        case 5:
            str = @"4";
            break;
        case 6:
            if (degreeNum==4)
                str = @"#4";
            else
                str = @"b5";
            break;
        case 7:
            str = @"5";
            break;
        case 8:
            if (degreeNum==5)
                str = @"#5";
            else
                str = @"b6";
            break;
        case 9:
            if (degreeNum==7)
                str = @"bb7";   // NB
            else
                str = @"6";
            break;
        case 10:
            if (degreeNum==6)
                str = @"#6";
            else
                str = @"b7";
            break;
        case 11:
            str = @"7";
            break;
    }
    return str;
}


- (int) chromNoteFromDegree:(NSString *)str
{
    int retValue=0;
    char c;
    for (int i=0; i < [str length]; i++) {
        c = [str characterAtIndex:i];
        switch (c) {
            case '#':
                retValue++;
                break;
            case 'b':
                retValue--;
                break;
            case '1':
                retValue+=0;
                break;
            case '2':
                retValue+=2;
                break;
            case '3':
                retValue+=4;
                break;
            case '4':
                retValue+=5;
                break;
            case '5':
                retValue+=7;
                break;
            case '6':
                retValue+=9;
                break;
            case '7':
                retValue+=11;
                break;
            default:
                break;
        }
    }
    return retValue;
}

- (int) degreeNumFromDegree:(NSString *)str
{
    char c = [str characterAtIndex:([str length]-1)];
    //return [c integerFromCharacter]
    //return [[NSNumber numberWithUnsignedChar:c] intValue];
    return (int)(c - '0');
}


@end

/*
 - (void)addDegreeAndInterval:(NSSet *)values
 {
 [self willChangeValueForKey:@"degreeAndInterval"        // or CAPITAL D in Degree?
 withSetMutation:NSKeyValueUnionSetMutation
 usingObjects:self.degreeAndInterval];
 [[self degreeAndInterval] addObject:values];
 [[self degreeAndInterval] unionSet:values];
 [self didChangeValueForKey:@"degreeAndInterval"         // do
 withSetMutation:NSKeyValueUnionSetMutation
 usingObjects:values];
 }
 
 predicate = [NSPredicate predicateWithFormat:
 @"(idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d)", 0, 3, 5, 7, 10, 12, 16];

 */
