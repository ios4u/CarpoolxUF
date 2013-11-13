//
//  USERDB.m
//  CarpoolxUF
//
//  Created by Wenting Zhao on 4/7/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "USERDB.h"

@implementation USERDB

@synthesize idList;

static NSString * const kUserTableName = @"userinfo";
static NSString * const kDBUserNameKey = @"username";

#pragma mark - Instance methods

-(USERDB *) initWithUSERDBFilename: (NSString *) fn {
    self = (USERDB *) [super initWithDBFilename:fn];
    [self setDefaults];
    return self;
}

- (void) setDefaults {
    // NSLog(@"%s", __FUNCTION__);
    [self addNewIndex];
}

- (void) addNewIndex {
    // NSLog(@"%s", __FUNCTION__);
    [self doQuery:@"CREATE UNIQUE INDEX IF NOT EXISTS feedUrl ON feed(url)"];
}

#pragma mark - User methods

- (NSArray *) getUserIDs {
    // NSLog(@"%s", __FUNCTION__);
    NSDictionary * row;
    [idList removeAllObjects];  // reset the array
    for (row in [self getQuery:@"SELECT id FROM userinfo ORDER BY LOWER(userid)"]) {
        [idList addObject:row[@"id"]];
    }
    return idList;
}

- (NSDictionary *) getUserRow: (NSNumber *) rowid {
    // NSLog(@"%s", __FUNCTION__);
    self->tableName = kUserTableName;
    return [self getRow:rowid];
}
- (void) deleteUserRow: (NSNumber *) rowid {
    // NSLog(@"%s", __FUNCTION__);
    [self doQuery:@"DELETE FROM userinfo WHERE userid = ?", rowid];
}
- (NSNumber *) addUserRow: (NSDictionary *) userinfo {
    // NSLog(@"%s", __FUNCTION__);
    self->tableName = kUserTableName;
    NSNumber * rowid = [self valueFromQuery:@"SELECT userid FROM userinfo WHERE username = ?", userinfo[kDBUserNameKey]];
    if (rowid) {
        [self updateRow:userinfo forRowID:rowid];
        return rowid;
    } else {
        [self insertRow:userinfo];
        return nil;     // indicate that it's a new row
    }

}
- (void) updateUser: (NSDictionary *) userinfo forRowID: (NSNumber *) rowid
{
    // NSLog(@"%s", __FUNCTION__);
    self->tableName = kUserTableName;
    NSDictionary * rec = @{@"phone": userinfo[@"phone"],
                           @"email": userinfo[@"email"]};
    [self updateRow:rec forRowID:rowid];
   
}


@end
