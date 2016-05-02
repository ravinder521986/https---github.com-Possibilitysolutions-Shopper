//
//  PaymentViewController.h
//  Project
//
//  Created by Possibility Solutions on 01/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
    UITableView *transactionTbl;
    NSMutableArray *countries;
}
@end
