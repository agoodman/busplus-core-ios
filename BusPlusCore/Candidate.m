//
//  Candidate.m
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import "Candidate.h"

@implementation Candidate

@dynamic candidateId, vehicleId, passengerId, vehicle, passenger, bid, assignedAt;

+ (void)initObjectLoader:(RKObjectManager*)aMgr
{
    RKManagedObjectMapping* tMapping = (RKManagedObjectMapping*)[self deserialMapping:aMgr];
    [tMapping connectRelationship:@"vehicle" withObjectForPrimaryKeyAttribute:@"vehicleId"];
    [tMapping connectRelationship:@"passenger" withObjectForPrimaryKeyAttribute:@"passengerId"];
    [aMgr.mappingProvider setMapping:tMapping forKeyPath:@"candidate"];
    
    [aMgr.mappingProvider setSerializationMapping:[self serialMapping:aMgr] forClass:[Candidate class]];
    [aMgr.router routeClass:[Candidate class] toResourcePath:@"/candidates/:candidateId" forMethod:RKRequestMethodPUT];
    [aMgr.router routeClass:[Candidate class] toResourcePath:@"/candidates/:candidateId" forMethod:RKRequestMethodGET];
    [aMgr.router routeClass:[Candidate class] toResourcePath:@"/candidates/:candidateId" forMethod:RKRequestMethodDELETE];
}

+ (RKObjectMapping*)deserialMapping:(RKObjectManager*)aMgr
{
    RKManagedObjectMapping* tMapping = [RKManagedObjectMapping mappingForClass:[Candidate class] inManagedObjectStore:aMgr.objectStore];
    [tMapping mapKeyPath:@"id" toAttribute:@"candidateId"];
    [tMapping mapKeyPath:@"vehicle_id" toAttribute:@"vehicleId"];
    [tMapping mapKeyPath:@"passenger_id" toAttribute:@"passengerId"];
    [tMapping mapKeyPath:@"bid" toAttribute:@"bid"];
    [tMapping mapKeyPath:@"assigned_at" toAttribute:@"assignedAt"];
    tMapping.primaryKeyAttribute = @"candidateId";
    return tMapping;
}

+ (RKObjectMapping*)serialMapping:(RKObjectManager*)aMgr
{
    RKObjectMapping* tMapping = [RKObjectMapping mappingForClass:[Candidate class]];
    [tMapping mapKeyPath:@"bid" toAttribute:@"bid"];
    [tMapping mapKeyPath:@"assignedAt" toAttribute:@"assigned_at"];
    tMapping.rootKeyPath = @"candidate";
    return tMapping;
}



@end
