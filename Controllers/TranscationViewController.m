//
//  TranscationViewController.m
//  Payzi
//
//  Created by MAC on 24/02/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "TranscationViewController.h"

@interface TranscationViewController ()

@end

@implementation TranscationViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
    mainType=@"1";
    subType=@"1";
    
    
    
    self.navigationController.navigationBar.hidden=YES;
    
    transactionArray=[[[NSMutableArray alloc] init] mutableCopy];
  
    delObj = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    leftViewStatus=NO;
    
    screenBounds = [[UIScreen mainScreen] bounds];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.hidesBackButton = YES;
    
    UIImageView  *leftTableImage=[[UIImageView alloc] init];
    [leftTableImage setImage:[UIImage imageNamed:@"left_header.png"]];
    leftTableImage.frame=CGRectMake(0, 0, 320, 64);
    leftTableImage.userInteractionEnabled=YES;
    [self.view addSubview:leftTableImage];
    
    UIImageView *logo1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btru-logo.png"]];
    logo1.frame=CGRectMake(20, 15, 45, 45);
    [leftTableImage addSubview:logo1];
    
    
    
    
    
    letfTableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-50, self.view.frame.size.height) style:UITableViewStylePlain];
    letfTableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    letfTableview.backgroundColor=[UIColor whiteColor];
    letfTableview.showsHorizontalScrollIndicator=NO;
    letfTableview.showsVerticalScrollIndicator=NO;
    letfTableview.delegate=self;
    letfTableview.dataSource=self;
    
    [self.view addSubview:letfTableview];
    
    mainView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mainView];
    mainView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:243.0/255.0 alpha:1.0];
    [self.view bringSubviewToFront:mainView];
    
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIView *customView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.adjustsImageWhenHighlighted=NO;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"menu-icon.png"] forState:UIControlStateNormal];
    leftBtn.frame=CGRectMake(10, 35, 34/2, 31/2);
    [leftBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:leftBtn];
    
    UIButton *plusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    plusBtn.adjustsImageWhenHighlighted=NO;
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"plus@2x.png"] forState:UIControlStateNormal];
    plusBtn.frame=CGRectMake(self.view.frame.size.width-50, 35, 34/2, 31/2);
    [plusBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:plusBtn];
    
    
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.adjustsImageWhenHighlighted=NO;
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search@2x.png"] forState:UIControlStateNormal];
    searchBtn.frame=CGRectMake(self.view.frame.size.width-20, 35, 30/2, 30/2);
    [searchBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:searchBtn];
    

    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"ACTIVITY";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [mainView addSubview:customView1];
    
    
    
    
    myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height-200) style:UITableViewStylePlain];
    myTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    myTableView.showsHorizontalScrollIndicator=NO;
    myTableView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:243.0/255.0 alpha:1.0];
    myTableView.showsVerticalScrollIndicator=NO;
    
    [mainView addSubview:myTableView];
    
    
    transactionImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Segmented_1@2x.png"]];
    transactionImg.frame=CGRectMake((self.view.frame.size.width-295)/2, 80, 295, 35);
    transactionImg.userInteractionEnabled=YES;
    [mainView addSubview:transactionImg];
    
    transBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    transBtn.frame=CGRectMake(0, 0, 150, 33);
    [transBtn addTarget:self action:@selector(transaction) forControlEvents:UIControlEventTouchUpInside];
    [transactionImg addSubview:transBtn];
    
    
    
    requestBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    requestBtn.frame=CGRectMake(152, 0, 150, 33);
    [requestBtn addTarget:self action:@selector(request) forControlEvents:UIControlEventTouchUpInside];
    [transactionImg addSubview:requestBtn];
    
    
    
    
    
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    
    [self leffsideView];
    
//    [self getpaymentList];
    
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{

    
    
    if(leftViewStatus==NO){
        
        [self leftSlider];

    }
    
    
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    //Do what you want here

    
    
    if(leftViewStatus==YES){
        
        [self leftSlider];
        
    }

    
}




