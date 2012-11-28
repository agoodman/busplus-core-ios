//
//  Driver.h
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "RKLoadable.h"


@class Vehicle;

@interface Driver : NSManagedObject <RKLoadable>

@property (strong) NSNumber* driverId;
@property (strong) NSString* email;
@property (strong) NSString* firstName;
@property (strong) NSString* lastName;
@property (strong) NSString* licenseNumber;
@property (strong) Vehicle* vehicle;

@end
