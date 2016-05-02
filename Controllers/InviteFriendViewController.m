//
//  InviteFriendViewController.m
//  Project
//
//  Created by Possibility Solutions on 19/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "InviteFriendViewController.h"

@interface InviteFriendViewController ()

@end

@implementation InviteFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    delObj = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UIView *customView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.adjustsImageWhenHighlighted=NO;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"BackBtn@2x.png"] forState:UIControlStateNormal];
    leftBtn.frame=CGRectMake(10, 30, 24/2, 40/2);
    [leftBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:leftBtn];
    
    UIButton *SkipBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SkipBtn.adjustsImageWhenHighlighted=NO;
    [SkipBtn setBackgroundImage:[UIImage imageNamed:@"SendBox@2x.png"] forState:UIControlStateNormal];
    SkipBtn.frame=CGRectMake(self.view.frame.size.width-40, 38, 63/2, 19/2);
    [SkipBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:SkipBtn];
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"Invite Friend";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView addSubview:reallbl];
    
    
    
    UIButton *NextBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    NextBtn.frame=CGRectMake(0,self.view.frame.size.height-47, self.view.frame.size.width,94/2);
    [NextBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    NextBtn.backgroundColor=[UIColor clearColor];
    [NextBtn setTitle:@"Next" forState:UIControlStateNormal];
    UIImage *regImage = [UIImage imageNamed:@"next.png"];
    [NextBtn setBackgroundImage:regImage forState:UIControlStateNormal];
    NextBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [NextBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:NextBtn];
    
    [self.view addSubview:customView];
    
}
-(void)leftSlider{
    
    [self.navigationController popViewControllerAnimated:YES];
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
