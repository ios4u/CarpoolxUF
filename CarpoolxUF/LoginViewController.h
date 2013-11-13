//
//  LoginViewController.h
//  CarpoolxUF
//
//  Created by Wenting Zhao on 4/4/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "USERDB.h"

@protocol LoginViewControllerDelegate <NSObject>

-(void)backToLaunch;

@end

@interface LoginViewController : UIViewController  <UITextFieldDelegate> {
    id loginDelegate;
} 

@property (nonatomic,strong) id<LoginViewControllerDelegate> loginDelegate;

//@property (weak, nonatomic) IBOutlet UISegmentedControl *loginPicker;
//@property (weak, nonatomic) IBOutlet UIButton *submitButton;

//@property (weak, nonatomic) IBOutlet UILabel *hintLabel;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
//@property (weak, nonatomic) IBOutlet UITextField *passwordCheck;
//@property (weak, nonatomic) IBOutlet UITextField *email;
//@property (weak, nonatomic) IBOutlet UITextField *phone;

- (IBAction)backToLaunch:(id)sender;
- (IBAction)submitButton:(id)sender;
//- (IBAction)pickOne:(id)sender;

@end
