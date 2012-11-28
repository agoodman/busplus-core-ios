//
//  Driver.m
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import "Driver.h"
#import "Vehicle.h"


@implementation Driver

@dynamic driverId, email, firstName, lastName, licenseNumber, vehicle;

+ (void)initObjectLoader:(RKObjectManager*)aMgr
{
    RKManagedObjectMapping* tMapping = (RKManagedObjectMapping*)[self deserialMapping:aMgr];
    [aMgr.mappingProvider setMapping:tMapping forKeyPath:@"driver"];
    
    [aMgr.mappingProvider setSerializationMapping:[self serialMapping:aMgr] forClass:[Driver class]];
    [aMgr.router routeClass:[Driver class] toResourcePath:@"/drivers" forMethod:RKRequestMethodPOST];
    [aMgr.router routeClass:[Driver class] toResourcePath:@"/drivers/:driverId" forMethod:RKRequestMethodPUT];
    [aMgr.router routeClass:[Driver class] toResourcePath:@"/drivers/:driverId" forMethod:RKRequestMethodGET];
    [aMgr.router routeClass:[Driver class] toResourcePath:@"/drivers/:driverId" forMethod:RKRequestMethodDELETE];
}

+ (RKObjectMapping*)deserialMapping:(RKObjectManager*)aMgr
{
    RKManagedObjectMapping* tMapping = [RKManagedObjectMapping mappingForClass:[Driver class] inManagedObjectStore:aMgr.objectStore];
    [tMapping mapKeyPath:@"id" toAttribute:@"driverId"];
    [tMapping mapKeyPath:@"email" toAttribute:@"email"];
    [tMapping mapKeyPath:@"license_number" toAttribute:@"licenseNumber"];
    tMapping.primaryKeyAttribute = @"driverId";
    return tMapping;
}

+ (RKObjectMapping*)serialMapping:(RKObjectManager*)aMgr
{
    RKObjectMapping* tMapping = [RKObjectMapping mappingForClass:[Driver class]];
    [tMapping mapKeyPath:@"email" toAttribute:@"email"];
    [tMapping mapKeyPath:@"licenseNumber" toAttribute:@"license_number"];
    tMapping.rootKeyPath = @"driver";
    return tMapping;
}

@end
