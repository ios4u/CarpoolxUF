//
//  NotifySettingsViewController.m
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "NotifySettingsViewController.h"

@interface NotifySettingsViewController ()

@end

@implementation NotifySettingsViewController

@synthesize frequencyPicker,frequency;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [frequency count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [frequency objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
        
    UIColor *newColor;
    
    switch (row) {
        case 0: case 1: case 2:
            newColor=[UIColor yellowColor];
            break;
        default:
            newColor=[UIColor redColor];
            break;
    }
    
    self.view.backgroundColor = newColor;
}

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
    
//    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 120.0)];

    frequency=[[NSArray alloc]initWithObjects:@"Timely",@"Hourly",@"Daily",@"Custom",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
//- (IBAction)notificationSwitch:(id)sender {
//    if ([sender isOn]) {
//        [frequencyPicker setHidden:YES];
//    }
//    else {
//        [frequencyPicker setHidden:NO];
//    }
//    
//}
@end