-(void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    

}

-(void)leffsideView{
    
    
   
    
    if (self.view.frame.size.height>568) {
        
        
        [activityImg removeFromSuperview];
        activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myselected_iphone.png"]];
        activityImg.frame=CGRectMake((self.view.frame.size.width-270)/2, 130, 270, 30);
        activityImg.userInteractionEnabled=YES;
        [mainView addSubview:activityImg];
        
        myActivity=[UIButton buttonWithType:UIButtonTypeCustom];
        myActivity.frame=CGRectMake(0,2, 160, 25);
        [myActivity addTarget:self action:@selector(myActivity) forControlEvents:UIControlEventTouchUpInside];
        
        [activityImg addSubview:myActivity];
        
        firendActivity=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        firendActivity.frame=CGRectMake((self.view.frame.size.width-225),2, 120, 25);
        [firendActivity addTarget:self action:@selector(friendActivity) forControlEvents:UIControlEventTouchUpInside];
        
        [activityImg addSubview:firendActivity];
        

       
        
        
    }
    else{
        
        [activityImg removeFromSuperview];
        activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myselected.png"]];
        activityImg.frame=CGRectMake((self.view.frame.size.width-198)/2, 130, 198, 22.5);
        activityImg.userInteractionEnabled=YES;
        [mainView addSubview:activityImg];
        
        myActivity=[UIButton buttonWithType:UIButtonTypeCustom];
        myActivity.frame=CGRectMake(0,2, 120, 25);
        [myActivity addTarget:self action:@selector(myActivity) forControlEvents:UIControlEventTouchUpInside];
        
        [activityImg addSubview:myActivity];
        
        firendActivity=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        firendActivity.frame=CGRectMake(122,2, 120, 25);
        [firendActivity addTarget:self action:@selector(friendActivity) forControlEvents:UIControlEventTouchUpInside];
        
        [activityImg addSubview:firendActivity];
        

    }
    
}
-(void)leffsideViewFriend{
    
    
    [activityImg removeFromSuperview];
    activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"friendselected.png"]];
    activityImg.frame=CGRectMake((self.view.frame.size.width-198)/2, 130, 198, 22.5);
    activityImg.userInteractionEnabled=YES;
    [mainView addSubview:activityImg];
    
    myActivity=[UIButton buttonWithType:UIButtonTypeCustom];
    myActivity.frame=CGRectMake(0,2, 120, 25);
    [activityImg addSubview:myActivity];
    
    firendActivity=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    firendActivity.frame=CGRectMake(122,2, 120, 25);
    firendActivity.titleLabel.textColor=[UIColor colorWithRed:22.0/255.0 green:166.0/255.0 blue:159.0/255.0 alpha:1.0];
    [activityImg addSubview:firendActivity];
    
    
}




-(void)rightSideView{
    
    
    
    if (self.view.frame.size.height>568) {

    
    [activityImg removeFromSuperview];
    activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"outgoing_iphone.png"]];
    activityImg.frame=CGRectMake((self.view.frame.size.width-270)/2, 130, 270, 30);
    activityImg.userInteractionEnabled=YES;
    [mainView addSubview:activityImg];
    
   
    
    outgoing=[UIButton buttonWithType:UIButtonTypeCustom];
    outgoing.frame=CGRectMake(0,2, 120, 25);
    [outgoing addTarget:self action:@selector(outgoing) forControlEvents:UIControlEventTouchUpInside];
    [activityImg addSubview:outgoing];
    
    incomming=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    incomming.frame=CGRectMake(122,2, 120, 25);
    [incomming addTarget:self action:@selector(incoming) forControlEvents:UIControlEventTouchUpInside];
    [activityImg addSubview:incomming];
    }
    else{
        
        
        [activityImg removeFromSuperview];
        activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"outgoing.png"]];
        activityImg.frame=CGRectMake((self.view.frame.size.width-240)/2, 130, 240, 22.5);
        activityImg.userInteractionEnabled=YES;
        [mainView addSubview:activityImg];
        
        
        
        outgoing=[UIButton buttonWithType:UIButtonTypeCustom];
        outgoing.frame=CGRectMake(0,2, 120, 25);
        [outgoing addTarget:self action:@selector(outgoing) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:outgoing];
        
        incomming=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        incomming.frame=CGRectMake(122,2, 120, 25);
        [incomming addTarget:self action:@selector(incoming) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:incomming];
        
        
        
    }
    
    

}

