//
//  Carpool.m
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/21/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "Carpool.h"

@implementation Carpool

@synthesize carpoolNum,origin,destination,driver,carAvailable,roundTrip,departueDate,backDate,seatAvailable,price,note;

- (id) initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.carpoolNum = [[dictionary valueForKey:@"CARPOOLID"] intValue];
        self.origin = [dictionary valueForKey:@"ORIGINLOCATION"];
        self.destination = [dictionary valueForKey:@"DESTINATIONLOCATION"];
        self.driver = [dictionary valueForKey:@"DRIVERID"];
        self.carAvailable = [[dictionary valueForKey:@"CARAVAILABLE"] boolValue];
        self.roundTrip = [[dictionary valueForKey:@"ROUNDTRIP"] boolValue];
        self.departueDate=[dictionary valueForKey:@"DEPARTUREDATE"];
        self.backDate=[dictionary valueForKey:@"BACKDATE"];
        self.seatAvailable=[[dictionary valueForKey:@"SEATAVAILABLE"] intValue];
        self.price=[[dictionary valueForKey:@"PRICE"] floatValue];
        self.note=[dictionary valueForKey:@"NOTE"];
    
    }
    
    return self;
}
@end
