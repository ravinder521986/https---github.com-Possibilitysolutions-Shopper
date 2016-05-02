//
//  ProductDetailViewController.h
//  Project
//
//  Created by Possibility Solutions on 17/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AsyncImageView.h"
#import "OrderUserViewController.h"
#import "SingleTonClass.h"
@class AppDelegate;
@interface ProductDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate>
{
    AppDelegate *delObj;
    UITableView *ProductDetailTbl;
    NSMutableDictionary *FinalDict;
    NSString *product_id;
    NSString *StrValue;
    
    UILabel  *colorlbl;
    NSMutableArray *SizeArray;
    CGRect pickerFrame;
    CGRect toolbarFrame ;
    CGRect frame;
    UIView *subView;
    BOOL Count;
    UIPickerView *picker;
    
    UIButton *SizeIconBtn;
    UILabel *Sizelbl;
    NSInteger selectedImage;
    
    UIView *mainView;
    NSMutableArray *ColorArray;
    NSMutableDictionary *order_dict;
    
    
   
    
    
}
@property (nonatomic,strong) NSString *product_id;
@property (nonatomic,strong) NSMutableDictionary *order_dict;

@end

