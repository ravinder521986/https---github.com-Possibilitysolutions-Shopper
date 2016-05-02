//
//  EditProfileViewController.h
//  Project
//
//  Created by Possibility Solutions on 16/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NSData+Base64.h"
@class AppDelegate;
@interface EditProfileViewController : UIViewController<UIApplicationDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    
    UITextField *firstNameTextfield;
    UITextField *lastNameTextfield;
    UITextField *emailTextfield;
    UITextField *usernameTextfield;
    UITextField *phoneTextfield;
    UITextField *birthdayTextfied;
    UITextField *WebsiteTextfield;
    UITextField *BioTextfield;

    UIImageView *profilePic;
    CGRect toolbarFrame ;
    CGRect pickerFrame;
    CGRect frame;
    UIView *subView;
    BOOL Count;
    UIButton*btn;
    NSString *typeValue;
    UIPickerView *picker;
    UIDatePicker *datePicker;
    AppDelegate *delObj;
    
    UIImagePickerController *imagepicker;
    BOOL IsYes;
    UIImage *imageToSave;
    
}

@end
