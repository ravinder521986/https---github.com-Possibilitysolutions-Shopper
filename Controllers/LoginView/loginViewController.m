//
//  loginViewController.m
//  Payzi
//
//  Created by MAC on 19/02/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    Img.frame=CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:Img];
    

    self.view.backgroundColor=[UIColor whiteColor];
      if (self.view.frame.size.height==480) {
        
          
          delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
          
          UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
          
          
          UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
          Img.frame=CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height);
          [self.view addSubview:Img];
          
          
          UIImageView *emilIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"final-logo.png"]];
          emilIcon.frame=CGRectMake((self.view.frame.size.width-143)/2,100, 286/2, 190/2);
          [self.view addSubview:emilIcon];
          
          UIImageView *usernameIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_name.png"]];
          usernameIcon.frame=CGRectMake((self.view.frame.size.width-265)/2,200+43, 36/2, 36/2);
          [self.view addSubview:usernameIcon];
          
          emailTextfield=[[UITextField alloc] init];
          emailTextfield.frame=CGRectMake((self.view.frame.size.width-200)/2,190+43, 230, 37);
          emailTextfield.tag=3;
          emailTextfield.delegate=self;
          emailTextfield.borderStyle=UITextBorderStyleNone;
          emailTextfield.textAlignment=NSTextAlignmentLeft;
          emailTextfield.returnKeyType = UIReturnKeyNext;
          emailTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
          emailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"User Name / Email Address" attributes:@{NSForegroundColorAttributeName: color}];
          emailTextfield.text=@"raj@gmail.com";
          emailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
          [emailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
          emailTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
          [self.view addSubview:emailTextfield];
          
          
          
          
          UIImageView *passImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
          passImg.frame=CGRectMake((self.view.frame.size.width-220)/2,276, 534, 2/2);
          [self.view addSubview:passImg];
          
          
          
          UIImageView *passIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
          passIcon.frame=CGRectMake((self.view.frame.size.width-265)/2,240+43, 28/2, 36/2);
          [self.view addSubview:passIcon];
          
          
          passwordTextfield=[[UITextField alloc] init];
          passwordTextfield.frame=CGRectMake((self.view.frame.size.width-200)/2,232+43, 230, 37);
          passwordTextfield.tag=5;
          passwordTextfield.delegate=self;
          passwordTextfield.borderStyle=UITextBorderStyleNone;
          passwordTextfield.textAlignment=NSTextAlignmentLeft;
          passwordTextfield.returnKeyType = UIReturnKeyNext;
          passwordTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
          passwordTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
          passwordTextfield.keyboardType=UIKeyboardTypeEmailAddress;
          [passwordTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
          passwordTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
          passwordTextfield.secureTextEntry=YES;
          passwordTextfield.text=@"12345678";
          [self.view addSubview:passwordTextfield];
          
          
          UIImageView *passwordImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
          passwordImg.frame=CGRectMake((self.view.frame.size.width-220)/2,270+43, 534, 2/2);
          [self.view addSubview:passwordImg];
          
          UIButton *forgotPassword=[UIButton buttonWithType:UIButtonTypeCustom];
          forgotPassword.frame=CGRectMake((self.view.frame.size.width-40)/2,320, 250, 20);
          [forgotPassword setTitle:@"Forgot password?" forState:UIControlStateNormal];
          forgotPassword.titleLabel.font = [UIFont systemFontOfSize:11];
          
          [forgotPassword setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
          forgotPassword.titleLabel.textAlignment=NSTextAlignmentLeft;
          [forgotPassword addTarget:self action:@selector(forgot) forControlEvents:UIControlEventTouchUpInside];
          
          [self.view addSubview:forgotPassword];
          
          
          UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
          AddToCart.frame=CGRectMake((self.view.frame.size.width-260.5)/2,self.view.frame.size.height-138, 521/2, 86/2);
          AddToCart.userInteractionEnabled=YES;
          
          SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
          SubmitBtn.frame=CGRectMake(80,0, 100, 43);
          [SubmitBtn setBackgroundColor:[UIColor clearColor]];
          [SubmitBtn setTitle:@"Sign In" forState:UIControlStateNormal];
          [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
          [SubmitBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
          [AddToCart addSubview:SubmitBtn];
          
          [self.view addSubview:AddToCart];
          
          
          UILabel *haveAccount=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-180)/2, self.view.frame.size.height-88, 130, 20)];
          haveAccount.text=@"Don't have an account?";
          haveAccount.textColor=[UIColor colorWithRed:112.0/255.0 green:109.0/255.0 blue:109.0/255.0 alpha:1.0];
          haveAccount.font=[UIFont fontWithName:@"Arial" size:11];
          [haveAccount setBackgroundColor:[UIColor clearColor]];
          haveAccount.textAlignment=NSTextAlignmentCenter;
          [self.view addSubview:haveAccount];
          
          
          UIButton *EmailBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
          EmailBtn.frame=CGRectMake((self.view.frame.size.width+70)/2,self.view.frame.size.height-88, 60, 20);
          [EmailBtn setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
          [EmailBtn setTitle:@"Sign Up" forState:UIControlStateNormal];
          EmailBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
          [EmailBtn setBackgroundColor:[UIColor clearColor]];
          EmailBtn.titleLabel.font = [UIFont systemFontOfSize:10];
          [EmailBtn addTarget:self action:@selector(RegBtn:) forControlEvents:UIControlEventTouchUpInside];
          [self.view addSubview:EmailBtn];
          

     
    }
    else if (self.view.frame.size.height==568){
        
        
        delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
        
        
        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
        Img.frame=CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height);
        [self.view addSubview:Img];
        
        
        UIImageView *emilIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"final-logo.png"]];
        emilIcon.frame=CGRectMake((self.view.frame.size.width-143)/2,100, 286/2, 190/2);
        [self.view addSubview:emilIcon];
        
        UIImageView *usernameIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_name.png"]];
        usernameIcon.frame=CGRectMake((self.view.frame.size.width-265)/2,200+43, 36/2, 36/2);
        [self.view addSubview:usernameIcon];
        
        emailTextfield=[[UITextField alloc] init];
        emailTextfield.frame=CGRectMake((self.view.frame.size.width-200)/2,190+43, 230, 37);
        emailTextfield.tag=3;
        emailTextfield.delegate=self;
        emailTextfield.borderStyle=UITextBorderStyleNone;
        emailTextfield.textAlignment=NSTextAlignmentLeft;
        emailTextfield.returnKeyType = UIReturnKeyNext;
        emailTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        emailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"User Name / Email Address" attributes:@{NSForegroundColorAttributeName: color}];
        emailTextfield.text=@"raj@gmail.com";
        emailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
        [emailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
        emailTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
        [self.view addSubview:emailTextfield];
        
        
        
        
        UIImageView *passImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
        passImg.frame=CGRectMake((self.view.frame.size.width-220)/2,276, 534, 2/2);
        [self.view addSubview:passImg];
        
        
        
        UIImageView *passIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
        passIcon.frame=CGRectMake((self.view.frame.size.width-265)/2,240+43, 28/2, 36/2);
        [self.view addSubview:passIcon];
        
        
        passwordTextfield=[[UITextField alloc] init];
        passwordTextfield.frame=CGRectMake((self.view.frame.size.width-200)/2,232+43, 230, 37);
        passwordTextfield.tag=5;
        passwordTextfield.delegate=self;
        passwordTextfield.borderStyle=UITextBorderStyleNone;
        passwordTextfield.textAlignment=NSTextAlignmentLeft;
        passwordTextfield.returnKeyType = UIReturnKeyNext;
        passwordTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        passwordTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
        passwordTextfield.keyboardType=UIKeyboardTypeEmailAddress;
        [passwordTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
        passwordTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
        passwordTextfield.secureTextEntry=YES;
        passwordTextfield.text=@"12345678";
        [self.view addSubview:passwordTextfield];
        
        
        UIImageView *passwordImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
        passwordImg.frame=CGRectMake((self.view.frame.size.width-220)/2,270+43, 534, 2/2);
        [self.view addSubview:passwordImg];
        
        UIButton *forgotPassword=[UIButton buttonWithType:UIButtonTypeCustom];
        forgotPassword.frame=CGRectMake((self.view.frame.size.width-40)/2,320, 250, 20);
        [forgotPassword setTitle:@"Forgot password?" forState:UIControlStateNormal];
        forgotPassword.titleLabel.font = [UIFont systemFontOfSize:11];
        
        [forgotPassword setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        forgotPassword.titleLabel.textAlignment=NSTextAlignmentLeft;
        [forgotPassword addTarget:self action:@selector(forgot) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:forgotPassword];
        
        
        UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
        AddToCart.frame=CGRectMake((self.view.frame.size.width-260.5)/2,self.view.frame.size.height-138, 521/2, 86/2);
        AddToCart.userInteractionEnabled=YES;
        
        SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SubmitBtn.frame=CGRectMake(80,0, 100, 43);
        [SubmitBtn setBackgroundColor:[UIColor clearColor]];
        [SubmitBtn setTitle:@"Sign In" forState:UIControlStateNormal];
        [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [SubmitBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [AddToCart addSubview:SubmitBtn];
        
        [self.view addSubview:AddToCart];
        
        
        UILabel *haveAccount=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-180)/2, self.view.frame.size.height-88, 130, 20)];
        haveAccount.text=@"Don't have an account?";
        haveAccount.textColor=[UIColor colorWithRed:112.0/255.0 green:109.0/255.0 blue:109.0/255.0 alpha:1.0];
        haveAccount.font=[UIFont fontWithName:@"Arial" size:11];
        [haveAccount setBackgroundColor:[UIColor clearColor]];
        haveAccount.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:haveAccount];
        
        
        UIButton *EmailBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        EmailBtn.frame=CGRectMake((self.view.frame.size.width+70)/2,self.view.frame.size.height-88, 60, 20);
        [EmailBtn setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [EmailBtn setTitle:@"Sign Up" forState:UIControlStateNormal];
        EmailBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        EmailBtn.titleLabel.font = [UIFont systemFontOfSize:10];

        [EmailBtn setBackgroundColor:[UIColor clearColor]];
        [EmailBtn addTarget:self action:@selector(RegBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:EmailBtn];
        

    }
    else{
        
        
        delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
        
        
        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
        Img.frame=CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height);
        [self.view addSubview:Img];
        
        
        UIImageView *emilIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"final-logo@3x.png"]];
        emilIcon.frame=CGRectMake((self.view.frame.size.width-214.5)/2,100, 429/2, 285/2);
        [self.view addSubview:emilIcon];

        
        UIImageView *usernameIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_name.png"]];
        usernameIcon.frame=CGRectMake(30,300, 36/2, 36/2);
        [self.view addSubview:usernameIcon];
        
        emailTextfield=[[UITextField alloc] init];
        emailTextfield.frame=CGRectMake(60,290, 230, 37);
        emailTextfield.tag=3;
        emailTextfield.delegate=self;
        emailTextfield.borderStyle=UITextBorderStyleNone;
        emailTextfield.textAlignment=NSTextAlignmentLeft;
        emailTextfield.returnKeyType = UIReturnKeyNext;
        emailTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        emailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"User Name / Email Address" attributes:@{NSForegroundColorAttributeName: color}];
        emailTextfield.text=@"raj@gmail.com";
        emailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
        [emailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
        emailTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
        [self.view addSubview:emailTextfield];
        
        
        
        
        UIImageView *passImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
        passImg.frame=CGRectMake(60,326, 534, 2/2);
        [self.view addSubview:passImg];
        
        
        
        UIImageView *passIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
        passIcon.frame=CGRectMake(30,340, 28/2, 36/2);
        [self.view addSubview:passIcon];
        
        
        passwordTextfield=[[UITextField alloc] init];
        passwordTextfield.frame=CGRectMake(60,332, 230, 37);
        passwordTextfield.tag=5;
        passwordTextfield.delegate=self;
        passwordTextfield.borderStyle=UITextBorderStyleNone;
        passwordTextfield.textAlignment=NSTextAlignmentLeft;
        passwordTextfield.returnKeyType = UIReturnKeyNext;
        passwordTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        passwordTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
        passwordTextfield.keyboardType=UIKeyboardTypeEmailAddress;
        [passwordTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
        passwordTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
        passwordTextfield.secureTextEntry=YES;
        passwordTextfield.text=@"12345678";
        [self.view addSubview:passwordTextfield];
        
        
        UIImageView *passwordImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
        passwordImg.frame=CGRectMake(60,370, 534, 2/2);
        [self.view addSubview:passwordImg];
        
        UIButton *forgotPassword=[UIButton buttonWithType:UIButtonTypeCustom];
        forgotPassword.frame=CGRectMake(self.view.frame.size.width-110,380, 110, 20);
        [forgotPassword setTitle:@"Forgot password?" forState:UIControlStateNormal];
        forgotPassword.titleLabel.font = [UIFont systemFontOfSize:11];
        
        [forgotPassword setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [forgotPassword setBackgroundColor:[UIColor clearColor]];
        forgotPassword.titleLabel.textAlignment=NSTextAlignmentLeft;
        [forgotPassword addTarget:self action:@selector(forgot) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:forgotPassword];
        
        UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
        AddToCart.frame=CGRectMake(30,self.view.frame.size.height-138, self.view.frame.size.width-60, 86/2);
        AddToCart.userInteractionEnabled=YES;
        
        SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SubmitBtn.frame=CGRectMake(50,0, self.view.frame.size.width-150, 43);
        [SubmitBtn setBackgroundColor:[UIColor clearColor]];
        [SubmitBtn setTitle:@"Sign In" forState:UIControlStateNormal];
        [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [SubmitBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [AddToCart addSubview:SubmitBtn];
        
        [self.view addSubview:AddToCart];
        
        
        UILabel *haveAccount=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-180)/2, self.view.frame.size.height-88, 130, 20)];
        haveAccount.text=@"Don't have an account?";
        haveAccount.textColor=[UIColor colorWithRed:112.0/255.0 green:109.0/255.0 blue:109.0/255.0 alpha:1.0];
        haveAccount.font=[UIFont fontWithName:@"Arial" size:11];
        [haveAccount setBackgroundColor:[UIColor clearColor]];
        haveAccount.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:haveAccount];
        
        
        UIButton *EmailBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        EmailBtn.frame=CGRectMake((self.view.frame.size.width+60)/2,self.view.frame.size.height-88, 60, 20);
        [EmailBtn setTitleColor:[UIColor colorWithRed:194.0/255.0 green:141.0/255.0 blue:142.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        EmailBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [EmailBtn setTitle:@"Sign Up" forState:UIControlStateNormal];
        EmailBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [EmailBtn setBackgroundColor:[UIColor clearColor]];
        [EmailBtn addTarget:self action:@selector(RegBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:EmailBtn];
        

        
    }

    
}
-(void)RegBtn:(id)sender{
    
    MainViewController *Register = [[MainViewController alloc]init];
    [self.navigationController pushViewController:Register animated:YES];
    
    
}

-(void)forgot{
    
    
    ForgetPswrdViewController *password=[[ForgetPswrdViewController alloc] init];
    [self.navigationController pushViewController:password animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    

    UIView *customView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"navigations.png"]];
    
    
    
    UIButton  *BackBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    BackBtn.frame=CGRectMake(10, 30, 24/2, 40/2);
    [BackBtn setImage:[UIImage imageNamed:@"BackBtn@2x.png"] forState:UIControlStateNormal];
    [BackBtn addTarget:self action:@selector(backbtn) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:BackBtn];
    [self.view addSubview:customView1];
    
    UIButton  *BackBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    BackBtn1.frame=CGRectMake(0/2, 30, 100, 50);
    [BackBtn1 addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:BackBtn1];
    
    
    
    
    
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_img.png"]];

    
}

-(void)backbtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)registerBtn{
   // PhoneViewController *verifiy=[[PhoneViewController alloc] init];
   // [self.navigationController pushViewController:verifiy animated:YES];
}


