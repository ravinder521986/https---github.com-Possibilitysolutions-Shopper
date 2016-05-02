//
//  ProductAddViewController.m
//  Project
//
//  Created by Possibility Solutions on 05/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "ProductAddViewController.h"

@interface ProductAddViewController ()

@end

@implementation ProductAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    mainView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mainView];
    mainView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:243.0/255.0 alpha:1.0];
    [self.view bringSubviewToFront:mainView];
    
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
  
    UIImageView *ImgIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup-bg.png"]];
    ImgIcon.frame=CGRectMake((self.view.frame.size.width-260)/2,self.view.frame.size.height-430, 517/2, 290);

    [mainView addSubview:ImgIcon];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
    
    UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"product.png"]];
    FormaIcon.frame=CGRectMake((self.view.frame.size.width-130)/2,150, 263/2, 219/2);
    [mainView addSubview:FormaIcon];
    

    UILabel *Productlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-180)/2, 270, 100, 20)];
    Productlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    Productlbl.text=@"PRODUCT :";
 //   [Productlbl setBackgroundColor:[UIColor redColor]];
    Productlbl.textAlignment=NSTextAlignmentCenter;
    Productlbl.textColor=[UIColor redColor];
    [mainView addSubview:Productlbl];
    
    
    
    UILabel *Storelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-160)/2, 295, 100, 20)];
    Storelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    Storelbl.text=@"STORE :";
//      [Storelbl setBackgroundColor:[UIColor redColor]];

    Storelbl.textAlignment=NSTextAlignmentCenter;
    Storelbl.textColor=[UIColor redColor];
    [mainView addSubview:Storelbl];

    
    
    
    UILabel *Pricelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-160)/2, 320, 100, 20)];
    Pricelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    Pricelbl.text=@"PRICE :";
  //    [Pricelbl setBackgroundColor:[UIColor redColor]];

    Pricelbl.textAlignment=NSTextAlignmentCenter;
    Pricelbl.textColor=[UIColor redColor];
    [mainView addSubview:Pricelbl];

    
    
    
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+10)/2, 270, 100, 20)];
    lbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    lbl.text=@"";
    [lbl setBackgroundColor:[UIColor redColor]];
    lbl.textAlignment=NSTextAlignmentCenter;
    lbl.textColor=[UIColor redColor];
    [mainView addSubview:lbl];
    
    
    
    UILabel *lbl1=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+10)/2, 295, 80, 20)];
    lbl1.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    lbl1.text=@"";
    [lbl1 setBackgroundColor:[UIColor redColor]];
    lbl1.textAlignment=NSTextAlignmentCenter;
    lbl1.textColor=[UIColor redColor];
    [mainView addSubview:lbl1];
    
    
    
    
    UILabel *lbl2=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+10)/2, 320, 80, 20)];
    lbl2.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    lbl2.text=@"";
    [lbl2 setBackgroundColor:[UIColor redColor]];
    lbl2.textAlignment=NSTextAlignmentCenter;
    lbl2.textColor=[UIColor redColor];
    [mainView addSubview:lbl2];
    

    
    
    
    
    
    
    UIImageView *SizeIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"size.png"]];
    SizeIcon.frame=CGRectMake((self.view.frame.size.width-130)/2,350, 119/2, 39/2);
    [mainView addSubview:SizeIcon];
    
    UIImageView *colorIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"color.png"]];
    colorIcon.frame=CGRectMake((self.view.frame.size.width+10)/2,350, 126/2, 39/2);
    [mainView addSubview:colorIcon];

    
    UIImageView *CheckIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addButton.png"]];
    CheckIcon.frame=CGRectMake((self.view.frame.size.width-200)/2,380, 192/2, 63/2);
    [mainView addSubview:CheckIcon];
    
    UIImageView *GoBackIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cancel.png"]];
    GoBackIcon.frame=CGRectMake((self.view.frame.size.width+10)/2,380, 192/2, 63/2);
    [mainView addSubview:GoBackIcon];

    // Do any additional setup after loading the view.
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
