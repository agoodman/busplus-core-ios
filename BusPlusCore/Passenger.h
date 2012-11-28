//
//  Passenger.h
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKLoadable.h"
#import "Vehicle.h"


@interface Passenger : NSManagedObject <RKLoadable>

@property (strong) NSNumber* passengerId;
@property (strong) NSString* token;
@property (strong) NSNumber* startLatitude;
@property (strong) NSNumber* startLongitude;
@property (strong) NSNumber* endLatitude;
@property (strong) NSNumber* endLongitude;
@property (strong) NSNumber* vehicleId;
@property (strong) Vehicle* vehicle;
@property (strong) NSDate* assignedAt;

@end
