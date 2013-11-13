//
//  NotifySettingsViewController.h
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotifySettingsViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

//@property (weak, nonatomic) IBOutlet UISwitch *setupNotificationSwitch;

@property (weak, nonatomic) IBOutlet UIPickerView *frequencyPicker;

@property (nonatomic,strong) NSArray *frequency;

//- (IBAction)notificationSwitch:(id)sender;


@end