-(BOOL)loginValidation{
    
    
    
    if(emailTextfield.text.length<1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your user name or email"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    
    if(passwordTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter password"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    if (passwordTextfield.text.length>0)
    {
        NSRange range = [passwordTextfield.text rangeOfString:@" "];
        if(range.location == NSNotFound)
        {
            
            
            //            return YES;
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:@"Please remove spaces from password"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            return NO;
            
        }
    }
    
    
    return YES;
}

#pragma mark TextFieldShouldReturn
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
         [textField resignFirstResponder];

    return YES;
}



-(void)login{
    
   
    if ([self loginValidation]) {
     
        [delObj showView];
        
        urlstring = [NSString stringWithFormat:@"%@token",webServiceUrl];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlstring]];
        [request setPostValue:emailTextfield.text forKey:@"username"];
        [request setPostValue:passwordTextfield.text forKey:@"password"];
        [request setPostValue:@"password" forKey:@"grant_type"];
        [request addRequestHeader:@"content-type" value:@"application/x-www-form-urlencoded"];
        [request setRequestMethod:@"POST"];
        [request setDelegate:self];
        [request startAsynchronous];
    }
    
    
}
- (void)requestFinished:(ASIHTTPRequest *)request{
    
    
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:nil];
    
    NSLog(@"dict---%@",request.responseString);
    


    
    
    if ([dict objectForKey:@"access_token"]) {
        
        
        [[NSUserDefaults standardUserDefaults]setValue:emailTextfield.text forKey:@"email"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [[NSUserDefaults standardUserDefaults]setValue:passwordTextfield.text forKey:@"password"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"access_token"] forKey:@"userid"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"id"] forKey:@"id"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"picture"] forKey:@"picture"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"userName"] forKey:@"username"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [delObj hideView];
 
        
        [delObj createTabbar];
        
        

        
    }
    else if ([[dict valueForKey:@"error_description"]isEqualToString:@"Incorrect Password"]){
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"Password is Incorrect" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([[dict valueForKey:@"error_description"]isEqualToString:@"Email or Phone number doesn't exist"]){
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Incorrect login or password" message:@"Please re-enter your login and password and try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }

    
    else{
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Incorrect login or password" message:@"Email, Phone number or Password does not matach" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }

    
    
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    

    
}

-(void)friendList
{
    
    NSMutableString* jsonTypeStr = [NSMutableString string];
    [jsonTypeStr appendString:@"{"];
    [jsonTypeStr appendFormat:@"\"deviceId\":\"%@\",",[[NSUserDefaults standardUserDefaults]valueForKey:@"token"]];
    [jsonTypeStr appendFormat:@"\"deviceType\":\"%@\",",@"1"];
    
    
    
NSString* toTest = [jsonTypeStr substringFromIndex:[jsonTypeStr length]-1];
    NSMutableString* jsonStr2 = [NSMutableString string];
    if ([toTest isEqualToString:@","])
    {
        jsonStr2 = [[jsonTypeStr substringToIndex:[jsonTypeStr length] - 1] mutableCopy];
    }
    else
    {
        [jsonStr2 appendString:@"["];
    }
    [jsonStr2 appendString:@"}"];
    
    
    NSLog(@"sent-----%@",jsonStr2);
    

    
    urlstring = [NSString stringWithFormat:@"%@api/Devices",webServiceUrl];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlstring]];
    [request addRequestHeader:@"content-type" value:@"application/json"];
    [request addRequestHeader:@"Authorization" value:[NSString stringWithFormat:@"bearer %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"userid"]]];
    [request setPostBody:[NSMutableData dataWithData:[jsonStr2  dataUsingEncoding:NSUTF8StringEncoding]]];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(tokenSuccess:)];
    [request setDidFailSelector:@selector(tokenFail:)];
    [request startAsynchronous];
   
    
    
    
    
}

- (void)tokenSuccess:(ASIHTTPRequest *)request
{
    
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:nil];
    
    NSLog(@"TOEKN---%@",request.responseString);
    
    
}


- (void)tokenFail:(ASIHTTPRequest *)request
{
    
    
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
