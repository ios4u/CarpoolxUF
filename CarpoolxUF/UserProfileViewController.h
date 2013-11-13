//
//  UserProfileViewController.h
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserContact.h"

@interface UserProfileViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UserContact *myProfile;

@end
