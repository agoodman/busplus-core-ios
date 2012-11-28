//
//  Vehicle.m
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

@dynamic vehicleId, token, latitude, longitude, seatsAvailable, passengers, driver;

+ (void)initObjectLoader:(RKObjectManager*)aMgr
{
    RKManagedObjectMapping* tMapping = (RKManagedObjectMapping*)[self deserialMapping:aMgr];
    [aMgr.mappingProvider setMapping:tMapping forKeyPath:@"vehicle"];
    
    [aMgr.mappingProvider setSerializationMapping:[self serialMapping:aMgr] forClass:[Vehicle class]];
    [aMgr.router routeClass:[Vehicle class] toResourcePath:@"/vehicles" forMethod:RKRequestMethodPOST];
    [aMgr.router routeClass:[Vehicle class] toResourcePath:@"/vehicles/:vehicleId" forMethod:RKRequestMethodPUT];
    [aMgr.router routeClass:[Vehicle class] toResourcePath:@"/vehicles/:vehicleId" forMethod:RKRequestMethodGET];
    [aMgr.router routeClass:[Vehicle class] toResourcePath:@"/vehicles/:vehicleId" forMethod:RKRequestMethodDELETE];
}

+ (RKObjectMapping*)deserialMapping:(RKObjectManager*)aMgr
{
    RKManagedObjectMapping* tMapping = [RKManagedObjectMapping mappingForClass:[Vehicle class] inManagedObjectStore:aMgr.objectStore];
    [tMapping mapKeyPath:@"id" toAttribute:@"vehicleId"];
    [tMapping mapKeyPath:@"driver_id" toAttribute:@"driverId"];
    [tMapping mapKeyPath:@"latitude" toAttribute:@"latitude"];
    [tMapping mapKeyPath:@"longitude" toAttribute:@"longitude"];
    [tMapping mapKeyPath:@"seats_available" toAttribute:@"seatsAvailable"];
    tMapping.primaryKeyAttribute = @"vehicleId";
    return tMapping;
}

+ (RKObjectMapping*)serialMapping:(RKObjectManager*)aMgr
{
    RKObjectMapping* tMapping = [RKObjectMapping mappingForClass:[Vehicle class]];
    [tMapping mapKeyPath:@"driverId" toAttribute:@"driver_id"];
    [tMapping mapKeyPath:@"latitude" toAttribute:@"latitude"];
    [tMapping mapKeyPath:@"longitude" toAttribute:@"longitude"];
    tMapping.rootKeyPath = @"vehicle";
    return tMapping;
}

@end
