//
//  FilterViewController.h
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FilterViewControllerDelegate <NSObject>

-(void)backToCarpoolTable;

@end

@interface FilterViewController : UIViewController <UITextFieldDelegate> {
    id filterDelegate;
}

@property (nonatomic,strong) id<FilterViewControllerDelegate> filterDelegate;


@property (weak, nonatomic) IBOutlet UITextField *fromTextField;

@property (weak, nonatomic) IBOutlet UITextField *toTextField;

- (IBAction)backToCarpoolTable:(id)sender;

- (IBAction)searchFilter:(id)sender;


@end

