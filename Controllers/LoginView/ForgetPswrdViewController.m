//
//  ForgetPswrdViewController.m
//  Project
//
//  Created by Possibility Solutions on 02/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "ForgetPswrdViewController.h"

@interface ForgetPswrdViewController ()

@end

@implementation ForgetPswrdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.view.frame.size.height==480) {
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];

    UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
    
    UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Reset_bg.png"]];
    Img.frame=CGRectMake(0, 0, self.view.frame.size.width, 1162/2);
    [self.view addSubview:Img];
    
    
    UILabel *titlelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-self.view.frame.size.width)/2, 80,self.view.frame.size.width, 25)];
    titlelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:20];
    titlelbl.text=@"Enter Your Email Address";
    titlelbl.textAlignment=NSTextAlignmentCenter;
    titlelbl.backgroundColor=[UIColor clearColor];
    titlelbl.textColor=[UIColor redColor];
    [self.view addSubview:titlelbl];
    
    
    UIImageView *passImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RounD.png"]];
    passImg.frame=CGRectMake((self.view.frame.size.width-300)/2,120, 611/2, 50/2);
    [self.view addSubview:passImg];
    
    
    
    EmailTextfield=[[UITextField alloc] init];
    EmailTextfield.frame=CGRectMake((self.view.frame.size.width-200)/2,115, 230, 37);
    EmailTextfield.tag=5;
    EmailTextfield.delegate=self;
    EmailTextfield.borderStyle=UITextBorderStyleNone;
    EmailTextfield.textAlignment=NSTextAlignmentLeft;
    EmailTextfield.returnKeyType = UIReturnKeyNext;
    EmailTextfield.font=[UIFont fontWithName:@"Arial" size:15];
    EmailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email Address" attributes:@{NSForegroundColorAttributeName: color}];
    EmailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [EmailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    EmailTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    [self.view addSubview:EmailTextfield];
    
    
    
    
    UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
    AddToCart.frame=CGRectMake((self.view.frame.size.width-260.5)/2,self.view.frame.size.height-118, 521/2, 86/2);
    AddToCart.userInteractionEnabled=YES;
    
    SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    SubmitBtn.frame=CGRectMake(80,0, 100, 43);
    [SubmitBtn setBackgroundColor:[UIColor clearColor]];
    [SubmitBtn setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SubmitBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
    [AddToCart addSubview:SubmitBtn];
    
    [self.view addSubview:AddToCart];
    }
    else if (self.view.frame.size.height==568){
        self.view.backgroundColor = [UIColor whiteColor];
        delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
        
        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Reset_bg.png"]];
        Img.frame=CGRectMake(0, 0, self.view.frame.size.width, 1162/2);
        [self.view addSubview:Img];
        
        
        UILabel *titlelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-self.view.frame.size.width)/2, 80,self.view.frame.size.width, 25)];
        titlelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:20];
        titlelbl.text=@"Enter Your Email Address";
        titlelbl.textAlignment=NSTextAlignmentCenter;
        titlelbl.backgroundColor=[UIColor clearColor];
        titlelbl.textColor=[UIColor redColor];
        [self.view addSubview:titlelbl];
        
        
        UIImageView *passImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RounD.png"]];
        passImg.frame=CGRectMake((self.view.frame.size.width-300)/2,120, 611/2, 50/2);
        [self.view addSubview:passImg];
        
        
        
        EmailTextfield=[[UITextField alloc] init];
        EmailTextfield.frame=CGRectMake((self.view.frame.size.width-200)/2,115, 230, 37);
        EmailTextfield.tag=5;
        EmailTextfield.delegate=self;
        EmailTextfield.borderStyle=UITextBorderStyleNone;
        EmailTextfield.textAlignment=NSTextAlignmentLeft;
        EmailTextfield.returnKeyType = UIReturnKeyNext;
        EmailTextfield.font=[UIFont fontWithName:@"Arial" size:15];
        EmailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email Address" attributes:@{NSForegroundColorAttributeName: color}];
        EmailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
        [EmailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
        EmailTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
        [self.view addSubview:EmailTextfield];
        
        
        
        
        UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
        AddToCart.frame=CGRectMake((self.view.frame.size.width-260.5)/2,self.view.frame.size.height-118, 521/2, 86/2);
        AddToCart.userInteractionEnabled=YES;
        
        SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SubmitBtn.frame=CGRectMake(80,0, 100, 43);
        [SubmitBtn setBackgroundColor:[UIColor clearColor]];
        [SubmitBtn setTitle:@"SUBMIT" forState:UIControlStateNormal];
        [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [SubmitBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
        [AddToCart addSubview:SubmitBtn];
        
        [self.view addSubview:AddToCart];
        
        
    }
    else{
        
        self.view.backgroundColor = [UIColor whiteColor];
        delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
        
        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Reset_bg.png"]];
        Img.frame=CGRectMake(0, 0, self.view.frame.size.width, 1743/2);
        [self.view addSubview:Img];
        
        
        UILabel *titlelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-self.view.frame.size.width)/2, 80,self.view.frame.size.width, 25)];
        titlelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:20];
        titlelbl.text=@"Enter Your Email Address";
        titlelbl.textAlignment=NSTextAlignmentCenter;
        titlelbl.backgroundColor=[UIColor clearColor];
        titlelbl.textColor=[UIColor redColor];
        [self.view addSubview:titlelbl];
        
        
        UIImageView *passImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RounD.png"]];
        passImg.frame=CGRectMake(10,120, self.view.frame.size.width-20, 75/2);
        [self.view addSubview:passImg];
        
        
        
        EmailTextfield=[[UITextField alloc] init];
        EmailTextfield.frame=CGRectMake((self.view.frame.size.width-200)/2,120, 230, 37);
        EmailTextfield.tag=5;
        EmailTextfield.delegate=self;
        EmailTextfield.borderStyle=UITextBorderStyleNone;
        EmailTextfield.textAlignment=NSTextAlignmentLeft;
        EmailTextfield.returnKeyType = UIReturnKeyNext;
        EmailTextfield.font=[UIFont fontWithName:@"Arial" size:15];
        EmailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName: color}];
        EmailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
        [EmailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
        EmailTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
        [self.view addSubview:EmailTextfield];
        
        
        
        
        UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
        AddToCart.frame=CGRectMake((self.view.frame.size.width-260.5)/2,self.view.frame.size.height-118, 521/2, 86/2);
        AddToCart.userInteractionEnabled=YES;
        
        SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SubmitBtn.frame=CGRectMake(80,0, 100, 43);
        [SubmitBtn setBackgroundColor:[UIColor clearColor]];
        [SubmitBtn setTitle:@"SUBMIT" forState:UIControlStateNormal];
        [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [SubmitBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
        [AddToCart addSubview:SubmitBtn];
        
        [self.view addSubview:AddToCart];
        
    }
    
        // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    UIView *customView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    
    UIImageView *phoneImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_bar_bg.png"]];
    phoneImg.frame=CGRectMake(0, 0, self.view.frame.size.width, 128/2);
    [customView1 addSubview:phoneImg];

    UIButton  *BackBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    BackBtn.frame=CGRectMake(10, 30, 24/2, 40/2);
    [BackBtn setImage:[UIImage imageNamed:@"BackBtn@2x.png"] forState:UIControlStateNormal];
    [BackBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:BackBtn];
    
    
    
    UIButton  *titleBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.frame=CGRectMake((self.view.frame.size.width-200)/2, 25, 200, 30);
    [titleBtn setTitle:@"RESET PASSWORD" forState:UIControlStateNormal];
    titleBtn.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
    titleBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [customView1 addSubview:titleBtn];
    [self.view addSubview:customView1];
    
    
  
    
}
-(void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark TextFieldShouldReturn
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField==EmailTextfield) {
        
        [textField resignFirstResponder];
        
    }
    
    
    
    return YES;
}


