//
//  USERDB.h
//  CarpoolxUF
//
//  Created by Wenting Zhao on 4/7/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "BWDB.h"

@interface USERDB : BWDB {
    NSMutableArray * idList;
}

@property (nonatomic,strong) NSMutableArray *idList;

-(USERDB *) initWithUSERDBFilename: (NSString *) fn;
- (NSArray *) getUserIDs;
- (void) setDefaults;
- (void) addNewIndex;


// User methods
- (NSDictionary *) getUserRow: (NSNumber *) rowid;
- (void) deleteUserRow: (NSNumber *) rowid;
- (NSNumber *) addUserRow: (NSDictionary *) username;
- (void) updateUser: (NSDictionary *) username forRowID: (NSNumber *) rowid;

@end
