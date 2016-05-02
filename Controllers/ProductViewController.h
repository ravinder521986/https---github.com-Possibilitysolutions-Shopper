//
//  ProductViewController.h
//  Project
//
//  Created by Possibility Solutions on 13/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailViewController.h"
#import "AppDelegate.h"
#import "AsyncImageView.h"
#import "SearchCategoryViewController.h"
@class AppDelegate;
@interface ProductViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>
{
    
    UITableView *transactionTbl;
     AppDelegate *delObj;
    NSMutableArray *ProductArray;
    
    UIView *mainView;
    UIButton *AddItemBtn;
    NSInteger *selectedBox;
    
    UILabel *lbl;
    UILabel *lbl1;
    UILabel *lbl2;
    
    UIButton *CancelBtn;
    
    
    NSMutableArray *SizeArray;
    UIButton *btnValue;
    UIButton *CityBtn;
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
    
    UILabel *Sizelbl;
    UILabel *colorlbl;
    NSInteger TagValue;
    NSString *store_id;
    NSString *store_name;
    

}
@property (strong, nonatomic) NSString *StrValue;
@property (nonatomic,strong)  NSString *store_id;
@property (nonatomic,strong)  NSString *store_name;


@end



