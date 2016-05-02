//
//  TranscationViewController.h
//  Payzi
//
//  Created by MAC on 24/02/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AsyncImageView.h"
#import "SingleTonClass.h"
#import "EditProfileViewController.h"
#import "FollowBusinessViewController.h"
#import "InviteFriendViewController.h"
#import "OrderViewController.h"
#import "ProductViewController.h"
@class AppDelegate;
@interface TranscationViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    UITableView *myTableView;
    CGRect screenBounds;
    UIImageView *navigationImage;
    UIButton *leftBtn;
    UIView *mainView;
    UIButton *slideBtn;
    UITableView *letfTableview;
    BOOL leftViewStatus;
    AppDelegate *delObj;
    NSMutableArray *transactionArray;
    
    UIButton *transBtn;
    UIButton *requestBtn;
    UIButton *myActivity;
    UIButton *firendActivity;
    UIButton *incomming;
    UIButton *outgoing;
    
    UILabel *changeStatus;
    UIImageView *statusImg;
    
    NSString *mainType;
    NSString *subType;
    UIImageView *activityImg;
    
    SingleTonClass *singleObj;
    
    UIButton *inviteBtn;
    UIImageView *transactionImg;
    
    
}

@end
