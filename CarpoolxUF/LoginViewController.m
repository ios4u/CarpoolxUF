//
//  LoginViewController.m
//  CarpoolxUF
//
//  Created by Wenting Zhao on 4/4/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import "LoginViewController.h"
#import "USERDB.h"

@interface LoginViewController () {
    NSDictionary * _newUser;
    USERDB * _userDB;
    NSArray * _userIDs;
}

@end

@implementation LoginViewController

@synthesize usernameTextField,passwordTextField;


//@synthesize passwordCheck,email,phone;
//@synthesize loginPicker,submitButton,hintLabel;

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
    passwordTextField.secureTextEntry=YES;
    
//    passwordCheck.secureTextEntry=YES;
//    [loginPicker addTarget:self
//	                     action:@selector(pickOne:)
//	           forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard:(id)sender {
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)backToLaunch:(id)sender {
    [self.loginDelegate backToLaunch];
}

- (IBAction)submitButton:(id)sender {
    
    if (!_userDB) _userDB = [[USERDB alloc] initWithUSERDBFilename:@"carpool.db"];    
    NSNumber * rowID = [_userDB valueFromQuery:@"SELECT userid FROM userinfo WHERE username =? AND password =?",usernameTextField.text,passwordTextField.text];
    NSLog(@"rowID is %@",rowID);
    
    if(rowID)
    {
        NSString *welcomeMessage=[[NSString alloc]initWithFormat:@"Welcome, %@",usernameTextField.text];
        UIAlertView *myAlert = [[UIAlertView alloc]
                                initWithTitle:@"Successfully Login!"
                                message:welcomeMessage
                                delegate:nil
                                cancelButtonTitle:@"Okay"
                                otherButtonTitles:nil];
        [myAlert show];
        
        [self.loginDelegate backToLaunch];

    }
    else {
        UIAlertView *myAlert = [[UIAlertView alloc]
                                initWithTitle:@"Something is wrong..."
                                message:@"Your username and/or password doesn't match!Please try again!"
                                delegate:nil
                                cancelButtonTitle:@"Okay"
                                otherButtonTitles:nil];
        [myAlert show];
        usernameTextField.text=Nil;
        passwordTextField.text=Nil;

    }
    
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    NSString *url = [NSString stringWithFormat:@"*.jsp?username=%@&password=%@",usernameTextField.text,passwordTextField.text];
//    [request setURL:[NSURL URLWithString:url]];
//    [request setHTTPMethod:@"GET"];
//    [request setTimeoutInterval:7.0];
//    NSURLResponse *response;
//    NSError *error;
//    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//    int statusCode = [httpResponse statusCode];
//    NSLog(@"The status code is %i",statusCode);
//    
//    if (statusCode==200) {
//        UIAlertView *myAlert = [[UIAlertView alloc]
//                                initWithTitle:@"Successful connection to Login!"
//                                message:@"You did it!!"
//                                delegate:nil
//                                cancelButtonTitle:@"Okay"
//                                otherButtonTitles:nil];
//        [myAlert show];
//
//    }
    
}

//- (IBAction)pickOne:(id)sender {
//    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
//    [submitButton setTitle:[segmentedControl titleForSegmentAtIndex: [segmentedControl selectedSegmentIndex]] forState:UIControlStateNormal];
//}
@end
