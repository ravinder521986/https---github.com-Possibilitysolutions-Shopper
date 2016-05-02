//
//  HomeActivityViewController.m
//  Project
//
//  Created by Possibility Solutions on 05/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "HomeActivityViewController.h"

@interface HomeActivityViewController ()

@end

@implementation HomeActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=[[UIApplication sharedApplication] delegate];
    
    UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
    
    UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle.png"]];
    Img.frame=CGRectMake(0, 0, 960/2, 2108/2);
    [self.view addSubview:Img];
    
    
    
    UIImageView *ViewBtn=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup-bg.png"]];
    ViewBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,self.view.frame.size.height-350, 517/2, 290/2);
    [Img addSubview:ViewBtn];
    
    UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Forma-1.png"]];
    FormaIcon.frame=CGRectMake((self.view.frame.size.width-220)/2,260, 44/2, 44/2);
    [Img addSubview:FormaIcon];
    
    
    UILabel *titlelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-260)/2, 260, self.view.frame.size.width-20, 20)];
    titlelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    titlelbl.text=@"ITEM SUCCESSFULLY ADDED";
    titlelbl.textAlignment=NSTextAlignmentCenter;
    titlelbl.textColor=[UIColor redColor];
    [Img addSubview:titlelbl];

    
    UIImageView *CheckIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-out.png"]];
    CheckIcon.frame=CGRectMake((self.view.frame.size.width-250)/2,300, 192/2, 63/2);
    [Img addSubview:CheckIcon];
    
    UIImageView *GoBackIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"go-back.png"]];
    GoBackIcon.frame=CGRectMake((self.view.frame.size.width+50)/2,300, 192/2, 63/2);
    [Img addSubview:GoBackIcon];


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
