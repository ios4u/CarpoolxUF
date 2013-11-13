//
//  TagSettingsViewController.m
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "TagSettingsViewController.h"
#import "UserProfileViewController.h"
#import "NotifySettingsViewController.h"

@interface TagSettingsViewController ()

@end

@implementation TagSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    // Override point for customization after application launch.
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIViewController *userProfileVC= [[UserProfileViewController alloc] initWithNibName:@"UserProfileViewController" bundle:nil];
    UIViewController *notifySettingsVC= [[NotifySettingsViewController alloc] initWithNibName:@"NotifySettingsViewController" bundle:nil];
    self.tabBarController.viewControllers = @[userProfileVC, notifySettingsVC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
