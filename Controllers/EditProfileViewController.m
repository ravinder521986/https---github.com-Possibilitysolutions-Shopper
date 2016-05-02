//
//  EditProfileViewController.m
//  Project
//
//  Created by Possibility Solutions on 16/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    Img.frame=CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:Img];

    
    delObj=[[UIApplication sharedApplication] delegate];
    
    
    UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
    
    
    UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg.frame=CGRectMake((self.view.frame.size.width-290)/2,96, 415/2,2/2);
    [self.view addSubview:LineImg];
    

    
    firstNameTextfield=[[UITextField alloc] init];
    firstNameTextfield.frame=CGRectMake((self.view.frame.size.width-290)/2,70, 230, 25);
    firstNameTextfield.tag=1;
    firstNameTextfield.delegate=self;
    [firstNameTextfield setBackgroundColor:[UIColor clearColor]];
    firstNameTextfield.borderStyle=UITextBorderStyleNone;
    firstNameTextfield.textAlignment=NSTextAlignmentLeft;
    firstNameTextfield.returnKeyType = UIReturnKeyNext;
    firstNameTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [firstNameTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    firstNameTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    firstNameTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    firstNameTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName: color}];
    [self.view addSubview:firstNameTextfield];
    
    
    
    UIImageView *LineImg1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg1.frame=CGRectMake((self.view.frame.size.width-290)/2,126, 415/2,2/2);
    [self.view addSubview:LineImg1];

    lastNameTextfield=[[UITextField alloc] init];
    lastNameTextfield.frame=CGRectMake((self.view.frame.size.width-290)/2,100, 230, 25);
    lastNameTextfield.tag=2;
    lastNameTextfield.delegate=self;
    [lastNameTextfield setBackgroundColor:[UIColor clearColor]];
    lastNameTextfield.borderStyle=UITextBorderStyleNone;
    lastNameTextfield.textAlignment=NSTextAlignmentLeft;
    lastNameTextfield.returnKeyType = UIReturnKeyNext;
    lastNameTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    lastNameTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Last Name" attributes:@{NSForegroundColorAttributeName: color}];
    lastNameTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [lastNameTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    lastNameTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    [self.view addSubview:lastNameTextfield];
    
    
    profilePic=[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width+170)/2, 85, 56/2, 49/2)];
    profilePic.image=[UIImage imageNamed:@"ad_photo.png"];
  //  NSData *data = [NSData dataWithContentsOfURL:[facebookDict valueForKey:@"url"]];
  //  profilePic.image=[UIImage imageWithData:data];
    [self.view addSubview:profilePic];
    
    UIButton *btnimg=[UIButton buttonWithType:UIButtonTypeCustom];
    btnimg.frame=CGRectMake((self.view.frame.size.width+170)/2, 80, 139/2, 118/2);
    UIImage *regImage = [UIImage imageNamed:@"avatar.png"];
    [btnimg setBackgroundImage:regImage forState:UIControlStateNormal];
    [btnimg addTarget:self action:@selector(openSheep) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnimg];
    
    
    
    UIImageView *LineImg2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg2.frame=CGRectMake((self.view.frame.size.width-290)/2,156, self.view.frame.size.width,2/2);
    [self.view addSubview:LineImg2];
    

    usernameTextfield=[[UITextField alloc] init];
    usernameTextfield.frame=CGRectMake((self.view.frame.size.width-290)/2,130, 230, 25);
    usernameTextfield.tag=3;
    usernameTextfield.delegate=self;
    [usernameTextfield setBackgroundColor:[UIColor clearColor]];
    usernameTextfield.borderStyle=UITextBorderStyleNone;
    usernameTextfield.textAlignment=NSTextAlignmentLeft;
    usernameTextfield.returnKeyType = UIReturnKeyNext;
    usernameTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    usernameTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"User Name" attributes:@{NSForegroundColorAttributeName: color}];
    usernameTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [usernameTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    usernameTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    [self.view addSubview:usernameTextfield];

    
    UIImageView *LineImg3=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg3.frame=CGRectMake((self.view.frame.size.width-290)/2,186, self.view.frame.size.width,2/2);
    [self.view addSubview:LineImg3];
    

    emailTextfield=[[UITextField alloc] init];
    emailTextfield.frame=CGRectMake((self.view.frame.size.width-290)/2,160, 230, 25);
    emailTextfield.tag=4;
    emailTextfield.delegate=self;
    [emailTextfield setBackgroundColor:[UIColor clearColor]];
    emailTextfield.borderStyle=UITextBorderStyleNone;
    emailTextfield.textAlignment=NSTextAlignmentLeft;
    emailTextfield.returnKeyType = UIReturnKeyNext;
    emailTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    emailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email Address" attributes:@{NSForegroundColorAttributeName: color}];
    emailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [emailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    emailTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    [self.view addSubview:emailTextfield];
    

    
    UIImageView *LineImg4=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg4.frame=CGRectMake((self.view.frame.size.width-290)/2,216, self.view.frame.size.width,2/2);
    [self.view addSubview:LineImg4];
    

    phoneTextfield=[[UITextField alloc] init];
    phoneTextfield.frame=CGRectMake((self.view.frame.size.width-290)/2,190, 230, 25);
    phoneTextfield.tag=5;
    phoneTextfield.delegate=self;
    [phoneTextfield setBackgroundColor:[UIColor clearColor]];
    phoneTextfield.borderStyle=UITextBorderStyleNone;
    phoneTextfield.textAlignment=NSTextAlignmentLeft;
    phoneTextfield.returnKeyType = UIReturnKeyNext;
    phoneTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    phoneTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Phone Number" attributes:@{NSForegroundColorAttributeName: color}];
    phoneTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [phoneTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    phoneTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    phoneTextfield.secureTextEntry=YES;
    [self.view addSubview:phoneTextfield];
    
    
    UIImageView *LineImg5=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg5.frame=CGRectMake((self.view.frame.size.width-290)/2,246, self.view.frame.size.width,2/2);
    [self.view addSubview:LineImg5];

    
    birthdayTextfied=[[UITextField alloc] init];
    birthdayTextfied.frame=CGRectMake((self.view.frame.size.width-290)/2,220, 230, 25);
    birthdayTextfied.tag=6;
    birthdayTextfied.delegate=self;
    [birthdayTextfied setBackgroundColor:[UIColor clearColor]];
    birthdayTextfied.borderStyle=UITextBorderStyleNone;
    birthdayTextfied.textAlignment=NSTextAlignmentLeft;
    birthdayTextfied.returnKeyType = UIReturnKeyNext;
    birthdayTextfied.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    birthdayTextfied.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Date Of Birth" attributes:@{NSForegroundColorAttributeName: color}];
    birthdayTextfied.keyboardType=UIKeyboardTypeEmailAddress;
    [birthdayTextfied setAutocorrectionType:UITextAutocorrectionTypeNo];
    birthdayTextfied.autocapitalizationType=UITextAutocapitalizationTypeWords;
    [self.view addSubview:birthdayTextfied];
    
    
    UIButton *dateBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    dateBtn.frame=CGRectMake((self.view.frame.size.width-180)/2,220+25, 230, 25);
    [dateBtn addTarget:self action:@selector(btnPresssed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dateBtn];
    
    
    UIImageView *LineImg6=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg6.frame=CGRectMake((self.view.frame.size.width-290)/2,276, self.view.frame.size.width,2/2);
    [self.view addSubview:LineImg6];
    
    WebsiteTextfield=[[UITextField alloc] init];
    WebsiteTextfield.frame=CGRectMake((self.view.frame.size.width-290)/2,250, 230, 25);
    WebsiteTextfield.tag=8;
    WebsiteTextfield.delegate=self;
    [WebsiteTextfield setBackgroundColor:[UIColor clearColor]];
    WebsiteTextfield.borderStyle=UITextBorderStyleNone;
    WebsiteTextfield.textAlignment=NSTextAlignmentLeft;
    WebsiteTextfield.returnKeyType = UIReturnKeyDone;
    WebsiteTextfield.placeholder=@"Website";
    WebsiteTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    WebsiteTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Website" attributes:@{NSForegroundColorAttributeName: color}];
    WebsiteTextfield.keyboardType=UIKeyboardTypeNumberPad;
    [WebsiteTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    WebsiteTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    [self.view addSubview:WebsiteTextfield];
    
    
    UIImageView *LineImg7=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg7.frame=CGRectMake((self.view.frame.size.width-290)/2,306, self.view.frame.size.width,2/2);
    [self.view addSubview:LineImg7];
    
    BioTextfield=[[UITextField alloc] init];
    BioTextfield.frame=CGRectMake((self.view.frame.size.width-290)/2,280, 230, 25);
    BioTextfield.tag=8;
    BioTextfield.delegate=self;
    [BioTextfield setBackgroundColor:[UIColor clearColor]];
    BioTextfield.borderStyle=UITextBorderStyleNone;
    BioTextfield.textAlignment=NSTextAlignmentLeft;
    BioTextfield.returnKeyType = UIReturnKeyDone;
    BioTextfield.placeholder=@"Bio";
    BioTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    BioTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Bio" attributes:@{NSForegroundColorAttributeName: color}];
    BioTextfield.keyboardType=UIKeyboardTypeNumberPad;
    [BioTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    BioTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    [self.view addSubview:BioTextfield];

    
    
    
    UISegmentedControl *SegmentChangeView=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"male",@"female",nil]];
    SegmentChangeView.frame=CGRectMake((self.view.frame.size.width-300)/2, 370, 300, 40);
    SegmentChangeView.selectedSegmentIndex=0;
    SegmentChangeView.momentary = NO;
    
    [SegmentChangeView setTintColor:[UIColor redColor]];
    [SegmentChangeView setBackgroundColor:[UIColor whiteColor]];
    NSDictionary *attributes =[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:15],UITextAttributeFont,nil];
    [SegmentChangeView setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [SegmentChangeView addTarget:self action:@selector(SegmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    SegmentChangeView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:SegmentChangeView];
    

    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(phoneNumberCancel)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(phoneNumberCancel)],
                           nil];
    [numberToolbar sizeToFit];
    phoneTextfield.inputAccessoryView = numberToolbar;
    
}
- (void)SegmentValueChanged:(UISegmentedControl *)segment
{
    
    
    if(segment.selectedSegmentIndex == 0)
    {
        
    }
    if(segment.selectedSegmentIndex == 1){
        
        
        
    }
    
    
    
}
-(void)phoneNumberCancel{
    
    [phoneTextfield resignFirstResponder];
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    delObj = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIView *customView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.adjustsImageWhenHighlighted=NO;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"menu-icon.png"] forState:UIControlStateNormal];
    leftBtn.frame=CGRectMake(10, 30, 24/2, 40/2);
    [leftBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:leftBtn];
    
    UIButton *plusBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIImage *regImage = [UIImage imageNamed:@"DONE.png"];
    [plusBtn setBackgroundImage:regImage forState:UIControlStateNormal];
    plusBtn.tintColor=[UIColor whiteColor];
    plusBtn.frame=CGRectMake(self.view.frame.size.width-40, 45, 64/2, 19/2);
    [plusBtn addTarget:self action:@selector(openSheep) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:plusBtn];

    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"Edit Profile";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    
}
-(void)leftSlider{
    
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
    
    if (textField==firstNameTextfield) {
        [lastNameTextfield becomeFirstResponder];
    }
    else if (textField==lastNameTextfield) {
        [usernameTextfield becomeFirstResponder];
    }
    else if (textField==usernameTextfield) {
        [emailTextfield becomeFirstResponder];
    }
    
    if (textField==emailTextfield) {
        [phoneTextfield becomeFirstResponder];
    }
    else if (textField==phoneTextfield){
        
        [birthdayTextfied resignFirstResponder];
        [self btnPresssed];
    }
    else if (textField==birthdayTextfied){
        
        [WebsiteTextfield becomeFirstResponder];
        
    }
    else if (textField==WebsiteTextfield){
        
        [BioTextfield becomeFirstResponder];
    }
    else{
        
        [textField resignFirstResponder];
        
    }
    return YES;
}


