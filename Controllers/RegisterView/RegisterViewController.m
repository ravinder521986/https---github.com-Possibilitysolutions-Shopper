//
//  RegisterViewController.m
//  Payzi
//
//  Created by MAC on 19/02/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
       deviceType = [UIDevice currentDevice].model;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
    Img.frame=CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:Img];

    
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    genderArray=[[NSMutableArray alloc] initWithObjects:@"Male",@"Female", nil];
    
    UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];

      
    profilePic=[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-106)/2, 80, 212/2, 212/2)];
    profilePic.image=[UIImage imageNamed:@"pik.png"];
    [self.view addSubview:profilePic];
    
    UIButton *btnimg=[UIButton buttonWithType:UIButtonTypeCustom];
    btnimg.frame=CGRectMake((self.view.frame.size.width-106)/2, 80, 212/2, 212/2);
    [btnimg addTarget:self action:@selector(openSheep) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnimg];
    

    UIImageView *emilImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
    emilImg.frame=CGRectMake((self.view.frame.size.width-220)/2,233, 534, 2/2);
    [self.view addSubview:emilImg];
    

    UIImageView *emilIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"message.png"]];
    emilIcon.frame=CGRectMake((self.view.frame.size.width-262)/2,210, 32/2, 21/2);
    [self.view addSubview:emilIcon];
    
    
    emailTextfield=[[UITextField alloc] init];
    emailTextfield.frame=CGRectMake((self.view.frame.size.width-180)/2,195, 230, 37);
    emailTextfield.tag=4;
    emailTextfield.delegate=self;
    emailTextfield.borderStyle=UITextBorderStyleNone;
    emailTextfield.textAlignment=NSTextAlignmentLeft;
    emailTextfield.returnKeyType = UIReturnKeyNext;
    emailTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    emailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email address" attributes:@{NSForegroundColorAttributeName: color}];
    

    emailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [emailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    emailTextfield.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:emailTextfield];
    
    
    
    
    UIImageView *usernameImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
    usernameImg.frame=CGRectMake((self.view.frame.size.width-220)/2,233+43, 534, 2/2);
    [self.view addSubview:usernameImg];
    
    
    UIImageView *usernameIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_name.png"]];
    usernameIcon.frame=CGRectMake((self.view.frame.size.width-262)/2,200+43, 36/2, 36/2);
    [self.view addSubview:usernameIcon];
    
    usernameTextfield=[[UITextField alloc] init];
    usernameTextfield.frame=CGRectMake((self.view.frame.size.width-180)/2,190+46, 230, 37);
    usernameTextfield.tag=3;
    usernameTextfield.delegate=self;
    usernameTextfield.borderStyle=UITextBorderStyleNone;
    usernameTextfield.textAlignment=NSTextAlignmentLeft;
    usernameTextfield.returnKeyType = UIReturnKeyNext;
    usernameTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    usernameTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"User Name" attributes:@{NSForegroundColorAttributeName: color}];
    usernameTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [usernameTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    usernameTextfield.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:usernameTextfield];
    
    

    
    UIImageView *passImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
    passImg.frame=CGRectMake((self.view.frame.size.width-220)/2,276+43, 534, 2/2);
    [self.view addSubview:passImg];
    

    
    UIImageView *passIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    passIcon.frame=CGRectMake((self.view.frame.size.width-262)/2,240+48, 28/2, 36/2);
    [self.view addSubview:passIcon];
    
    
    passwordTextfield=[[UITextField alloc] init];
    passwordTextfield.frame=CGRectMake((self.view.frame.size.width-180)/2,232+46, 230, 37);
    passwordTextfield.tag=5;
    passwordTextfield.delegate=self;
    passwordTextfield.borderStyle=UITextBorderStyleNone;
    passwordTextfield.textAlignment=NSTextAlignmentLeft;
    passwordTextfield.returnKeyType = UIReturnKeyNext;
    passwordTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    passwordTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Pasword" attributes:@{NSForegroundColorAttributeName: color}];
    
    passwordTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [passwordTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    passwordTextfield.autocapitalizationType=UITextAutocapitalizationTypeNone;
    passwordTextfield.secureTextEntry=YES;
    [self.view addSubview:passwordTextfield];
    
    
    UIImageView *birthdayImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider.png"]];
    birthdayImg.frame=CGRectMake((self.view.frame.size.width-220)/2,319+43, 534, 2/2);
    [self.view addSubview:birthdayImg];
    
    UIImageView *birthIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Birthday.png"]];
    birthIcon.frame=CGRectMake((self.view.frame.size.width-262)/2,284+48, 33/2, 33/2);
    [self.view addSubview:birthIcon];
    
    birthdayTextfied=[[UITextField alloc] init];
    birthdayTextfied.frame=CGRectMake((self.view.frame.size.width-180)/2,274+48, 230, 37);
    birthdayTextfied.tag=6;
    birthdayTextfied.delegate=self;
    birthdayTextfied.borderStyle=UITextBorderStyleNone;
    birthdayTextfied.textAlignment=NSTextAlignmentLeft;
    birthdayTextfied.returnKeyType = UIReturnKeyNext;
    birthdayTextfied.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    birthdayTextfied.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Birthday" attributes:@{NSForegroundColorAttributeName: color}];
    birthdayTextfied.keyboardType=UIKeyboardTypeEmailAddress;
    [birthdayTextfied setAutocorrectionType:UITextAutocorrectionTypeNo];
    birthdayTextfied.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:birthdayTextfied];
    
    UIButton *dateBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    dateBtn.frame=CGRectMake((self.view.frame.size.width-180)/2,274+43, 230, 37);
    [dateBtn addTarget:self action:@selector(btnPresssed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dateBtn];

    UISegmentedControl *SegmentChangeView=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"male",@"female",nil]];
    SegmentChangeView.frame=CGRectMake((self.view.frame.size.width-300)/2, 375, 300, 40);
    SegmentChangeView.selectedSegmentIndex=0;
    SegmentChangeView.momentary = NO;
    [SegmentChangeView setTintColor:[UIColor redColor]];
    [SegmentChangeView setBackgroundColor:[UIColor whiteColor]];
    NSDictionary *attributes =[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:15],UITextAttributeFont,nil];
    [SegmentChangeView setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [SegmentChangeView addTarget:self action:@selector(SegmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    SegmentChangeView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:SegmentChangeView];
    
      /*
    UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
    AddToCart.frame=CGRectMake((self.view.frame.size.width-260.5)/2,self.view.frame.size.height-70, 521/2, 86/2);
    AddToCart.userInteractionEnabled=YES;
    
    SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    SubmitBtn.frame=CGRectMake(80,0, 100, 43);
    [SubmitBtn setBackgroundColor:[UIColor clearColor]];
    [SubmitBtn setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SubmitBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
    [AddToCart addSubview:SubmitBtn];
    
    [self.view addSubview:AddToCart];
    
    */
    
    UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
    AddToCart.frame=CGRectMake(30,self.view.frame.size.height-90, self.view.frame.size.width-60, 86/2);
    AddToCart.userInteractionEnabled=YES;
    
    SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    SubmitBtn.frame=CGRectMake(50,0, self.view.frame.size.width-150, 43);
    [SubmitBtn setBackgroundColor:[UIColor clearColor]];
    [SubmitBtn setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SubmitBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
    [AddToCart addSubview:SubmitBtn];
    
    [self.view addSubview:AddToCart];

    
    
    


}
- (void)SegmentValueChanged:(UISegmentedControl *)segment
{
    
    
    if(segment.selectedSegmentIndex == 0)
    {
       
    }
    if(segment.selectedSegmentIndex == 1){
        
        
        
    }
    
    
   
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
    

    
    UIButton  *BackBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    BackBtn1.frame=CGRectMake(0/2, 30, 100, 50);
    [BackBtn1 addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:BackBtn1];
    
    
    
    
    UIButton  *titleBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.frame=CGRectMake((self.view.frame.size.width-200)/2, 25, 200, 30);
    [titleBtn setTitle:@"SIGN UP WITH EMAIL" forState:UIControlStateNormal];
    titleBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    titleBtn.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
    [customView1 addSubview:titleBtn];
    [self.view addSubview:customView1];


    
    

    
}

-(void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}




#pragma mark TextFieldDidBeginEditing
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
        [self animateTextField:textField up:YES];
}

#pragma mark TextFieldDidEndEditing
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}
#pragma mark AnimatTextFieldView
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    
    if (self.view.frame.size.height==568) {
        int movementDistance=0 ;
        float movementDuration=0.0;
        if (textField.tag==7){
            movementDistance = -70;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if (textField.tag==8){
            movementDistance = -130;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        
        int movement = (up ? movementDistance : -movementDistance);
        [UIView beginAnimations: @"animateTextField" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
    else if (self.view.frame.size.height==480) {
        int movementDistance=0;
        float movementDuration=0.0;
        if (textField.tag==4){
            movementDistance = -80;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if(textField.tag==5){
            movementDistance = -130;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if(textField.tag==6){
            movementDistance = -150;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if(textField.tag==7){
            movementDistance = -160;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if(textField.tag==8){
            movementDistance = -220;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        
        int movement = (up ? movementDistance : -movementDistance);
        [UIView beginAnimations: @"animateTextField" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
    else{
        int movementDistance=0;
        float movementDuration=0.0;
        if (textField.tag==8){
            movementDistance = -50;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        
        
        int movement = (up ? movementDistance : -movementDistance);
        [UIView beginAnimations: @"animateTextField" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
    
    
}


#pragma mark TextFieldShouldReturn
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField==emailTextfield) {
        [usernameTextfield becomeFirstResponder];
    }
    else if (textField==usernameTextfield) {
        [passwordTextfield becomeFirstResponder];
    }
    else if (textField==passwordTextfield) {
        [birthdayTextfied resignFirstResponder];
        [self btnPresssed];
    }
    
    else{
        [textField resignFirstResponder];
        
    }
    
    
    
    return YES;
}


-(BOOL)loginValidation{
    
    
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    

    
       if(emailTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your email"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if (![emailTest evaluateWithObject:emailTextfield.text]==YES)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter valid email address!"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    

    if(usernameTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Username"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if (passwordTextfield.text.length<8)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Password must be at least 8 characters long" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if(birthdayTextfied.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please select your birthday"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }

    
    
    return YES;
}







-(void)registerBtn{
    
    if ([self loginValidation]) {
        
        
        [delObj showView];
        
         NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [dict setValue:emailTextfield.text forKey:@"email"];
        [dict setValue:passwordTextfield.text forKey:@"password"];
        [dict setValue:usernameTextfield.text forKey:@"userName"];
        [dict setValue:birthdayTextfied.text forKey:@"birthDate"];
        if (IsYes==YES) {
            NSData *imgDataBefore = [NSData dataWithData:UIImageJPEGRepresentation(imageToSave,0.5)];
            NSString *strImgBefore = [imgDataBefore base64EncodedString];
            [dict setValue:strImgBefore forKey:@"picture"];
        }
        else{
            [dict setValue:@"" forKey:@"picture"];
        }
        
        
        
        
        
        
        
        
        [dict setValue:@"2" forKey:@"gender"];
        
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Register" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WebServiceResponse:) name:@"Register" object:nil];
        [delObj PostWebServer:dict type:@"Register"];

        

        
        
    }
    

}

-(void)WebServiceResponse:(NSNotification *)dictionary{
    
    NSDictionary *dict=[dictionary userInfo];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Register" object:nil];
    
    [delObj hideView];
    
    if ([[dict valueForKey:@"statusCode"]isEqualToNumber:[NSNumber numberWithInt:201]]) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        
       
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:[dict valueForKey:@"errorMessage"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    


}





- (void)requestFinished:(ASIHTTPRequest *)request{
    
   
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:nil];
    
    if ([[dict objectForKey:@"statusCode"]isEqualToNumber:[NSNumber numberWithInt:201]]) {
      //  [delObj hideView];

        
        [self login];
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


-(void)login{
    
   
    urlstring = [NSString stringWithFormat:@"%@token",webServiceUrl];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlstring]];
    [request setPostValue:emailTextfield.text forKey:@"Username"];
    [request setPostValue:passwordTextfield.text forKey:@"Password"];
    [request setPostValue:@"password" forKey:@"grant_type"];
    [request addRequestHeader:@"content-type" value:@"application/x-www-form-urlencoded"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(loginDone:)];
    [request setDidFailSelector:@selector(loginFail:)];
    [request startAsynchronous];

}

- (void)loginDone:(ASIHTTPRequest *)request
{
    
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:nil];
    
    
  //  [delObj hideView];
    
    if ([dict objectForKey:@"access_token"]) {
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"access_token"] forKey:@"userid"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"balance"] forKey:@"balance"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"id"] forKey:@"id"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"picture"] forKey:@"picture"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
       
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"userName"] forKey:@"username"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",[dict valueForKey:@"firstName"],[dict valueForKey:@"lastName"]] forKey:@"name"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        

        
//        if([deviceType isEqualToString:@"iPhone"]){
//
//        PhoneViewController *trans=[[PhoneViewController alloc] init];
//        [self.navigationController pushViewController:trans animated:YES];
//        }
//        else{
//            
//            AddressViewController *verift=[[AddressViewController alloc] init];
//            [self.navigationController pushViewController:verift animated:YES];
//        }
        
        
     //   PhoneViewController *trans=[[PhoneViewController alloc] init];
    //    [self.navigationController pushViewController:trans animated:YES];
        
        
    }
    
    
}
- (void)loginFail:(ASIHTTPRequest *)request
{
    
}



-(void)btnPresssed{
    
    typeValue=@"language";
    
  //  [firstNameTextfield resignFirstResponder];
 //   [lastNameTextfield resignFirstResponder];
    [emailTextfield resignFirstResponder];
    [usernameTextfield resignFirstResponder];
  //  [genderTextfield resignFirstResponder];
    [passwordTextfield resignFirstResponder];
    
    [self PickerCancelPressed:nil];
    toolbarFrame = CGRectMake(0 , 0 , self.view.frame.size.width , 44 ) ;
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
    toolbar.barTintColor=[UIColor whiteColor];
    
    UIBarButtonItem *toolbarItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(PickerDonePressed:)] ;
    [toolbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    UIBarButtonItem *toolbarItemCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(PickerCancelPressed:)] ;
    
    [toolbarItemCancel setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    
    UIBarButtonItem *flexibleWidth = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray * array1=[[NSArray alloc] initWithObjects:toolbarItemCancel, flexibleWidth , toolbarItem, nil] ;
    toolbar.items =array1;
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.backgroundColor=[UIColor whiteColor];
    datePicker.frame = CGRectMake(0, 40, self.view.frame.size.width, 200);
    
    [datePicker addTarget:self action:@selector(updateTextField:)
         forControlEvents:UIControlEventValueChanged];
    
    if (self.view.frame.size.height>568) {
        frame = CGRectMake(0 , 330 , self.view.frame.size.width , 200 );

    }
    else{
        frame = CGRectMake(0 , 250 , self.view.frame.size.width , 200 );

    }
    
    subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor redColor];
    [subView addSubview:toolbar];
    [subView addSubview:datePicker];
    
    subView.hidden = NO;
    
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482);
    
    
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 90 )  ;
    [UIView commitAnimations];
    [self.view addSubview:subView];
}

-(void)updateTextField:(UIDatePicker *)sender
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = datePicker.date;
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *newDateString = [dateFormatter stringFromDate:date];
    
    birthdayTextfied.text=newDateString;
}


-(void)genderBtn{
    
    typeValue=@"condition";
    
   // [firstNameTextfield resignFirstResponder];
    [usernameTextfield resignFirstResponder];
    [emailTextfield resignFirstResponder];
   // [phoneTextfield resignFirstResponder];
  //  [genderTextfield resignFirstResponder];
    [passwordTextfield resignFirstResponder];
    
    [self PickerCancelPressed:nil];


    toolbarFrame = CGRectMake(0 , 0 , self.view.frame.size.width , 44 ) ;
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
    toolbar.barTintColor=[UIColor whiteColor];
    
    UIBarButtonItem *toolbarItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(PickerDonePressed:)] ;
    [toolbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    UIBarButtonItem *toolbarItemCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(PickerCancelPressed:)] ;
    
    [toolbarItemCancel setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    
    UIBarButtonItem *flexibleWidth = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray * array1=[[NSArray alloc] initWithObjects:toolbarItemCancel, flexibleWidth , toolbarItem, nil] ;
    toolbar.items =array1;
    pickerFrame = CGRectMake(0 , 40 , self.view.frame.size.width , 100 ) ;
    picker = [[UIPickerView alloc] initWithFrame:pickerFrame] ;
    picker.delegate = self;
    picker.backgroundColor=[UIColor whiteColor];
    picker.showsSelectionIndicator = YES;
    
    if (self.view.frame.size.height>568) {
        frame = CGRectMake(0 , 330 , self.view.frame.size.width , 200 );
        
    }
    else{
        frame = CGRectMake(0 , 250 , self.view.frame.size.width , 200 );
        
    }

    
    subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor clearColor];
    [subView addSubview:toolbar];
    [subView addSubview:picker];
    
    subView.hidden = NO;
    
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482);
    
    
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 90 )  ;
    [UIView commitAnimations];
    [self.view addSubview:subView];
}




-(void)PickerDonePressed:(UIBarButtonItem*)button
{
    Count=NO;
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 90 );
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482 );
    [UIView commitAnimations];
    
    
    
    
    if ([typeValue isEqualToString:@"condition"]) {
        
        NSInteger row = [picker selectedRowInComponent:0];
      //  genderTextfield.text=[genderArray objectAtIndex:row];
        
        
        
    }
    else{
        
        
    }
    
    
    
}