-(void)transaction{
    
    changeStatus.text=@"My Transaction";
    mainType=@"1";
    
    
    [transactionImg removeFromSuperview];
    transactionImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"transaction-selected.png"]];
    transactionImg.frame=CGRectMake((self.view.frame.size.width-295)/2, 80, 295, 35);
    transactionImg.userInteractionEnabled=YES;
    [mainView addSubview:transactionImg];
    
    transBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    transBtn.frame=CGRectMake(0, 0, 150, 33);
    [transBtn addTarget:self action:@selector(transaction) forControlEvents:UIControlEventTouchUpInside];
    [transactionImg addSubview:transBtn];
    
    
    
    requestBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    requestBtn.frame=CGRectMake(152, 0, 150, 33);
    [requestBtn addTarget:self action:@selector(request) forControlEvents:UIControlEventTouchUpInside];
    [transactionImg addSubview:requestBtn];
    

    
    [self leffsideView];
    
    
    
}



-(void)request{
    
    ProductViewController *ProductView=[[ProductViewController alloc]init];
    [self.navigationController pushViewController:ProductView animated:YES];
    
    mainType=@"2";
    subType=@"1";
    
    [transactionImg removeFromSuperview];
    transactionImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"request-selecteed.png"]];
    transactionImg.frame=CGRectMake((self.view.frame.size.width-295)/2, 80, 295, 35);
    transactionImg.userInteractionEnabled=YES;
    [mainView addSubview:transactionImg];
    
    transBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    transBtn.frame=CGRectMake(0, 0, 150, 33);
    [transBtn addTarget:self action:@selector(transaction) forControlEvents:UIControlEventTouchUpInside];
    [transactionImg addSubview:transBtn];
    
    
    
    requestBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    requestBtn.frame=CGRectMake(152, 0, 150, 33);
    [requestBtn addTarget:self action:@selector(request) forControlEvents:UIControlEventTouchUpInside];
    [transactionImg addSubview:requestBtn];
    

    
    [self rightSideView];
    
    
    
    
    //
}

-(void)outgoing{
    
    
    if ([mainType isEqualToString:@"1"]) {
        ;
    }
    else{
        
        
        subType=@"1";
        
        
        if (self.view.frame.size.width>320) {
            
            [activityImg removeFromSuperview];
            activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"outgoing_iphone.png"]];
            activityImg.frame=CGRectMake((self.view.frame.size.width-270)/2, 130, 270, 30);
            activityImg.userInteractionEnabled=YES;
            [mainView addSubview:activityImg];
            
            
            
            outgoing=[UIButton buttonWithType:UIButtonTypeCustom];
            outgoing.frame=CGRectMake(0,2, 120, 25);
            [outgoing addTarget:self action:@selector(outgoing) forControlEvents:UIControlEventTouchUpInside];
            [activityImg addSubview:outgoing];
            
            incomming=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            incomming.frame=CGRectMake(122,2, 120, 25);
            [incomming addTarget:self action:@selector(incoming) forControlEvents:UIControlEventTouchUpInside];
            [activityImg addSubview:incomming];
            

            
        }
        else{
            
            [activityImg removeFromSuperview];
            activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"outgoing.png"]];
            activityImg.frame=CGRectMake((self.view.frame.size.width-240)/2, 130, 240, 22.5);
            activityImg.userInteractionEnabled=YES;
            [mainView addSubview:activityImg];
            
            
            
            outgoing=[UIButton buttonWithType:UIButtonTypeCustom];
            outgoing.frame=CGRectMake(0,2, 120, 25);
            [outgoing addTarget:self action:@selector(outgoing) forControlEvents:UIControlEventTouchUpInside];
            [activityImg addSubview:outgoing];
            
            incomming=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            incomming.frame=CGRectMake(122,2, 120, 25);
            [incomming addTarget:self action:@selector(incoming) forControlEvents:UIControlEventTouchUpInside];
            [activityImg addSubview:incomming];
            

        }
        
        
    }
    
    
}

