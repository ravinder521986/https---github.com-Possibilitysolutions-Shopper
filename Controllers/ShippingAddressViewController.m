//
//  ShippingAddressViewController.m
//  Project
//
//  Created by Possibility Solutions on 04/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "ShippingAddressViewController.h"

@interface ShippingAddressViewController ()

@end

@implementation ShippingAddressViewController

@synthesize FinalDict, StrValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    CountryArray=[[[NSMutableArray alloc] init] mutableCopy];
    [CountryArray addObject:@"iNDIA"];
    [CountryArray addObject:@"austrila"];
    [CountryArray addObject:@"new york"];
    [CountryArray addObject:@"england"];
    [CountryArray addObject:@"japan"];
    [CountryArray addObject:@"shriLanka"];
    [CountryArray addObject:@"china"];
    [CountryArray addObject:@"bangladesh"];
    [CountryArray addObject:@"pakistan"];
    
    StateArray=[[[NSMutableArray alloc] init] mutableCopy];
    [StateArray addObject:@"himachal"];
    [StateArray addObject:@"chandigarh"];
    [StateArray addObject:@"mumbai"];
    [StateArray addObject:@"shrinazar"];
    [StateArray addObject:@"jammu"];
    [StateArray addObject:@"behair"];
    [StateArray addObject:@"channi"];
    [StateArray addObject:@"lekhnow"];
    [StateArray addObject:@"hariyana"];
    [StateArray addObject:@"goa"];
    [StateArray addObject:@"maharaster"];
    [StateArray addObject:@"delhi"];
    
    
    CityArray=[[[NSMutableArray alloc] init] mutableCopy];
    [CityArray addObject:@"bilaspur"];
    [CityArray addObject:@"una"];
    [CityArray addObject:@"kangra"];
    [CityArray addObject:@"lahouspatti"];
    [CityArray addObject:@"chamba"];
    [CityArray addObject:@"kullu"];
    [CityArray addObject:@"shimla"];
    [CityArray addObject:@"dharamshala"];
    [CityArray addObject:@"kinnor"];
    [CityArray addObject:@"mandi"];
    [CityArray addObject:@"hamirpur"];
    [CityArray addObject:@"sirmor"];
    
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    mainView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mainView];
    mainView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:243.0/255.0 alpha:1.0];
    [self.view bringSubviewToFront:mainView];
    
    UIImageView *BgImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
    BgImg.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [BgImg setBackgroundColor:[UIColor clearColor]];
    [mainView addSubview:BgImg];
    
    
    
    
    UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
    FormaIcon.frame=CGRectMake((self.view.frame.size.width-320)/2,64, 640/2, 77/2);
    [FormaIcon setBackgroundColor:[UIColor greenColor]];
    [mainView addSubview:FormaIcon];
    
    UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,10, 100, 35)];
    Websitelbl.font = [UIFont fontWithName:@"Arial" size:13];
    Websitelbl.text=@"SHIPPING ADDRESS";
    Websitelbl.textAlignment=NSTextAlignmentCenter;
    Websitelbl.textColor=[UIColor whiteColor];
    Websitelbl.numberOfLines = 1;
    [Websitelbl sizeToFit];
    [FormaIcon addSubview:Websitelbl];
    
    FirstNameTxt=[[UITextField alloc] init];
    FirstNameTxt.frame=CGRectMake(15,110, 280, 25);
    FirstNameTxt.tag=1;
    FirstNameTxt.delegate=self;
    FirstNameTxt.borderStyle=UITextBorderStyleNone;
    FirstNameTxt.textAlignment=NSTextAlignmentLeft;
    FirstNameTxt.returnKeyType = UIReturnKeyNext;
    FirstNameTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [FirstNameTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    FirstNameTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    FirstNameTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    FirstNameTxt.placeholder=@"First Name";
    [FirstNameTxt setBackgroundColor:[UIColor clearColor]];
    [mainView addSubview:FirstNameTxt];
    
    UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg.frame=CGRectMake((self.view.frame.size.width-299.5)/2,138, 599/2, 2/2);
    [mainView addSubview:LineImg];
    
    
    
    LastNameTxt=[[UITextField alloc] init];
    LastNameTxt.frame=CGRectMake(15,140, 280, 25);
    LastNameTxt.tag=2;
    LastNameTxt.delegate=self;
    LastNameTxt.borderStyle=UITextBorderStyleNone;
    LastNameTxt.textAlignment=NSTextAlignmentLeft;
    LastNameTxt.returnKeyType = UIReturnKeyNext;
    LastNameTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [LastNameTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    LastNameTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    LastNameTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    LastNameTxt.placeholder=@"Last Name";
    [LastNameTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:LastNameTxt];
    
    
    UIImageView *LineImg3=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg3.frame=CGRectMake((self.view.frame.size.width-299.5)/2,168, 599/2, 2/2);
    [mainView addSubview:LineImg3];
    
    
    AddLineTxt=[[UITextField alloc] init];
    AddLineTxt.frame=CGRectMake(15,170, 280, 25);
    AddLineTxt.tag=3;
    AddLineTxt.delegate=self;
    AddLineTxt.borderStyle=UITextBorderStyleNone;
    AddLineTxt.textAlignment=NSTextAlignmentLeft;
    AddLineTxt.returnKeyType = UIReturnKeyNext;
    AddLineTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [AddLineTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    AddLineTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    AddLineTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    AddLineTxt.placeholder=@"Address Line 1";
    [AddLineTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:AddLineTxt];
    
    UIImageView *LineImg8=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg8.frame=CGRectMake((self.view.frame.size.width-299.5)/2,198, 599/2, 2/2);
    [mainView addSubview:LineImg8];
    
    AddLine2Txt=[[UITextField alloc] init];
    AddLine2Txt.frame=CGRectMake(15,200, 280, 25);
    AddLine2Txt.tag=4;
    AddLine2Txt.delegate=self;
    AddLine2Txt.borderStyle=UITextBorderStyleNone;
    AddLine2Txt.textAlignment=NSTextAlignmentLeft;
    AddLine2Txt.returnKeyType = UIReturnKeyNext;
    AddLine2Txt.keyboardType=UIKeyboardTypeEmailAddress;
    [AddLine2Txt setAutocorrectionType:UITextAutocorrectionTypeNo];
    AddLine2Txt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    AddLine2Txt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    AddLine2Txt.placeholder=@"Address Line 2";
    [AddLine2Txt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:AddLine2Txt];
    
    UIImageView *LineImg9=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg9.frame=CGRectMake((self.view.frame.size.width-299.5)/2,228, 599/2, 2/2);
    [mainView addSubview:LineImg9];
    
    
    CountryTxt=[[UITextField alloc] init];
    CountryTxt.frame=CGRectMake(15,230, 280, 25);
    CountryTxt.tag=5;
    CountryTxt.delegate=self;
    CountryTxt.borderStyle=UITextBorderStyleNone;
    CountryTxt.textAlignment=NSTextAlignmentLeft;
    CountryTxt.returnKeyType = UIReturnKeyNext;
    CountryTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [CountryTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    CountryTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    CountryTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    CountryTxt.placeholder=@"Country";
    [CountryTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:CountryTxt];
    
    CountryBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CountryBtn.frame=CGRectMake((self.view.frame.size.width+280)/2,230, 21/2, 13/2);
    [CountryBtn setBackgroundColor:[UIColor redColor]];
    UIImage *Image = [UIImage imageNamed:@"arrow_down@2x.png"];
    [CountryBtn setBackgroundImage:Image forState:UIControlStateNormal];
    CountryBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [CountryBtn addTarget:self action:@selector(CountryBtn) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:CountryBtn];
    
    
    
    
    
    UIImageView *LineImg4=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg4.frame=CGRectMake((self.view.frame.size.width-299.5)/2,258, 599/2, 2/2);
    [mainView addSubview:LineImg4];
    
    
    StateTxt=[[UITextField alloc] init];
    StateTxt.frame=CGRectMake(15,260, 280, 25);
    StateTxt.tag=6;
    StateTxt.delegate=self;
    StateTxt.borderStyle=UITextBorderStyleNone;
    StateTxt.textAlignment=NSTextAlignmentLeft;
    StateTxt.returnKeyType = UIReturnKeyNext;
    StateTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [StateTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    StateTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    StateTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    StateTxt.placeholder=@"State/Province";
    [StateTxt setBackgroundColor:[UIColor clearColor]];
    
    
    [mainView addSubview:StateTxt];
    
    StateBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    StateBtn.frame=CGRectMake((self.view.frame.size.width+280)/2,260, 21/2, 13/2);
    [StateBtn setBackgroundColor:[UIColor redColor]];
    UIImage *regImage = [UIImage imageNamed:@"arrow_down@2x.png"];
    [StateBtn setBackgroundImage:regImage forState:UIControlStateNormal];
    StateBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [StateBtn addTarget:self action:@selector(StateBtn) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:StateBtn];
    
    UIImageView *LineImg5=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg5.frame=CGRectMake((self.view.frame.size.width-299.5)/2,288, 599/2, 2/2);
    [mainView addSubview:LineImg5];
    
    
    CityTxt=[[UITextField alloc] init];
    CityTxt.frame=CGRectMake(15,290, 280, 25);
    CityTxt.tag=7;
    CityTxt.delegate=self;
    CityTxt.borderStyle=UITextBorderStyleNone;
    CityTxt.textAlignment=NSTextAlignmentLeft;
    CityTxt.returnKeyType = UIReturnKeyNext;
    CityTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [CityTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    CityTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    CityTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    CityTxt.placeholder=@"City";
    [CityTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:CityTxt];
    
    CityBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CityBtn.frame=CGRectMake((self.view.frame.size.width+280)/2,290, 21/2, 13/2);
    [CityBtn setBackgroundColor:[UIColor redColor]];
    UIImage *arrowImage = [UIImage imageNamed:@"arrow_down@2x.png"];
    [CityBtn setBackgroundImage:arrowImage forState:UIControlStateNormal];
    CityBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [CityBtn addTarget:self action:@selector(CityBtn) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:CityBtn];
    
    
    UIImageView *LineImg6=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg6.frame=CGRectMake((self.view.frame.size.width-299.5)/2,318, 599/2, 2/2);
    [mainView addSubview:LineImg6];
    
    
    CodeTxt=[[UITextField alloc] init];
    CodeTxt.frame=CGRectMake(15,320, 280, 25);
    CodeTxt.tag=8;
    CodeTxt.delegate=self;
    CodeTxt.borderStyle=UITextBorderStyleNone;
    CodeTxt.textAlignment=NSTextAlignmentLeft;
    CodeTxt.returnKeyType = UIReturnKeyNext;
    CodeTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [CodeTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    CodeTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    CodeTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    CodeTxt.placeholder=@"zip Code / Postal Code";
    [CodeTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:CodeTxt];
    
    
    UIImageView *LineImg7=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg7.frame=CGRectMake((self.view.frame.size.width-299.5)/2,348, 599/2, 2/2);
    [mainView addSubview:LineImg7];
    
    
    TelephoneTxt=[[UITextField alloc] init];
    TelephoneTxt.frame=CGRectMake(15,350, 280, 25);
    TelephoneTxt.tag=9;
    TelephoneTxt.delegate=self;
    TelephoneTxt.borderStyle=UITextBorderStyleNone;
    TelephoneTxt.textAlignment=NSTextAlignmentLeft;
    TelephoneTxt.returnKeyType = UIReturnKeyNext;
    TelephoneTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [TelephoneTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    TelephoneTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    TelephoneTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    TelephoneTxt.placeholder=@"Telephone No";
    [TelephoneTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:TelephoneTxt];
    
    UIImageView *LineImg10=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg10.frame=CGRectMake((self.view.frame.size.width-299.5)/2,378, 599/2, 2/2);
    [mainView addSubview:LineImg10];
    
    
    
    UIButton *SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    SubmitBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,self.view.frame.size.height-135, 521/2, 89/2);
    [SubmitBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    UIImage *SubmitImage = [UIImage imageNamed:@"submit.png"];
    [SubmitBtn setBackgroundImage:SubmitImage forState:UIControlStateNormal];
    SubmitBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [SubmitBtn addTarget:self action:@selector(SubmitBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:SubmitBtn];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UIView *customView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.adjustsImageWhenHighlighted=NO;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"BackBtn@2x.png"] forState:UIControlStateNormal];
    leftBtn.frame=CGRectMake(10, 30, 24/2, 40/2);
    [leftBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:leftBtn];
    
    
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.adjustsImageWhenHighlighted=NO;
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search@2x.png"] forState:UIControlStateNormal];
    searchBtn.frame=CGRectMake(self.view.frame.size.width-20, 35, 30/2, 30/2);
    [searchBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:searchBtn];
    
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"ADD ADDRESS";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    
}
-(void)CountryBtn{
    
    StrValue=@"0";
    
    
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
    pickerFrame = CGRectMake(0 , 40 , self.view.frame.size.width , 200 ) ;
    picker = [[UIPickerView alloc] initWithFrame:pickerFrame] ;
    picker.delegate = self;
    picker.backgroundColor=[UIColor whiteColor];
    picker.showsSelectionIndicator = YES;
    
    
    frame = CGRectMake(0 , self.view.frame.size.height-300 , self.view.frame.size.width , 300 );
    
    
    
    subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor redColor];
    [subView addSubview:toolbar];
    [subView addSubview:picker];
    
    subView.hidden = NO;
    
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482);
    
    
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 )  ;
    [UIView commitAnimations];
    [self.view addSubview:subView];
}

-(void)StateBtn{
    StrValue=@"1";
    
    
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
    pickerFrame = CGRectMake(0 , 40 , self.view.frame.size.width , 200 ) ;
    picker = [[UIPickerView alloc] initWithFrame:pickerFrame] ;
    picker.delegate = self;
    picker.backgroundColor=[UIColor whiteColor];
    picker.showsSelectionIndicator = YES;
    
    
    frame = CGRectMake(0 , self.view.frame.size.height-300 , self.view.frame.size.width , 300 );
    
    
    
    subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor redColor];
    [subView addSubview:toolbar];
    [subView addSubview:picker];
    
    subView.hidden = NO;
    
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482);
    
    
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 )  ;
    [UIView commitAnimations];
    [self.view addSubview:subView];
}

