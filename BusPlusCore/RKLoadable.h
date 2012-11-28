//
//  RKLoadable.h
//  Bus Plus Core
//
//  Created by Aubrey Goodman on 11/27/12.
//  Copyright (c) 2012 Migrant Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>


@protocol RKLoadable <NSObject>

+(void)initObjectLoader:(RKObjectManager*)aMgr;
+(RKObjectMapping*)deserialMapping:(RKObjectManager*)aMgr;
+(RKObjectMapping*)serialMapping:(RKObjectManager*)aMgr;

@end
