//
//  UserContact.h
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/21/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserContact : NSObject

@property (nonatomic,strong) NSString *userID;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *phone;

-(BOOL) NSStringIsValidEmail:(NSString *)checkEmail;
-(BOOL) NSStringIsValidPhone: (NSString *)checkPhone;
-(BOOL) UserIDExisted: (NSString *) checkID;
-(BOOL) UserPhoneExisted: (NSString *) checkPhone;
-(BOOL) UserEmailExisted: (NSString *) checkEmail;

@end