-(void)CityBtn{
    StrValue=@"2";
    
    
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
    pickerFrame = CGRectMake(0 , 40 , self.view.frame.size.width , 200 ) ;
    picker = [[UIPickerView alloc] initWithFrame:pickerFrame] ;
    picker.delegate = self;
    picker.backgroundColor=[UIColor whiteColor];
    picker.showsSelectionIndicator = YES;
    
    
    frame = CGRectMake(0 , self.view.frame.size.height-300 , self.view.frame.size.width , 300 );
    
    
    
    subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor redColor];
    [subView addSubview:toolbar];
    [subView addSubview:picker];
    
    subView.hidden = NO;
    
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482);
    
    
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 )  ;
    [UIView commitAnimations];
    [self.view addSubview:subView];
}
-(void)PickerDonePressed:(UIBarButtonItem*)button
{
    Count=NO;
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 );
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482 );
    [UIView commitAnimations];
    
    
    
    
    NSInteger row = [picker selectedRowInComponent:0];
    if ([StrValue isEqualToString:@"0"]) {
        
        
        CountryTxt.text=[CountryArray objectAtIndex:row];
        
    }
    else if ([StrValue isEqualToString:@"1"]){
        
        StateTxt.text=[StateArray objectAtIndex:row];
    }
    else{
        
        CityTxt.text=[CityArray objectAtIndex:row];
        
    }
}

