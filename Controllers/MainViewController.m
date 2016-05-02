//
//  MainViewController.m
//  Project
//
//  Created by MAC on 11/07/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
    
    NSLog(@"FRAME----%f",self.view.frame.size.height);
    
    self.view.backgroundColor=[UIColor whiteColor];
    if (self.view.frame.size.height==480) {
        
        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
        Img.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:Img];
        
        
        UIImageView *emilIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shoppur@2x.png"]];
        emilIcon.frame=CGRectMake((self.view.frame.size.width-195)/2,100, 391/2, 245/2);
        [self.view addSubview:emilIcon];
        
        
        UIButton *EmailBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        EmailBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,250, 521/2, 86/2);
        [EmailBtn setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [EmailBtn setBackgroundColor:[UIColor clearColor]];
        UIImage *btnImage = [UIImage imageNamed:@"login_email@2x.png"];
        [EmailBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
        [EmailBtn setTitle:@"signup with email" forState:UIControlStateNormal];
        EmailBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [EmailBtn addTarget:self action:@selector(RegBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:EmailBtn];
        
        
        UIButton *RegBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        RegBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,300, 521/2, 86/2);
        [RegBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        UIImage *regImage = [UIImage imageNamed:@"Rounded.png"];
        [RegBtn setBackgroundImage:regImage forState:UIControlStateNormal];
        [RegBtn setTitle:@"join with facebook" forState:UIControlStateNormal];
        RegBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [RegBtn setBackgroundColor:[UIColor clearColor]];

        [RegBtn addTarget:self action:@selector(BtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:RegBtn];
        
        UIButton *LoginBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        LoginBtn.frame=CGRectMake((self.view.frame.size.width-200)/2,345, 200, 40);
        [LoginBtn setTitleColor:[UIColor colorWithRed:38.0/255.0 green:38.0/255.0 blue:38.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [LoginBtn setTitle:@"or Sign in" forState:UIControlStateNormal];
        LoginBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [LoginBtn setBackgroundColor:[UIColor clearColor]];

        [LoginBtn addTarget:self action:@selector(LoginBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:LoginBtn];
        
        
        
        UIButton *SignupBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SignupBtn.frame=CGRectMake((self.view.frame.size.width-200)/2,420, 200, 40);
        [SignupBtn setTitleColor:[UIColor colorWithRed:112.0/255.0 green:109.0/255.0 blue:109.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [SignupBtn setTitle:@"sign up later" forState:UIControlStateNormal];
        SignupBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [SignupBtn addTarget:self action:@selector(SignupBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:SignupBtn];
        
        
        
     

        
    }
    else if (self.view.frame.size.height==568){
        
        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
        Img.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:Img];
        
        
        UIImageView *emilIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shoppur@2x.png"]];
        emilIcon.frame=CGRectMake((self.view.frame.size.width-195)/2,140, 391/2, 245/2);
        [self.view addSubview:emilIcon];
        
        
        UIButton *EmailBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        EmailBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,300, 521/2, 86/2);
        [EmailBtn setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        UIImage *btnImage = [UIImage imageNamed:@"login_email@2x.png"];
        [EmailBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
        [EmailBtn setTitle:@"signup with email" forState:UIControlStateNormal];
        EmailBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [EmailBtn addTarget:self action:@selector(RegBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:EmailBtn];
        
        
        UIButton *RegBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        RegBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,355, 521/2, 86/2);
        [RegBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        UIImage *regImage = [UIImage imageNamed:@"Rounded.png"];
        [RegBtn setBackgroundImage:regImage forState:UIControlStateNormal];
        [RegBtn setTitle:@"join with facebook" forState:UIControlStateNormal];
        RegBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [RegBtn setBackgroundColor:[UIColor clearColor]];
        [RegBtn addTarget:self action:@selector(RegBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:RegBtn];
        
        
        
        UIButton *LoginBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        LoginBtn.frame=CGRectMake((self.view.frame.size.width-200)/2,400, 200, 40);
        [LoginBtn setTitleColor:[UIColor colorWithRed:38.0/255.0 green:38.0/255.0 blue:38.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [LoginBtn setTitle:@"or Sign in" forState:UIControlStateNormal];
        LoginBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [LoginBtn setBackgroundColor:[UIColor clearColor]];
        [LoginBtn addTarget:self action:@selector(LoginBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:LoginBtn];
        
        
        
        UIButton *SignupBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SignupBtn.frame=CGRectMake((self.view.frame.size.width-200)/2,500, 200, 40);
        [SignupBtn setTitleColor:[UIColor colorWithRed:112.0/255.0 green:109.0/255.0 blue:109.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [SignupBtn setTitle:@"sign up later" forState:UIControlStateNormal];
        SignupBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [SignupBtn addTarget:self action:@selector(SignupBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:SignupBtn];

        

        
        
    }
    else{
        
        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
        Img.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:Img];
        
        
        UIImageView *emilIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shoppur@2x.png"]];
        emilIcon.frame=CGRectMake((self.view.frame.size.width-294)/2,100, 588/2, 368/2);
        [self.view addSubview:emilIcon];
        
        
        UIButton *EmailBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        EmailBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,380, 521/2, 86/2);
        [EmailBtn setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        UIImage *btnImage = [UIImage imageNamed:@"login_email@2x.png"];
        [EmailBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
        [EmailBtn setTitle:@"signup with email" forState:UIControlStateNormal];
        EmailBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [EmailBtn addTarget:self action:@selector(RegBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:EmailBtn];
        
        
        UIButton *RegBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        RegBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,435, 521/2, 86/2);
        [RegBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        UIImage *regImage = [UIImage imageNamed:@"Rounded.png"];
        [RegBtn setBackgroundImage:regImage forState:UIControlStateNormal];
        [RegBtn setTitle:@"join with facebook" forState:UIControlStateNormal];
        RegBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [RegBtn setBackgroundColor:[UIColor clearColor]];
        [RegBtn addTarget:self action:@selector(RegBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:RegBtn];
        
        
        
        UIButton *LoginBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        LoginBtn.frame=CGRectMake((self.view.frame.size.width-200)/2,480, 200, 40);
        [LoginBtn setTitleColor:[UIColor colorWithRed:38.0/255.0 green:38.0/255.0 blue:38.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [LoginBtn setTitle:@"or Sign in" forState:UIControlStateNormal];
        LoginBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [LoginBtn setBackgroundColor:[UIColor clearColor]];
        [LoginBtn addTarget:self action:@selector(LoginBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:LoginBtn];
        
        
        
        UIButton *SignupBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SignupBtn.frame=CGRectMake((self.view.frame.size.width-200)/2,self.view.frame.size.height-70, 200, 40);
        [SignupBtn setTitleColor:[UIColor colorWithRed:112.0/255.0 green:109.0/255.0 blue:109.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [SignupBtn setTitle:@"sign up later" forState:UIControlStateNormal];
        SignupBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [SignupBtn addTarget:self action:@selector(SignupBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:SignupBtn];

        
        
        
     
    }
    

    
}
-(void)LoginBtn:(id)sender{
    
    loginViewController *login = [[loginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
    
    
}
-(void)RegBtn:(id)sender{
    
    RegisterViewController *Register = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:Register animated:YES];
    
    
}
-(void)BtnPressed:(id)sender{
    
//    HomeActivityViewController *Home = [[HomeActivityViewController alloc]init];
 //   [self.navigationController pushViewController:Home animated:YES];
    
    
    ProductAddViewController *Home = [[ProductAddViewController alloc]init];
       [self.navigationController pushViewController:Home animated:YES];

    
}
-(void)SignupBtn:(id)sender{
    
    
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
