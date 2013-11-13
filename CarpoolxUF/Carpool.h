//
//  Carpool.h
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/21/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carpool : NSObject

@property int carpoolNum;
@property (nonatomic,strong) NSString *origin;
@property (nonatomic,strong) NSString *destination;
@property (nonatomic,strong) NSString *driver;
@property BOOL carAvailable;
@property BOOL roundTrip;
@property (nonatomic,strong) NSDate *departueDate;
@property (nonatomic,strong) NSDate *backDate;
@property int seatAvailable;
@property float price;
@property (nonatomic,strong) NSString *note;

//@property (nonatomic,strong) NSDate
- (id) initWithDictionary:(NSDictionary *)dictionary;
@end
