//
//  OrderUserViewController.h
//  Project
//
//  Created by Possibility Solutions on 25/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SingleTonClass.h"
#import "ShippingMethodViewController.h"
@class AppDelegate;
@interface OrderUserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    AppDelegate *delObj;
    UITableView *ProductDetailTbl;
    NSMutableDictionary *FinalDict;
    
    SingleTonClass *single;
    
    UITextField *emailTextfield;
    UILabel *Dollerlbl;
    NSMutableDictionary *order_dict;

    
    
}
@property (nonatomic,strong) NSMutableDictionary *order_dict;

@end
