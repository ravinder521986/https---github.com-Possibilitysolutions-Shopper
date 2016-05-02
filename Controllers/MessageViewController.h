//
//  MessageViewController.h
//  Project
//
//  Created by Possibility Solutions on 03/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PaymentViewController.h"
#import "AppDelegate.h"
@class AppDelegate;
@interface MessageViewController : UIViewController <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    AppDelegate *delObj;
    UIView *mainView;
    NSMutableDictionary *FinalDict;
    
    UITextField *FirstNameTxt,*CreditCardNoTxt,*YearTxt,*CountryTxt,*StateTxt,*LastNameTxt,*CityTxt,*CodeTxt,*AddLineTxt,*AddLine2Txt,*TelephoneTxt;
    
    
    
    CGRect pickerFrame;
    CGRect toolbarFrame ;
    CGRect frame;
    UIView *subView;
    BOOL Count;
    UIPickerView *picker;
    UIDatePicker *datePicker;
    NSMutableArray *CountryArray;
    NSMutableArray *StateArray;
    NSMutableArray *CityArray;

    NSString *StrValue;
    
    UIButton *CountryBtn;
    UIButton *StateBtn;
    UIButton *CityBtn;
    
    
    UIButton *AddToCartBtn;
    
    
}
@property (strong, nonatomic) NSMutableDictionary *FinalDict;
@property (strong, nonatomic)  NSString *StrValue;


@end
