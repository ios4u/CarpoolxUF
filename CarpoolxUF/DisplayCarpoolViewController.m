//
//  DisplayCarpoolViewController.m
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "DisplayCarpoolViewController.h"

@interface DisplayCarpoolViewController ()

@end

@implementation DisplayCarpoolViewController

@synthesize currentCarpool,priceCarpool,seatNum;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([currentCarpool roundTrip]) {
        return 2;
    }
    else {
        return 1;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return @"TRIP #1:Go Trip";
    }
    else {
        return @"TRIP #2:Back Trip";
    }
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(nil == cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"TripCell"];
    }
    
    NSString *tripLocations;
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *tripDates;
    
    if([indexPath section]==0) {
        tripLocations=[[NSString alloc] initWithFormat:@"%@ to %@",[currentCarpool origin],[currentCarpool destination]];
        tripDates=[dateFormatter stringFromDate:[currentCarpool departueDate]];
    }
    else {
         tripLocations=[[NSString alloc] initWithFormat:@"%@ to %@",[currentCarpool destination],[currentCarpool origin]];
        tripDates=[dateFormatter stringFromDate:[currentCarpool backDate]];
    }
    
    if (indexPath.row==0) {
        [cell.textLabel setText:tripLocations];
    }
    else {
        [cell.textLabel setText:tripDates];
    }    
    return cell;
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
    priceCarpool.text=[NSString stringWithFormat:@"Price: $%2.2f/seat", [currentCarpool price]];
//    [self setSeatNum:nil];
    switch ([currentCarpool seatAvailable]) {
        case 1:
            [seatNum setProgress:0.8 animated:YES];
            break;
        case 2:
            [seatNum setProgress:0.6 animated:YES];
            break;
        case 3:
            [seatNum setProgress:0.4 animated:YES];
            break;
        case 4:
            [seatNum setProgress:0.2 animated:YES];
            break;
        default:
            [seatNum setProgress:1 animated:YES];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
//    [self setDisplayCarpoolTableView:nil];
//    [self setCarpoolDetailTable:nil];
//    [self setCarpoolDetailTableView:nil];
    [super viewDidUnload];
}


- (IBAction)addMeCarpool:(id)sender {
    UIAlertView *myAlert = [[UIAlertView alloc]
                            initWithTitle:@"Seat Hold is set successfully!"
                            message:@"Attention: This hold can only exist for 1 hour, to occupy a seat, please contact with the driver a.s.a.p"
                            delegate:nil
                            cancelButtonTitle:@"Okay"
                            otherButtonTitles:nil];
    [myAlert show];

    switch ([currentCarpool seatAvailable]) {
        case 1:
            [seatNum setProgress:1.0 animated:YES];
            [currentCarpool setSeatAvailable:[currentCarpool seatAvailable]-1];
            break;
        case 2:
            [seatNum setProgress:0.8 animated:YES];
            [currentCarpool setSeatAvailable:[currentCarpool seatAvailable]-1];
            break;
        case 3:
            [seatNum setProgress:0.6 animated:YES];
            [currentCarpool setSeatAvailable:[currentCarpool seatAvailable]-1];
            break;
        case 4:
            [seatNum setProgress:0.4 animated:YES];
            [currentCarpool setSeatAvailable:[currentCarpool seatAvailable]-1];
            break;
        default:
            [seatNum setProgress:1 animated:YES];
            [currentCarpool setSeatAvailable:[currentCarpool seatAvailable]-1];
            break;
    }
}
@end
