//
//  LaunchViewController.m
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "LaunchViewController.h"
#import "LoginViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    UIBarButtonItem *loginButton = [[UIBarButtonItem alloc]
//                                    initWithTitle:@"Login"
//                                    style:UIBarButtonItemStyleBordered
//                                    target:self
//                                    action:@selector(loginView)];
//    self.navigationItem.rightBarButtonItem = loginButton;
    
    UIAlertView *myAlert = [[UIAlertView alloc]
                            initWithTitle:@"Welcome to use CarpoolxUF!"
                            message:@"There is currently no updates in preset carpool tags"
                            delegate:nil
                            cancelButtonTitle:@"Okay"
                            otherButtonTitles:nil];
    [myAlert show];
    
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"SegueToLogin"])
    {
        LoginViewController *loginViewController=segue.destinationViewController;
        loginViewController.loginDelegate=self;
        
    }
}

-(void)backToLaunch {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
