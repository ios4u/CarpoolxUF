//
//  DisplayCarpoolViewController.h
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Carpool.h"

@interface DisplayCarpoolViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) Carpool *currentCarpool;

//@property (weak, nonatomic) IBOutlet UITableView *carpoolDetailTableView;

@property (weak, nonatomic) IBOutlet UILabel *priceCarpool;
@property (weak, nonatomic) IBOutlet UIProgressView *seatNum;
//@property (weak, nonatomic) IBOutlet UIImageView *driverImage;

- (IBAction)addMeCarpool:(id)sender;

@end
