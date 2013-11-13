//
//  CarpoolTableViewController.m
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "CarpoolTableViewController.h"
#import "FilterViewController.h"

@interface CarpoolTableViewController ()

@end

@implementation CarpoolTableViewController

//#define ORIGINLABEL_TAG 1
//#define DESTINATIONLABEL_TAG 2
//#define IMAGE_TAG 3

NSMutableArray *carpoolSet;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowCarpoolDetail"]) {
        DisplayCarpoolViewController *dcvc=[segue destinationViewController];
        NSIndexPath *path=[self.tableView indexPathForSelectedRow];
        Carpool *selectedCarpool=[carpoolSet objectAtIndex:[path row]];
        [dcvc setCurrentCarpool:selectedCarpool];
        //grab the reference to where we are going and pass the information
    }
    else if([[segue identifier] isEqualToString:@"SegueToFilter"])
    {
        FilterViewController *filterViewController=segue.destinationViewController;
        filterViewController.filterDelegate=self;
    }
    

}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    carpoolSet=[[NSMutableArray alloc] init];
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"MM/dd/yyyy";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://cise.ufl.edu/~wenting/tableLoadQuery.php?page=2"];
    NSLog(@"resuqt url: %@", url);
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:7.0];
    NSHTTPURLResponse *response;
    
    NSError *error;
    NSData *rspData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    NSString *data=[[NSString alloc]initWithData:rspData encoding:NSUTF8StringEncoding];
//    NSLog(@"response data: %@", data);
   
    int statusCode = [response statusCode];
    //    NSLog(@"The status code is %i",statusCode);
    
    if (statusCode==200) {
        if(rspData) {
            NSError *e =nil;
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:rspData options: NSJSONReadingMutableContainers error: &e];

            if ([jsonArray count] <1) {
                
                UIAlertView *myAlert = [[UIAlertView alloc]
                                        initWithTitle:@""
                                        message:@"There is no more carpool info!"
                                        delegate:nil
                                        cancelButtonTitle:@"Okay"
                                        otherButtonTitles:nil];
                [myAlert show];
            } else {
                for (int i=0; i < [jsonArray count]; i++) {
                    Carpool *carpool = [[Carpool alloc] initWithDictionary:[jsonArray objectAtIndex:i]];
                    [carpoolSet addObject:carpool];
//                    NSLog(@"carpool: %@", [jsonArray objectAtIndex:i]);
                }
            }
        }        
    }
    
    //    NSError *writeError = nil;
    //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:carpool options:NSJSONWritingPrettyPrinted error:&writeError];
    //    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //    NSLog(@"JSON Output: %@", jsonString);
//    NSString *jsonstring = @"[ { \"msg\" : \"c\", \"from\" : \"a\", \"date\" : \"b\" }, { \"msg\" : \"f\", \"from\" : \"d\", \"date\" : \"e\" } ]";
//    NSLog(@"string: %@", jsonstring);
//    NSError *e =nil;
//    NSData *data1 = [jsonstring dataUsingEncoding:NSUTF8StringEncoding];
//    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data1 options: NSJSONReadingMutableContainers error: &e];
////    NSDictionary *objectDictionary = [NSDictionary alloc] initwit
//    NSDictionary *datadic = [NSDictionary dictionaryWithDictionary:[jsonArray objectAtIndex:0]];
//    NSLog(@"array length: %@", datadic);
    
/*
    Carpool *carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:1];
    [carpool setOrigin:@"Gainesville"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:YES];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];

    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:2];
    [carpool setOrigin:@"Tampa"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:NO];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];
    
    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:3];
    [carpool setOrigin:@"New York"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:NO];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];
    
    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:4];
    [carpool setOrigin:@"Orlando"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:YES];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];
    
    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:5];
    [carpool setOrigin:@"Key West"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:NO];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];
    
    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:6];
    [carpool setOrigin:@"Gainesville"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:NO];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];
    
    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:7];
    [carpool setOrigin:@"Gainesville"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:NO];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];
    
    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:8];
    [carpool setOrigin:@"Los Angelas"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:NO];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];
    
    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:9];
    [carpool setOrigin:@"Cuba"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:NO];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];

    carpool=[[Carpool alloc]init];
    [carpool setCarpoolNum:10];
    [carpool setOrigin:@"Atlanta"];
    [carpool setDestination:@"Miami"];
    [carpool setDriver:@"James"];
    [carpool setCarAvailable:NO];
    [carpool setRoundTrip:NO];
    [carpool setDepartueDate:[mmddccyy dateFromString:@"03/21/2013"]];
    [carpool setBackDate:[mmddccyy dateFromString:@"03/22/2013"]];
    [carpool setSeatAvailable:4];
    [carpool setPrice:15];
    [carpool setNote:NULL];
    [carpoolSet addObject:carpool];
*/
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [carpoolSet count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CarpoolCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(nil == cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:@"CarpoolCell"];
        cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    Carpool *current=[carpoolSet objectAtIndex:indexPath.row];
    NSString *locations;
    if ([current roundTrip]) {
        locations=[[NSString alloc] initWithFormat:@"%@ tofrom %@",[current origin],[current destination]];
    }
    else {
        locations=[[NSString alloc] initWithFormat:@"%@ to %@",[current origin],[current destination]];
    }
    [cell.textLabel setText:locations];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString1 = [dateFormatter stringFromDate:[current departueDate]];
    NSString *dateString2;
    NSString *dateShow;
    if (current.roundTrip) {
        dateString2=[dateFormatter stringFromDate:[current backDate]];
        dateShow=[[NSString alloc] initWithFormat:@"%@ AND %@", dateString1,dateString2];
    }
    else {
        dateShow=[[NSString alloc] initWithFormat:@"%@", dateString1];
    }
    [cell.detailTextLabel setText:dateShow];
    
    return cell;

}

-(void)backToCarpoolTable {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

@end
