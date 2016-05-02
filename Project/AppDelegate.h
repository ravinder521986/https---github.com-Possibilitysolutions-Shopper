//
//  AppDelegate.h
//  Project
//
//  Created by MAC on 11/07/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "MainViewController.h"
#import "TranscationViewController.h"
#import "ShopViewController.h"
#import "MessageViewController.h"
#import "CartViewController.h"
#import "PaymentViewController.h"
#import "ShippingAddressViewController.h"
#import "ChooseShippingAddressViewController.h"
#import "OrderViewController.h"
#import "loginViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,ASIHTTPRequestDelegate, UITabBarControllerDelegate>{
    
    UINavigationController *navController;
    ASIFormDataRequest *serverRequest;
    NSString *urlType;
    NSString *requestType;
    NSString *urlstring;
    NSString *jsonString;
    
    UITabBarController *tabsController;
    UIView *spinerView;
    UIActivityIndicatorView *activityView;
    
}
-(void)showView;
-(void)hideView;


@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong)ASIFormDataRequest *serverRequest;
-(void)PostWebServer:(NSMutableDictionary *)dict type:(NSString *)webServive;
-(void)createTabbar;
@end