-(BOOL)loginValidation{
    
    
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    
    if(firstNameTextfield.text.length<1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your First name"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    
    if(lastNameTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your last name"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    if(usernameTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Username"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
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
    
    if(phoneTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your  phone number"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    if(birthdayTextfied.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please select your birthday"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    if(WebsiteTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your  website"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    if(BioTextfield.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your  Bio"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }

    return YES;
}
-(void)registerBtn{
    
    if ([self loginValidation]) {
        
        
        
    }
}
-(void)btnPresssed{
    
    typeValue=@"language";
    
    [firstNameTextfield resignFirstResponder];
    [lastNameTextfield resignFirstResponder];
    [emailTextfield resignFirstResponder];
    [phoneTextfield resignFirstResponder];
  //  [genderTextfield resignFirstResponder];
    [WebsiteTextfield resignFirstResponder];
    [BioTextfield resignFirstResponder];

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
    
    [firstNameTextfield resignFirstResponder];
    [lastNameTextfield resignFirstResponder];
    [emailTextfield resignFirstResponder];
    [phoneTextfield resignFirstResponder];
 //   [genderTextfield resignFirstResponder];
    [WebsiteTextfield resignFirstResponder];
    [BioTextfield resignFirstResponder];
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
    //    genderTextfield.text=[genderArray objectAtIndex:row];
        
        
        
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
    profilePic.frame=CGRectMake((self.view.frame.size.width+170)/2, 80, 80, 70);
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
