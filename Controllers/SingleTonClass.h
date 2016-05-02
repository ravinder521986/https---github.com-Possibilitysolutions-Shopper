//
//  SingleTonClass.h
//  Customer Connect
//
//  Created by Ravinder on 10/03/14.
//  Copyright (c) 2014 Ravinder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleTonClass : NSObject{
    NSString *reloadTransaction;
    NSString *status;
    NSMutableArray *contactArray;
    NSMutableArray *selectedArray;
    NSMutableArray *sendingArray;
    NSString *paymentStatus;
    NSString *event_Id;
    NSString *order_size;
    NSString *order_colour;
    NSString *shipping_address;


    
}

@property (nonatomic,strong) NSString *paymentStatus;
@property (nonatomic,strong) NSString *order_size;
@property (nonatomic,strong) NSString *order_colour;

@property (nonatomic,strong) NSString *reloadTransaction;
@property (nonatomic,strong) NSString *event_Id;


@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSMutableArray *contactArray;
@property (nonatomic,strong) NSMutableArray *filterArray;
@property (nonatomic,strong) NSMutableArray *sendingArray;
@property (nonatomic,strong) NSString *shipping_address;



+(SingleTonClass*) getInstance;


@end