-(void)PickerCancelPressed:(UIBarButtonItem*)button
{
    Count=NO;
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 90 );
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482 );
    [UIView commitAnimations];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if ([typeValue isEqualToString:@"condition"]) {
        return [genderArray count];
    }
    else if ([typeValue isEqualToString:@"language"]){
        
        //return [languageArray count];
        
    }
    
    else{
        //return [categoryArray count];
    }
    
    
    return 1;
    //return YES;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if ([typeValue isEqualToString:@"condition"]) {
        
        NSString *valCountry = [genderArray objectAtIndex:row];
        return valCountry;
    }
    else if ([typeValue isEqualToString:@"language"]){
        NSString *valCountry = [genderArray objectAtIndex:row];
        return valCountry;
    }
    
    else{
    NSString *valCountry = [genderArray objectAtIndex:row];
        return valCountry;
    }
    
    
    
}





-(void)openSheep
{
    
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Picture", @"Choose from Library", nil];
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupQuery showInView:self.view];
    
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex==0) {
        
        [self takePicture];
    }
    else if(buttonIndex==1)
    {
        [self chooseFromLibrary];
    }
    else{
        
    }
}


-(void)takePicture
{
    
    imagepicker=[[UIImagePickerController alloc]init];
    imagepicker.delegate=self;
    imagepicker.allowsEditing=YES;
    imagepicker.sourceType=UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagepicker animated:YES completion:nil];
    
    
    
}
-(void)chooseFromLibrary
{
    imagepicker=[[UIImagePickerController alloc]init];
    imagepicker.delegate=self;
    imagepicker.allowsEditing=YES;
    imagepicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagepicker animated:YES completion:nil];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    
    UIImage *originalImage, *editedImage;
    
    originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
    originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (editedImage)
    {
        imageToSave =[self fixOrientation:editedImage];
        
        
    }
    else
    {
        imageToSave =  [self fixOrientation:originalImage];
        
        
    }
    
    IsYes=YES;
    profilePic.frame=CGRectMake((self.view.frame.size.width-106)/2, 80, 212/2, 212/2);
    profilePic.image=imageToSave;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}




- (UIImage *)fixOrientation:(UIImage *)chkImg {
    
    if (chkImg.imageOrientation == UIImageOrientationUp)
        return chkImg;
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    
    switch (chkImg.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, chkImg.size.width, chkImg.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, chkImg.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, chkImg.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (chkImg.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, chkImg.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, chkImg.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, chkImg.size.width, chkImg.size.height,
                                             CGImageGetBitsPerComponent(chkImg.CGImage), 0,
                                             CGImageGetColorSpace(chkImg.CGImage),
                                             CGImageGetBitmapInfo(chkImg.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (chkImg.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            CGContextDrawImage(ctx, CGRectMake(0,0,chkImg.size.height,chkImg.size.width), chkImg.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,chkImg.size.width,chkImg.size.height), chkImg.CGImage);
            break;
    }
    
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
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
