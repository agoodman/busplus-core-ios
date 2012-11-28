//
//  Vehicle.h
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Driver.h"


@interface Vehicle : NSManagedObject

@property (strong) NSNumber* vehicleId;
@property (strong) NSString* token;
@property (strong) NSNumber* latitude;
@property (strong) NSNumber* longitude;
@property (strong) NSNumber* seatsAvailable;
@property (strong) NSSet* passengers;
@property (strong) Driver* driver;

@end