-(void)incoming{
    
    if ([mainType isEqualToString:@"1"]) {
        ;
    }
    else{
        subType=@"2";
        
       
        if (self.view.frame.size.width>320) {
            
            [activityImg removeFromSuperview];
            activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"incoming_iphone.png"]];
            activityImg.frame=CGRectMake((self.view.frame.size.width-270)/2, 130, 270, 30);
            activityImg.userInteractionEnabled=YES;
            [mainView addSubview:activityImg];
            
            
            
            outgoing=[UIButton buttonWithType:UIButtonTypeCustom];
            outgoing.frame=CGRectMake(0,2, 120, 25);
            [outgoing addTarget:self action:@selector(outgoing) forControlEvents:UIControlEventTouchUpInside];
            [activityImg addSubview:outgoing];
            
            incomming=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            incomming.frame=CGRectMake(122,2, 120, 25);
            [incomming addTarget:self action:@selector(incoming) forControlEvents:UIControlEventTouchUpInside];
            [activityImg addSubview:incomming];
            

        }
        else{
            
            [activityImg removeFromSuperview];
            activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"incoming.png"]];
            activityImg.frame=CGRectMake((self.view.frame.size.width-240)/2, 130, 240, 22.5);
            activityImg.userInteractionEnabled=YES;
            [mainView addSubview:activityImg];
            
            
            
            outgoing=[UIButton buttonWithType:UIButtonTypeCustom];
            outgoing.frame=CGRectMake(0,2, 120, 25);
            [outgoing addTarget:self action:@selector(outgoing) forControlEvents:UIControlEventTouchUpInside];
            [activityImg addSubview:outgoing];
            
            incomming=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            incomming.frame=CGRectMake(122,2, 120, 25);
            [incomming addTarget:self action:@selector(incoming) forControlEvents:UIControlEventTouchUpInside];
            [activityImg addSubview:incomming];
            

        }
        
        
        
    }

    
    
    
}


-(void)friendActivity{
    
    
    mainType=@"1";
    
    subType=@"2";
    
    if (self.view.frame.size.width>320) {
        
        [activityImg removeFromSuperview];
        activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"friendselected_iphone.png"]];
        activityImg.frame=CGRectMake((self.view.frame.size.width-270)/2, 130, 270, 30);
        activityImg.userInteractionEnabled=YES;
        [mainView addSubview:activityImg];
        
        
        
        myActivity=[UIButton buttonWithType:UIButtonTypeCustom];
        myActivity.frame=CGRectMake(0,2, 120, 25);
        [myActivity addTarget:self action:@selector(myActivity) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:myActivity];
        
        firendActivity=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        firendActivity.frame=CGRectMake(122,2, 120, 25);
        [firendActivity addTarget:self action:@selector(friendActivity) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:firendActivity];
        

    }
    else{
        
        [activityImg removeFromSuperview];
        activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"friendselected.png"]];
        activityImg.frame=CGRectMake((self.view.frame.size.width-198)/2, 130, 198, 22.5);
        activityImg.userInteractionEnabled=YES;
        [mainView addSubview:activityImg];
        
        
        
        myActivity=[UIButton buttonWithType:UIButtonTypeCustom];
        myActivity.frame=CGRectMake(0,2, 120, 25);
        [myActivity addTarget:self action:@selector(myActivity) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:myActivity];
        
        firendActivity=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        firendActivity.frame=CGRectMake(122,2, 120, 25);
        [firendActivity addTarget:self action:@selector(friendActivity) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:firendActivity];
        

    }
    
    
}


