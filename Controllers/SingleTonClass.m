//
//  SingleTonClass.m
//  Customer Connect
//
//  Created by Ravinder on 10/03/14.
//  Copyright (c) 2014 Ravinder. All rights reserved.
//

#import "SingleTonClass.h"

@implementation SingleTonClass

@synthesize reloadTransaction,status,contactArray,filterArray,sendingArray,paymentStatus,event_Id;
@synthesize order_colour,order_size,shipping_address;
static SingleTonClass *singletonInstance;

+ (SingleTonClass*)getInstance{
    if (singletonInstance == nil) {
        singletonInstance = [[super alloc] init];
        
        
    }
    
    return singletonInstance;
}



@end
