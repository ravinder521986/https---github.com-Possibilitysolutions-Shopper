//
//  ForgetPswrdViewController.h
//  Project
//
//  Created by Possibility Solutions on 02/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@interface ForgetPswrdViewController : UIViewController <UITextFieldDelegate>
{
    AppDelegate *delObj;
    UITextField *EmailTextfield;
    
    UIButton *SubmitBtn;

}
@end
