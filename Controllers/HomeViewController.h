//
//  HomeViewController.h
//  Project
//
//  Created by Possibility Solutions on 03/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@interface HomeViewController : UIViewController <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    AppDelegate *delObj;
    UIView *mainView;
    UIButton *AddItemBtn;
    NSMutableDictionary *FinalDict;
    
    UITextField *StoreNameTxt,*StoreWebsiteTxt,*ProductNameTxt,*ProductTxt,*ColourTxt,*SizeTxt,*AddProductTxt,*PriceTxt,*SpecialTxt;
    UIButton *btnValue;
    UIButton *CityBtn;
    
    
    
    NSMutableArray *SizeArray;
    CGRect pickerFrame;
    CGRect toolbarFrame ;
    CGRect frame;
    UIView *subView;
    BOOL Count;
    UIPickerView *picker;
    NSMutableArray *ColorArray;
    NSString *StrValue;
    
    
    UIButton *SizeIconBtn;
    UIButton *ColorIconBtn;
    UIButton *AddToCartBtn;
    
    
}
@property (strong, nonatomic) NSMutableDictionary *FinalDict;
@property (strong, nonatomic)  NSString *StrValue;


@end
