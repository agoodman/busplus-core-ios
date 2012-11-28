//
//  Candidate.h
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Vehicle.h"
#import "Passenger.h"


@interface Candidate : NSManagedObject

@property (strong) NSNumber* candidateId;
@property (strong) NSNumber* passengerId;
@property (strong) NSNumber* vehicleId;
@property (strong) NSNumber* bid;
@property (strong) NSDate* assignedAt;
@property (strong) Passenger* passenger;
@property (strong) Vehicle* vehicle;

@end
