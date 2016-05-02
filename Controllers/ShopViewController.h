//
//  ShopViewController.h
//  Project
//
//  Created by Possibility Solutions on 03/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ProductViewController.h"
@class AppDelegate;

@interface ShopViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    
    AppDelegate *delObj;
    
    UITableView *transactionTbl;
    UIImageView *passImg;
    
    UIButton *WomenBtn;
    UIButton *MenBtn;
    UIButton *KidBtn;
    UIButton *CanadaBtn;
    UIButton *USABtn;
    UIButton *WorldBtn;
    UIButton *AllBtn;
    UIButton *ClothBtn;
    UIButton *ElectronicBtn;

    NSMutableDictionary *FirstDict;
    NSMutableArray *ShopArray;
    NSString *StrValue;
    NSInteger *Value;
    
    NSString *valueType;
    
}
@property (nonatomic, strong) NSString *StrValue;
@end