-(void)PickerCancelPressed:(UIBarButtonItem*)button
{
    Count=NO;
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 );
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
    
    if ([StrValue isEqualToString:@"0"]) {
        
        return [CountryArray count];
    }
    else if ([StrValue isEqualToString:@"1"]){
        
        return [StateArray count];
    }
    else{
        
        return [CityArray count];
        
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([StrValue isEqualToString:@"0"]) {
        
        NSString *valCountry = CountryTxt.text=[CountryArray objectAtIndex:row];
        
        return valCountry;
    }
    else if ([StrValue isEqualToString:@"1"]){
        
        NSString *valState = StateTxt.text=[StateArray objectAtIndex:row];
        
        return valState;
        
    }
    else{
        NSString *valCity = CityTxt.text=[CityArray objectAtIndex:row];
        
        return valCity;
        
    }
    
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
        if (textField.tag==9){
            movementDistance = -30;      // tweak as needed
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
    
    if (textField==FirstNameTxt) {
        
        [LastNameTxt becomeFirstResponder];
    }
    else if (textField==LastNameTxt) {
        
        [AddLineTxt becomeFirstResponder];
    }
       else if (textField==AddLineTxt) {
        
        [AddLine2Txt becomeFirstResponder];
    }
    else if (textField==AddLine2Txt) {
        
        [CountryTxt becomeFirstResponder];
        
    } else if (textField==CountryTxt) {
        
        [StateTxt becomeFirstResponder];
    }
    else if (textField==StateTxt) {
        
        [CityTxt becomeFirstResponder];
        
    } else if (textField==CityTxt) {
        
        [CodeTxt becomeFirstResponder];
    }
    else if (textField==CodeTxt) {
        
        [TelephoneTxt becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
        
    }
    
    
    
    return YES;
}


-(BOOL)loginValidation{
    
    
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    
    if(FirstNameTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your First Name"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if(LastNameTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Last Name"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    
    if(AddLineTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Address Line 1"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if (AddLine2Txt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please enter yourAddress Line 2" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (CountryTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please Select your Country" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (StateTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please Select your State" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (CityTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please Select your City" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (CodeTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please enter your Zip/Postal Code" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (TelephoneTxt.text.length<10)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Phone Number must be at least 10 characters long" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    return YES;
}
-(void)AddToCartBtn{
    
    
    
    if ([self loginValidation]) {
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Checkout" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"Checkout" object:nil];
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [delObj PostWebServer:dict type:@"Checkout"];
        
        PaymentViewController *Payment=[[PaymentViewController alloc]init];
        [self.navigationController pushViewController:Payment animated:YES];
    }
    else{
        
        
    }
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    
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
