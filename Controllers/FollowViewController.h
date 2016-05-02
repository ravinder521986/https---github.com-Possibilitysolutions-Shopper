//
//  FollowViewController.h
//  Project
//
//  Created by Possibility Solutions on 19/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@interface FollowViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate, UITextFieldDelegate>
{
    AppDelegate *delObj;
    UITextField *SearchTextfield;
    UITableView *FollowBusinessTbl;
}

@end
