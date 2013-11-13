//
//  UserContact.m
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/21/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "UserContact.h"

@implementation UserContact

@synthesize userID,email,phone;

-(BOOL) NSStringIsValidEmail:(NSString *)checkEmail
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkEmail];
}

-(BOOL) NSStringIsValidPhone: (NSString *)checkPhone {
    NSString *phoneRegex = @"[0-9]{7}([0-9]{3})?";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
   return [phoneTest evaluateWithObject:checkPhone];
}

-(BOOL) UserIDExisted: (NSString *) checkID {
    //update later with adding communication with remote server
}
-(BOOL) UserPhoneExisted: (NSString *) checkPhone {
    //update later with adding communication with remote server
}
-(BOOL) UserEmailExisted: (NSString *) checkEmail {
    //update later with adding communication with remote server
}

@end