-(void)myActivity{
    
    
    mainType=@"1";
    
    subType=@"1";
    
   
    
    if (self.view.frame.size.width>320) {
        
        [activityImg removeFromSuperview];
        activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myselected_iphone.png"]];
        activityImg.frame=CGRectMake((self.view.frame.size.width-270)/2, 130, 270, 30);
        activityImg.userInteractionEnabled=YES;
        [mainView addSubview:activityImg];
        
        
        
        myActivity=[UIButton buttonWithType:UIButtonTypeCustom];
        myActivity.frame=CGRectMake(0,2, 120, 25);
        [myActivity addTarget:self action:@selector(myActivity) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:myActivity];
        
        firendActivity=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        firendActivity.frame=CGRectMake(122,2, 120, 25);
        [firendActivity addTarget:self action:@selector(friendActivity) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:firendActivity];
        

    }
    else{
        
        [activityImg removeFromSuperview];
        activityImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myselected.png"]];
        activityImg.frame=CGRectMake((self.view.frame.size.width-198)/2, 130, 198, 22.5);
        activityImg.userInteractionEnabled=YES;
        [mainView addSubview:activityImg];
        
        
        
        myActivity=[UIButton buttonWithType:UIButtonTypeCustom];
        myActivity.frame=CGRectMake(0,2, 120, 25);
        [myActivity addTarget:self action:@selector(myActivity) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:myActivity];
        
        firendActivity=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        firendActivity.frame=CGRectMake(122,2, 120, 25);
        [firendActivity addTarget:self action:@selector(friendActivity) forControlEvents:UIControlEventTouchUpInside];
        [activityImg addSubview:firendActivity];
        

    }
    
    
    
    
    
    
}







- (void)requestFinished:(ASIHTTPRequest *)request{
    
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:nil];
    transactionArray=[[dict valueForKey:@"result"] mutableCopy];
    NSLog(@"transactionArray----%@",transactionArray);
    
    if (transactionArray == (id)[NSNull null] || [transactionArray count]==0){
        NSLog(@"array is empty");

        transactionArray=nil;
    }
    else{
        
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"transactionDate" ascending:NO];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        [transactionArray sortUsingDescriptors:sortDescriptors];
    }

    myTableView.dataSource=self;
    myTableView.delegate=self;
    [myTableView reloadData];

    
    
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    
   

}



-(void)leftSlider
{
    

    
    if(leftViewStatus==NO){

        
        [UIView animateWithDuration:0.30 delay:0.0 options: UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            
            leftViewStatus = YES;
            myTableView.userInteractionEnabled=NO;
            mainView.frame=CGRectMake(self.view.frame.size.width-50, 0, 100, self.view.frame.size.height);
            [letfTableview reloadData];
            
            self.tabBarController.tabBar.hidden = YES;

        

        }
                         completion:^(BOOL finished){
                             
                         }];
    }
    else{
        
        

        [UIView animateWithDuration:0.30 delay:0.0 options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            leftViewStatus = NO;
            myTableView.userInteractionEnabled=YES;
            mainView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            
            mainType=@"1";
            self.tabBarController.tabBar.hidden = NO;

            
        }
                         completion:^(BOOL finished){
                             
                             
                         }];
        
    }

    
}



#pragma mark - TableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==letfTableview && leftViewStatus==YES) {
        return 7;
    }
    else{
        
        
        if ([transactionArray count]>0) {
            return 5;;

        }
        else{
            return 5;
        }
    }
    
}

