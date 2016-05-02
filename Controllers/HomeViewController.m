//
//  HomeViewController.m
//  Project
//
//  Created by Possibility Solutions on 03/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize FinalDict, StrValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    SizeArray=[[[NSMutableArray alloc] init] mutableCopy];
    [SizeArray addObject:@"24x10"];
    [SizeArray addObject:@"24x20"];
    [SizeArray addObject:@"24x25"];
    [SizeArray addObject:@"24x35"];
    [SizeArray addObject:@"24x45"];
    [SizeArray addObject:@"24x50"];
    [SizeArray addObject:@"24x100"];
    [SizeArray addObject:@"24x200"];
    [SizeArray addObject:@"24x205"];
    [SizeArray addObject:@"24x350"];
    [SizeArray addObject:@"24x450"];
    [SizeArray addObject:@"24x500"];
    
    ColorArray=[[[NSMutableArray alloc] init] mutableCopy];
    [ColorArray addObject:@"Red"];
    [ColorArray addObject:@"White"];
    [ColorArray addObject:@"Black"];
    [ColorArray addObject:@"Yellow"];
    [ColorArray addObject:@"Green"];
    [ColorArray addObject:@"Blue"];
    [ColorArray addObject:@"gray"];
    [ColorArray addObject:@"White"];
    [ColorArray addObject:@"pink"];
    
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    mainView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mainView];
    mainView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:243.0/255.0 alpha:1.0];
    [self.view bringSubviewToFront:mainView];
    
    UIImageView *BgImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
    BgImg.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [BgImg setBackgroundColor:[UIColor clearColor]];
    [mainView addSubview:BgImg];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-320)/2, 64, 320, 30)];
    lbl.font = [UIFont fontWithName:@"Arial" size:11];
    lbl.text=@"Can't Find what you'ar looking for? No problem just add the product from the stores website or complete the product details in the from blow";
    [lbl setBackgroundColor:[UIColor clearColor]];
    lbl.textAlignment=NSTextAlignmentCenter;
    lbl.textColor=[UIColor blackColor];
    lbl.numberOfLines = 3;
    [lbl sizeToFit];
    [mainView addSubview:lbl];
    
    
    UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
    FormaIcon.frame=CGRectMake((self.view.frame.size.width-320)/2,100, 640/2, 77/2);
    [FormaIcon setBackgroundColor:[UIColor greenColor]];
    [mainView addSubview:FormaIcon];
    
    UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,10, 100, 35)];
    Websitelbl.font = [UIFont fontWithName:@"Arial" size:13];
    Websitelbl.text=@"STORE WEBSITE";
    Websitelbl.textAlignment=NSTextAlignmentCenter;
    Websitelbl.textColor=[UIColor whiteColor];
    Websitelbl.numberOfLines = 1;
    [Websitelbl sizeToFit];
    [FormaIcon addSubview:Websitelbl];
    
    AddProductTxt=[[UITextField alloc] init];
    AddProductTxt.frame=CGRectMake(5,140, 280, 20);
    AddProductTxt.tag=6;
    AddProductTxt.delegate=self;
    AddProductTxt.borderStyle=UITextBorderStyleNone;
    AddProductTxt.textAlignment=NSTextAlignmentLeft;
    AddProductTxt.returnKeyType = UIReturnKeyNext;
    AddProductTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [AddProductTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    AddProductTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    AddProductTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    AddProductTxt.placeholder=@"Add Product From Store Website";
    [AddProductTxt setBackgroundColor:[UIColor clearColor]];
    [mainView addSubview:AddProductTxt];
    
    UIImageView *ArrowImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next_arrow@2x.png"]];
    ArrowImg.frame=CGRectMake(300, 147, 13/2, 21/2);
    [ArrowImg setBackgroundColor:[UIColor clearColor]];
    [mainView addSubview:ArrowImg];
    
    UIImageView *FormaImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
    FormaImage.frame=CGRectMake((self.view.frame.size.width-320)/2,162, 640/2, 77/2);
    
    UILabel *Formlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,12, 100, 35)];
    Formlbl.font = [UIFont fontWithName:@"Arial" size:13];
    Formlbl.text=@"FORM";
    Formlbl.textAlignment=NSTextAlignmentCenter;
    Formlbl.textColor=[UIColor whiteColor];
    Formlbl.numberOfLines = 1;
    [Formlbl sizeToFit];
    [FormaImage addSubview:Formlbl];
    
    [mainView addSubview:FormaImage];
    
    StoreNameTxt=[[UITextField alloc] init];
    StoreNameTxt.frame=CGRectMake(15,205, 280, 25);
    StoreNameTxt.tag=6;
    StoreNameTxt.delegate=self;
    StoreNameTxt.borderStyle=UITextBorderStyleNone;
    StoreNameTxt.textAlignment=NSTextAlignmentLeft;
    StoreNameTxt.returnKeyType = UIReturnKeyNext;
    StoreNameTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [StoreNameTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    StoreNameTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    StoreNameTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    StoreNameTxt.placeholder=@"Store Name";
    [StoreNameTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:StoreNameTxt];
    
    UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg.frame=CGRectMake((self.view.frame.size.width-299.5)/2,235, 599/2, 2/2);
    [mainView addSubview:LineImg];
    
    StoreWebsiteTxt=[[UITextField alloc] init];
    StoreWebsiteTxt.frame=CGRectMake(15,240, 280, 25);
    StoreWebsiteTxt.tag=6;
    StoreWebsiteTxt.delegate=self;
    StoreWebsiteTxt.borderStyle=UITextBorderStyleNone;
    StoreWebsiteTxt.textAlignment=NSTextAlignmentLeft;
    StoreWebsiteTxt.returnKeyType = UIReturnKeyNext;
    StoreWebsiteTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [StoreWebsiteTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    StoreWebsiteTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    StoreWebsiteTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    StoreWebsiteTxt.placeholder=@"Store Website";
    [StoreWebsiteTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:StoreWebsiteTxt];
    
    UIImageView *LineImg1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg1.frame=CGRectMake((self.view.frame.size.width-299.5)/2,270, 599/2, 2/2);
    [mainView addSubview:LineImg1];
    
    ProductNameTxt=[[UITextField alloc] init];
    ProductNameTxt.frame=CGRectMake(15,275, 280, 25);
    ProductNameTxt.tag=6;
    ProductNameTxt.delegate=self;
    ProductNameTxt.borderStyle=UITextBorderStyleNone;
    ProductNameTxt.textAlignment=NSTextAlignmentLeft;
    ProductNameTxt.returnKeyType = UIReturnKeyNext;
    ProductNameTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [ProductNameTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    ProductNameTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    ProductNameTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    ProductNameTxt.placeholder=@"Product Name";
    [ProductNameTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:ProductNameTxt];
    
    UIImageView *LineImg2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg2.frame=CGRectMake((self.view.frame.size.width-299.5)/2,305, 599/2, 2/2);
    [mainView addSubview:LineImg2];
    
    ProductTxt=[[UITextField alloc] init];
    ProductTxt.frame=CGRectMake(15,310, 280, 25);
    ProductTxt.tag=6;
    ProductTxt.delegate=self;
    ProductTxt.borderStyle=UITextBorderStyleNone;
    ProductTxt.textAlignment=NSTextAlignmentLeft;
    ProductTxt.returnKeyType = UIReturnKeyNext;
    ProductTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [ProductTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    ProductTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    ProductTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    ProductTxt.placeholder=@"Product sku (optional)";
    [ProductTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:ProductTxt];
    
    UIImageView *LineImg3=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg3.frame=CGRectMake((self.view.frame.size.width-299.5)/2,340, 599/2, 2/2);
    [mainView addSubview:LineImg3];
    
    
    ColourTxt=[[UITextField alloc] init];
    ColourTxt.frame=CGRectMake(15,345, 280, 25);
    ColourTxt.tag=6;
    ColourTxt.delegate=self;
    ColourTxt.borderStyle=UITextBorderStyleNone;
    ColourTxt.textAlignment=NSTextAlignmentLeft;
    ColourTxt.returnKeyType = UIReturnKeyNext;
    ColourTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [ColourTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    ColourTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    ColourTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    ColourTxt.placeholder=@"Colour Perference(if applicable)";
    [ColourTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:ColourTxt];
    
    ColorIconBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    ColorIconBtn.frame=CGRectMake(15,345, 280, 25);
    [ColorIconBtn setBackgroundColor:[UIColor clearColor]];
    [ColorIconBtn addTarget:self action:@selector(ColorIconBtn) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:ColorIconBtn];
    
    
    
    UIImageView *LineImg4=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg4.frame=CGRectMake((self.view.frame.size.width-299.5)/2,375, 599/2, 2/2);
    [mainView addSubview:LineImg4];
    
    
    SizeTxt=[[UITextField alloc] init];
    SizeTxt.frame=CGRectMake(15,380, 280, 25);
    SizeTxt.tag=6;
    SizeTxt.delegate=self;
    SizeTxt.borderStyle=UITextBorderStyleNone;
    SizeTxt.textAlignment=NSTextAlignmentLeft;
    SizeTxt.returnKeyType = UIReturnKeyNext;
    SizeTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [SizeTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    SizeTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    SizeTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    SizeTxt.placeholder=@"Size (if applicable)";
    [SizeTxt setBackgroundColor:[UIColor clearColor]];
    
    
    [mainView addSubview:SizeTxt];
    
    SizeIconBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    SizeIconBtn.frame=CGRectMake(15,380, 280, 25);
    [SizeIconBtn setBackgroundColor:[UIColor clearColor]];
    [SizeIconBtn addTarget:self action:@selector(SizeIconBtn) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:SizeIconBtn];
    
    UIImageView *LineImg5=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg5.frame=CGRectMake((self.view.frame.size.width-299.5)/2,410, 599/2, 2/2);
    [mainView addSubview:LineImg5];
    
    
    PriceTxt=[[UITextField alloc] init];
    PriceTxt.frame=CGRectMake(15,415, 280, 25);
    PriceTxt.tag=6;
    PriceTxt.delegate=self;
    PriceTxt.borderStyle=UITextBorderStyleNone;
    PriceTxt.textAlignment=NSTextAlignmentLeft;
    PriceTxt.returnKeyType = UIReturnKeyNext;
    PriceTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [PriceTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    PriceTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    PriceTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    PriceTxt.placeholder=@"Price (optional)";
    [PriceTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:PriceTxt];
    
    
    UIImageView *LineImg6=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg6.frame=CGRectMake((self.view.frame.size.width-299.5)/2,445, 599/2, 2/2);
    [mainView addSubview:LineImg6];
    
    
    SpecialTxt=[[UITextField alloc] init];
    SpecialTxt.frame=CGRectMake(15,450, 280, 25);
    SpecialTxt.tag=6;
    SpecialTxt.delegate=self;
    SpecialTxt.borderStyle=UITextBorderStyleNone;
    SpecialTxt.textAlignment=NSTextAlignmentLeft;
    SpecialTxt.returnKeyType = UIReturnKeyNext;
    SpecialTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [SpecialTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    SpecialTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    SpecialTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    SpecialTxt.placeholder=@"Special instructions";
    [SpecialTxt setBackgroundColor:[UIColor clearColor]];
    
    [mainView addSubview:SpecialTxt];
    
    
    UIImageView *LineImg7=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg7.frame=CGRectMake((self.view.frame.size.width-299.5)/2,480, 599/2, 2/2);
    [mainView addSubview:LineImg7];
    
    
    UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddToCart@2x.png"]];
    AddToCart.frame=CGRectMake((self.view.frame.size.width-260.5)/2,482, 521/2, 89/2);
    AddToCart.userInteractionEnabled=YES;
    
    AddToCartBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    AddToCartBtn.frame=CGRectMake((self.view.frame.size.width-320)/2,5, 260.5, 35);
    [AddToCartBtn setBackgroundColor:[UIColor clearColor]];
    [AddToCartBtn setTitle:@"AddToCart" forState:UIControlStateNormal];
    [AddToCartBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [AddToCartBtn addTarget:self action:@selector(AddToCartBtn) forControlEvents:UIControlEventTouchUpInside];
    [AddToCart addSubview:AddToCartBtn];
    
    [mainView addSubview:AddToCart];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)AddToCartBtn{
    
    if ([self loginValidation]) {
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Checkout" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"Checkout" object:nil];
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [delObj PostWebServer:dict type:@"Checkout"];
    }
    else{
        
        
    }
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UIView *customView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    UIButton *SearchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SearchBtn.adjustsImageWhenHighlighted=NO;
    [SearchBtn setBackgroundImage:[UIImage imageNamed:@"menu-icon.png"] forState:UIControlStateNormal];
    SearchBtn.frame=CGRectMake(10, 35, 34/2, 31/2);
    [SearchBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:SearchBtn];
    
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"ADD CUSTOM ORDER";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView addSubview:reallbl];
    
    [self.view addSubview:customView];
    
    
}
-(void)AddRequest{
    
    
}
-(void)SizeIconBtn{
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

-(void)ColorIconBtn{
    
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
        
        
        SizeTxt.text=[SizeArray objectAtIndex:row];
    }
    else{
        
        ColourTxt.text=[ColorArray objectAtIndex:row];
        
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
        
        return [SizeArray count];
    }
    else{
        
        return [ColorArray count];
        
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([StrValue isEqualToString:@"0"]) {
        
        NSString *valCountry = SizeTxt.text=[SizeArray objectAtIndex:row];
        
        return valCountry;
    }
    else{
        NSString *valCountry = ColourTxt.text=[ColorArray objectAtIndex:row];
        
        return valCountry;
        
    }
    
}
#pragma mark TextFieldShouldReturn
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField==StoreNameTxt) {
        
        [StoreWebsiteTxt becomeFirstResponder];
    }
    else if (textField==StoreWebsiteTxt) {
        
        [ProductNameTxt becomeFirstResponder];
    }
    else if (textField==ProductNameTxt) {
        
        [ProductTxt becomeFirstResponder];
    }
    else if (textField==ProductTxt) {
        
        [ColourTxt becomeFirstResponder];
    }
    else if (textField==ColourTxt) {
        
        [SizeTxt becomeFirstResponder];
    }
    else if (textField==SizeTxt) {
        
        [PriceTxt becomeFirstResponder];
        
    } else if (textField==PriceTxt) {
        
        [SpecialTxt becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
        
    }
    
    
    
    return YES;
}


-(BOOL)loginValidation{
    
    
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    
    if(StoreNameTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Store Name"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if(StoreWebsiteTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Store Website"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if (ProductNameTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please enter your Product Name" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if(ProductTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please select your Product sku (optional)"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    
    if(ColourTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Colour preference"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if (SizeTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please enter your Size" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (PriceTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please enter your Price" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (SpecialTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please enter your Special instructions" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    return YES;
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
