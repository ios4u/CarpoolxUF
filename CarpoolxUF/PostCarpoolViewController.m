//
//  PostCarpoolViewController.m
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "PostCarpoolViewController.h"
#define kPickerAnimationDuration 0.40

@interface PostCarpoolViewController ()

@end

#pragma mark -

@implementation PostCarpoolViewController

@synthesize originPickerView,doneButton,saveButton;

static NSArray *cities;

- (void)viewDidLoad
{
    [super viewDidLoad];
    cities=[[NSArray alloc]initWithObjects:@"Orlando",@"Gainesville",@"Miami",@"KeyWest",@"Tampa",@"Jacksonville", nil];
    doneButton.title=@"Save";
    self.navigationItem.rightBarButtonItem = saveButton;

//    NSLog(@"The city array is %@",cities);
}

#pragma mark - UITableViewDataSource

//section0 (BasicInfo): i'm a driver; car available; seat available
//section1 (DepatureInfo): From; To; Departure Date
//section2 (BackInfo):

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 3;
            break;
        default:
            return 1;
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"Driving Info";
            break;
        case 1:
            return @"Departure Info";
            break;
        default:
            return @"Back Info";
            break;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCustomCellID = @"MessageCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomCellID];
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MessageCell"];
//    }
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(110, 10, 185, 30)];
    textField.clearsOnBeginEditing = NO;
    textField.textAlignment = NSTextAlignmentRight;
    textField.delegate = self;
    
    
    if(indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
                [cell.textLabel setText:@"I'm a "];
                [textField setText:@"driver"];
                [cell.contentView addSubview:textField];
                break;
            case 1:
                [cell.textLabel setText:@"Car Available"];
                [textField setText:@"YES"];
                [cell.contentView addSubview:textField];
                break;
            case 2:
                [cell.textLabel setText:@"Seat Available"];
                [textField setText:@"3"];
                [cell.contentView addSubview:textField];
            default:
                break;
        }
        
    }
    else if (indexPath.section==1) {
        if(indexPath.row==0){
            cell.selectionStyle= UITableViewCellSelectionStyleNone;
            
            [cell.textLabel setText:@"Origin Location:"];
            [cell.contentView addSubview:textField];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            cell.detailTextLabel.backgroundColor = [UIColor clearColor];
            
            textField.tag=0;
            originPickerView.delegate = self;
            originPickerView.autoresizingMask=UIViewAutoresizingFlexibleWidth;
            originPickerView.showsSelectionIndicator=YES;
            textField.inputView  = originPickerView;
            self.navigationItem.rightBarButtonItem = self.doneButton;

        }
        else if(indexPath.row==1) {
            [cell.textLabel setText:@"Destination Location:"];
            [cell.detailTextLabel setText:@" "];}
        else {
            [cell.textLabel setText:@"Departure Date:"];
            [cell.detailTextLabel setText:@"Mar 12, 2013"];
        }
        
    }
    else {
        [cell.textLabel setText:@"Back Date:"];
        [cell.detailTextLabel setText:@"Mar 14, 2013"];
    }
    [cell.detailTextLabel setHidden:FALSE];
    
    return cell;
}

#pragma mark - UITableViewDelegate


#pragma mark - Actions

- (IBAction)doneAction:(id)sender {
    CGRect pickerFrame = self.originPickerView.frame;
    pickerFrame.origin.y = self.view.frame.size.height;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:kPickerAnimationDuration];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(slideDownDidStop)];
    self.originPickerView.frame = pickerFrame;
    [UIView commitAnimations];
    
	// remove the "Done" button in the nav bar
    doneButton.enabled=FALSE;
    saveButton.enabled=TRUE;
	self.navigationItem.rightBarButtonItem = saveButton;
    
    UIAlertView *myAlert = [[UIAlertView alloc]
                            initWithTitle:@"Post Message!"
                            message:@"You have successfully post a carpool message! It will be shown in a few minutes!"
                            delegate:nil
                            cancelButtonTitle:@"Okay"
                            otherButtonTitles:nil];
    [myAlert show];

    
	
	// deselect the current table row
//	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)locationAction:(id)sender
{

}

- (void)slideDownDidStop
{
	// the date picker has finished sliding downwards, so remove it from the view hierarchy
	[self.originPickerView removeFromSuperview];
}


#pragma mark - PickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [cities count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [cities objectAtIndex:row];
    
}




@end
