//
//  PostCarpoolViewController.h
//  CarpoolApp
//
//  Created by Wenting Zhao on 3/20/13.
//  Copyright (c) 2013 Wenting Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCarpoolViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *originPickerView;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
//{
//@private
//    UITableViewStyle _tableViewStyle;
//    id               _keyboardSupport;
//    id               _staticDataSource;
//    struct {
//        int clearsSelectionOnViewWillAppear:1;
//        int insetsApplied:1;
//        int adjustingInsets:1;
//    } _tableViewControllerFlags;
//}

//@property(nonatomic,retain) UITableView *tableView;
//@property(nonatomic) BOOL clearsSelectionOnViewWillAppear NS_AVAILABLE_IOS(3_2); // defaults to YES. If YES, any selection is cleared in viewWillAppear:
//
//@property (nonatomic,retain) UIRefreshControl *refreshControl NS_AVAILABLE_IOS(6_0);

@end
