//
//  Passenger.m
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import "Passenger.h"

@implementation Passenger

@dynamic passengerId, token, startLatitude, startLongitude, endLatitude, endLongitude, vehicleId, vehicle, assignedAt;

+ (void)initObjectLoader:(RKObjectManager*)aMgr
{
    RKManagedObjectMapping* tMapping = (RKManagedObjectMapping*)[self deserialMapping:aMgr];
    [aMgr.mappingProvider setMapping:tMapping forKeyPath:@"passenger"];
    
    [aMgr.mappingProvider setSerializationMapping:[self serialMapping:aMgr] forClass:[Passenger class]];
    [aMgr.router routeClass:[Passenger class] toResourcePath:@"/passengers" forMethod:RKRequestMethodPOST];
    [aMgr.router routeClass:[Passenger class] toResourcePath:@"/passengers/:passengerId" forMethod:RKRequestMethodGET];
    [aMgr.router routeClass:[Passenger class] toResourcePath:@"/passengers/:passengerId" forMethod:RKRequestMethodDELETE];
}

+ (RKObjectMapping*)deserialMapping:(RKObjectManager*)aMgr
{
    RKManagedObjectMapping* tMapping = [RKManagedObjectMapping mappingForClass:[Passenger class] inManagedObjectStore:aMgr.objectStore];
    [tMapping mapKeyPath:@"id" toAttribute:@"passengerId"];
    [tMapping mapKeyPath:@"start_latitude" toAttribute:@"startLatitude"];
    [tMapping mapKeyPath:@"start_longitude" toAttribute:@"startLongitude"];
    [tMapping mapKeyPath:@"end_latitude" toAttribute:@"endLatitude"];
    [tMapping mapKeyPath:@"end_longitude" toAttribute:@"endLongitude"];
    [tMapping mapKeyPath:@"assigned_at" toAttribute:@"assignedAt"];
    [tMapping mapKeyPath:@"vehicle_id" toAttribute:@"vehicleId"];
    tMapping.primaryKeyAttribute = @"passengerId";
    return tMapping;
}

+ (RKObjectMapping*)serialMapping:(RKObjectManager*)aMgr
{
    RKObjectMapping* tMapping = [RKObjectMapping mappingForClass:[Passenger class]];
    [tMapping mapKeyPath:@"token" toAttribute:@"token"];
    [tMapping mapKeyPath:@"startLatitude" toAttribute:@"start_latitude"];
    [tMapping mapKeyPath:@"startLongitude" toAttribute:@"start_longitude"];
    [tMapping mapKeyPath:@"endLatitude" toAttribute:@"end_latitude"];
    [tMapping mapKeyPath:@"endLongitude" toAttribute:@"end_longitude"];
    tMapping.rootKeyPath = @"passenger";
    return tMapping;
}

@end