-(BOOL)loginValidation{
    
    
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    
    if(EmailTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Email Address"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if (![emailTest evaluateWithObject:EmailTextfield.text]==YES)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter valid email address!"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    
    return YES;
}



-(void)registerBtn{
    
    if ([self loginValidation]) {
        
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [dict setValue:EmailTextfield.text forKey:@"email"];
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ResetPassword" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WebServiceResponse:) name:@"ResetPassword" object:nil];
        [delObj PostWebServer:dict type:@"ResetPassword"];
        
        
        
        
        
    }
    
    
}

-(void)WebServiceResponse:(NSNotification *)dictionary{
    
    NSDictionary *dict=[dictionary userInfo];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ResetPassword" object:nil];
    
    UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"Reset Link Sent" message:@"Please follow the instructions in the message to reset your password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [aler show];
    

    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}





- (void)requestFinished:(ASIHTTPRequest *)request{
    
    
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:nil];
    
    if ([[dict objectForKey:@"statusCode"]isEqualToNumber:[NSNumber numberWithInt:201]]) {
        //  [delObj hideView];
        
        
    }
    else if ([[dict objectForKey:@"statusCode"]isEqualToNumber:[NSNumber numberWithInt:400]]) {
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:[dict valueForKey:@"errorMessage"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        //   [delObj hideView];
        
    }
    
    else{
        
        //  [delObj hideView];
        
    }
    
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    //[delObj hideView];
    
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
