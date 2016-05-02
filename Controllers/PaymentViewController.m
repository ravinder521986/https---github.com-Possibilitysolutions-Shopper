//
//  PaymentViewController.m
//  Project
//
//  Created by Possibility Solutions on 01/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    countries=[[NSMutableArray alloc]init];
    [countries addObject:@"SELECT PAYMENT MATHOD"];
    [countries addObject:@"ADD PAYMENT MATHOD"];
    
    
    transactionTbl=[[UITableView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-320)/2, 64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    transactionTbl.showsVerticalScrollIndicator=YES;
    transactionTbl.showsHorizontalScrollIndicator=NO;
    transactionTbl.showsVerticalScrollIndicator=NO;
    transactionTbl.delegate=self;
    transactionTbl.dataSource=self;
    [transactionTbl setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:transactionTbl];

    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 150;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,250)];
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake((self.view.frame.size.width-320)/2,5, 640/2, 77/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        [headerView addSubview:FormaIcon];

        UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,15, 100, 30)];
        Websitelbl.font = [UIFont fontWithName:@"Arial" size:13];
        Websitelbl.text=@"SELECT PAYMENT MATHOD";
        Websitelbl.textAlignment=NSTextAlignmentCenter;
        Websitelbl.textColor=[UIColor whiteColor];
        Websitelbl.numberOfLines = 1;
        [Websitelbl sizeToFit];
        [headerView addSubview:Websitelbl];
        
         return headerView;
    }
    else{
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,250)];
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake((self.view.frame.size.width-320)/2,5, 640/2, 77/2);
        [FormaIcon setBackgroundColor:[UIColor greenColor]];
        [headerView addSubview:FormaIcon];
        
        UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,15, 100, 30)];
        Websitelbl.font = [UIFont fontWithName:@"Arial" size:13];
        Websitelbl.text=@"ADD PAYMENT MATHOD";
        Websitelbl.textAlignment=NSTextAlignmentCenter;
        Websitelbl.textColor=[UIColor whiteColor];
        Websitelbl.numberOfLines = 1;
        [Websitelbl sizeToFit];
        [headerView addSubview:Websitelbl];
        
        
        return headerView;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    
    if (indexPath.section==0) {
        
        UIImageView *PaypalImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paypal@2x.png"]];
        PaypalImg.frame=CGRectMake((self.view.frame.size.width-320)/2,0, 184/2, 48/2);
        [PaypalImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:PaypalImg];
        
        UIImageView *MasterCardImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MasterCard@2x.png"]];
        MasterCardImg.frame=CGRectMake((self.view.frame.size.width-320)/2,30, 135/2, 85/2);
        [MasterCardImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:MasterCardImg];
        
        UIImageView *VisaImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"visa.png"]];
        VisaImg.frame=CGRectMake((self.view.frame.size.width-320)/2,80, 135/2, 85/2);
        [VisaImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:VisaImg];
        

       
    }
    else{
        
        
        UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,5, 100, 35)];
        Websitelbl.font = [UIFont fontWithName:@"Arial" size:13];
        Websitelbl.text=@"add credit card";
        Websitelbl.textAlignment=NSTextAlignmentCenter;
        Websitelbl.textColor=[UIColor whiteColor];
        Websitelbl.numberOfLines = 1;
        [Websitelbl sizeToFit];
        [cell.contentView addSubview:Websitelbl];
    }
    
    
   return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
