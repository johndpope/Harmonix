//
//  AppDelegate.h
//  Harmonix
//
//  Created by Even Northug on 28.11.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainVC.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window; // no synthesize

//@property (strong, nonatomic) UINavigationController *navController;
//@property (strong, nonatomic) MainVC *mainVC;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+ (AppDelegate *)sharedAppDelegate;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (NSMutableArray *) offsetDegree:(NSArray *)stringArray rootArrayIndex:(int) rootArrayIndex;
- (int) chromNoteFromDegree:(NSString *)str;
- (int) degreeNumFromDegree:(NSString *)str;
- (NSString *)familySymbolFromDegrees:(NSMutableArray *)chordFamilyDegrees;

@end