// Making table view using custom cells
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }
    
    if (tableView == letfTableview && leftViewStatus == YES) {
        
        cell.backgroundColor=[UIColor whiteColor];
        [letfTableview setSeparatorColor:[UIColor redColor]];

       
        if (indexPath.row==0) {
            ;
        }
        else{
            
            UIImageView *connectionImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left_menu_line.png"]];
            connectionImg.frame=CGRectMake(0, 55, self.view.frame.size.width, 1);
            [cell.contentView addSubview:connectionImg];
            
            
            UIImageView *arrowImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next_arrow.png"]];
            arrowImg.frame=CGRectMake(self.view.frame.size.width-70, 22, 8, 12.5);
            [cell.contentView addSubview:arrowImg];
          
        }
        
        
        
        if (indexPath.row==0) {
            
            AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(33, 18, 60, 60)];
            imageView.contentMode=UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds=YES;
            imageView.layer.cornerRadius = imageView.frame.size.width / 2;
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
            
           // NSString *image=[NSString stringWithFormat:@"%@%@",webServiceUrl,[[NSUserDefaults standardUserDefaults] valueForKey:@"picture"]];

            [cell.contentView addSubview:imageView];
            
            
            UIButton *EditBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            EditBtn.frame=CGRectMake(10, 75, 100, 30);
            [EditBtn setTitle:@"EDIT" forState:UIControlStateNormal];
            [EditBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
            [EditBtn addTarget:self action:@selector(EditBtn) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:EditBtn];
            
            

            UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(100, 25, 200, 20)];
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"name"];
            lbl.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
            lbl.textColor=[UIColor redColor];
            [cell.contentView addSubview:lbl];
            
            UILabel *username=[[UILabel alloc] initWithFrame:CGRectMake(100, 45, 200, 20)];
            username.backgroundColor=[UIColor clearColor];
            username.text=[NSString stringWithFormat:@"@%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"username"]];
            username.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
            username.textColor=[UIColor redColor];
            [cell.contentView addSubview:username];
            
            
        }

        
        if (indexPath.row==1) {
            
            UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 28/2, 28/2)];
            img.image=[UIImage imageNamed:@"activity_menu@2x.png"];
            [cell.contentView addSubview:img];
            
            UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(40, 18, 200, 20)];
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=@"MY ACTIVITY";
            lbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
            lbl.textColor=[UIColor lightGrayColor];
            [cell.contentView addSubview:lbl];
            
        }
        if (indexPath.row==2) {
            
            UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(10, 19, 28/2, 28/2)];
            img.image=[UIImage imageNamed:@"search_menu.png"];
            [cell.contentView addSubview:img];
            
            UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(40, 18, 200, 20)];
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=@"SEARCH AND FOLLOW";
            lbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
            lbl.textColor=[UIColor lightGrayColor];
            [cell.contentView addSubview:lbl];

            
        }
        if (indexPath.row==3) {
            
            UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(10, 19, 29/2, 28/2)];
            img.image=[UIImage imageNamed:@"invite_menu.png"];
            [cell.contentView addSubview:img];
            
            UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(40, 18, 200, 20)];
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=@"INVITE FRIENDS";
            lbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
            lbl.textColor=[UIColor lightGrayColor];
            [cell.contentView addSubview:lbl];

            
        }
        if (indexPath.row==4) {
            UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(10, 19, 22/2, 29/2)];
            img.image=[UIImage imageNamed:@"order_menu.png"];
            [cell.contentView addSubview:img];
            
            UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(40, 18, 200, 20)];
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=@"ORDERS";
            lbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
            lbl.textColor=[UIColor lightGrayColor];
            [cell.contentView addSubview:lbl];
            
        }
        if (indexPath.row==5) {
            
            UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(10, 18, 29/2, 29/2)];
            img.image=[UIImage imageNamed:@"setting_menu.png"];
            [cell.contentView addSubview:img];
            
            UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(40, 18, 200, 20)];
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=@"SETTINGS";
            lbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
            lbl.textColor=[UIColor lightGrayColor];
            [cell.contentView addSubview:lbl];
            
            
        }
        
        if (indexPath.row==6) {
            
        
        
            UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 25/2, 24/2)];
            img.image=[UIImage imageNamed:@"singout_menu.png"];
            [cell.contentView addSubview:img];
            
            UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(40, 18, 200, 20)];
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=@"SIGN OUT";
            lbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
            lbl.textColor=[UIColor lightGrayColor];
            [cell.contentView addSubview:lbl];


            
            
        }

        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    else{
        
        
        
        UIImageView *blackImg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 30)];
        blackImg.image=[UIImage imageNamed:@"black_bar.png"];
        [cell addSubview:blackImg];
        
        UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(5, 22, self.view.frame.size.width-100, 25)];
        title.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        title.text=@"Hi, i am testing with new product";
        title.textColor=[UIColor whiteColor];
        [cell addSubview:title];
        
        
        UILabel *price=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-50, 22,40, 25)];
        price.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        price.text=@"$240";
        price.textAlignment=NSTextAlignmentRight;
        price.textColor=[UIColor colorWithRed:248.0/255.0 green:231.0/255.0 blue:99.0/255.0 alpha:1.0];
        [cell addSubview:price];

        
        
        
        
        
        
        
        
    }
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==letfTableview || leftViewStatus==YES) {
        if (indexPath.row==0) {
            return 100;
            
        }
        else{
            
             return 56;
        }
    }
    
    else
    {
        
        return 450;
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==letfTableview || leftViewStatus==YES) {
        
        if (indexPath.row==1) {
            [self leftSlider];
            
            
            
        }
        if (indexPath.row==2) {
            
            FollowBusinessViewController *FollowBusiness=[[FollowBusinessViewController alloc]init];
            [self.navigationController pushViewController:FollowBusiness animated:YES];
            
           // PaymentViewController *payment=[[PaymentViewController alloc] init];
            //[self.navigationController pushViewController:payment animated:YES];
        }
        
        if (indexPath.row==3) {
            
            InviteFriendViewController *InviteFriend=[[InviteFriendViewController alloc]init];
            [self.navigationController pushViewController:InviteFriend animated:YES];
            
            
            //EventViewController *events=[[EventViewController alloc] init];
            //[self.navigationController pushViewController:events animated:YES];
        }
        
        if (indexPath.row==4) {
            
            
            OrderViewController *Order=[[OrderViewController alloc]init];
            [self.navigationController pushViewController:Order animated:YES];
            
            //SendGiftViewController *payment=[[SendGiftViewController alloc] init];
            //[self.navigationController pushViewController:payment animated:YES];
        }
        
        
        
        if (indexPath.row==5) {
           // SettingViewController *payment=[[SettingViewController alloc] init];
            //[self.navigationController pushViewController:payment animated:YES];
        }
        if (indexPath.row==6) {
            //PendingPaymentViewController *payment=[[PendingPaymentViewController alloc] init];
           // [self.navigationController pushViewController:payment animated:YES];
        }
        if (indexPath.row==7) {
           // FriendListViewController *payment=[[FriendListViewController alloc] init];
            //[self.navigationController pushViewController:payment animated:YES];
        }
        if (indexPath.row==8) {
            //MoneyOutViewController *payment=[[MoneyOutViewController alloc] init];
            //[self.navigationController pushViewController:payment animated:YES];
        }
        
        if (indexPath.row==9) {
            
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"picture"];
            [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"status"];
            [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"passcode"];
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"email"];

            [self.navigationController popToRootViewControllerAnimated:YES];
        }

    }
    
}
-(void)payment{
    
    //PaymentViewController *payment=[[PaymentViewController alloc] init];
    //[self.navigationController pushViewController:payment animated:YES];
}


- (void)updateBalnceSuccess:(ASIHTTPRequest *)request{
    
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:nil];
    [[NSUserDefaults standardUserDefaults]setValue:[[dict valueForKey:@"result"] valueForKey:@"balance"] forKey:@"balance"];
    [[NSUserDefaults standardUserDefaults]synchronize];
     [letfTableview reloadData];

    
}

- (void)updatedBalanceFail:(ASIHTTPRequest *)request{
    
    [letfTableview reloadData];
    

}

-(void)EditBtn{
    
    EditProfileViewController *EditProfile=[[EditProfileViewController alloc]init];
    [self.navigationController pushViewController:EditProfile animated:YES];
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
