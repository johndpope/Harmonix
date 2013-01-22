//
//  Structure.h
//  Harmonix
//
//  Created by Even Northug on 17.01.13.
//  Copyright (c) 2013 Even Northug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hand;

@interface Structure : NSManagedObject

@property (nonatomic, retain) NSNumber * preStroke;
@property (nonatomic, retain) NSNumber * handSpan;
@property (nonatomic, retain) Hand *hand;

@end
