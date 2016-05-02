//
//  ChooseShippingAddressViewController.h
//  Project
//
//  Created by Possibility Solutions on 04/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//
#import "AppDelegate.h"
@class AppDelegate;
@interface ChooseShippingAddressViewController : UIViewController <UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    AppDelegate *delObj;
    UIView *mainView;
    UITableView *ProductDetailTbl;
}
@end
