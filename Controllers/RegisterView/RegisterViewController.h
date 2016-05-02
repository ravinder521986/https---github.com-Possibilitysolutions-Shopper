//
//  RegisterViewController.h
//  Payzi
//
//  Created by MAC on 19/02/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "AppDelegate.h"
#import "NSData+Base64.h"
@class AppDelegate;
@interface RegisterViewController : UIViewController<UITextFieldDelegate,ASIHTTPRequestDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    
 
    UITextField *emailTextfield;
    UITextField *usernameTextfield;
    UITextField *passwordTextfield;
    UITextField *birthdayTextfied;
    
    UIImageView *profilePic;
    NSString *urlstring;
    CGRect toolbarFrame ;
    CGRect pickerFrame;
    CGRect frame;
    UIView *subView;
    BOOL Count;
    UIButton*btn;
    NSString *typeValue;
    UIPickerView *picker;
    NSMutableArray *genderArray;
    UIDatePicker *datePicker;
    AppDelegate *delObj;
    
    UIImagePickerController *imagepicker;
    BOOL IsYes;
    UIImage *imageToSave;
    NSString *deviceType;
    UIButton *SubmitBtn;
}

@end
