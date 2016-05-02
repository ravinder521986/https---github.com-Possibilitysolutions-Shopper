//
//  loginViewController.h
//  Payzi
//
//  Created by MAC on 19/02/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "AppDelegate.h"
#import "ForgetPswrdViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"

@class AppDelegate;
@interface loginViewController : UIViewController<UITextFieldDelegate,ASIHTTPRequestDelegate>{
    
    
   
    
    UITextField *emailTextfield;
    UITextField *passwordTextfield;
    NSString *urlstring;
    AppDelegate *delObj;
    
    UIButton *SubmitBtn;
}

@end
