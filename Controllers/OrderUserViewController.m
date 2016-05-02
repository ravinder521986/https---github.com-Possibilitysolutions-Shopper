//
//  OrderUserViewController.m
//  Project
//
//  Created by Possibility Solutions on 25/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "OrderUserViewController.h"

@interface OrderUserViewController ()

@end

@implementation OrderUserViewController
@synthesize order_dict;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    NSLog(@"order_dict----%@",order_dict);
    single=[SingleTonClass getInstance];

    single.shipping_address=nil;
    single.shipping_address=@"";
    
    
    
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
    
    UIButton *plusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    plusBtn.adjustsImageWhenHighlighted=NO;
    [plusBtn setTitle:@"EDIT" forState:UIControlStateNormal];
    plusBtn.frame=CGRectMake(self.view.frame.size.width-60, 30, 60, 31);
    [plusBtn addTarget:self action:@selector(DoneSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:plusBtn];
    
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"ORDER";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    ProductDetailTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    ProductDetailTbl.showsVerticalScrollIndicator=YES;
    ProductDetailTbl.showsHorizontalScrollIndicator=NO;
    ProductDetailTbl.showsVerticalScrollIndicator=NO;
    ProductDetailTbl.dataSource=self;
    ProductDetailTbl.delegate=self;
    [self.view addSubview:ProductDetailTbl];
    
    
}

-(void)buttonPressed{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ProductDetails" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"ProductDetails" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [delObj PostWebServer:dict type:@"ProductDetails"];
    
    
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    FinalDict=(NSMutableDictionary *)[NSDictionary dictionaryWithDictionary:[dict valueForKey:@"result"]];
    NSLog(@"...FinalDict...%@",FinalDict);
    
    
    
    
    
    ProductDetailTbl.dataSource=self;
    ProductDetailTbl.delegate=self;
    [ProductDetailTbl reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return 6;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        
        return 250;
        
    }
    else if (indexPath.row==1){
        
        return 44;
        
    }
    else if (indexPath.row==2){
        
        return 44;
        
    }
    else if (indexPath.row==3){
        
        
        return 44;
    }
    else if (indexPath.row==4){
        
        return 44;
    }
    else if (indexPath.row==5){
        
        return 133;
    }

    else if (indexPath.row==6){
        
        return 100;
    }
    else{
        
        
        return 0;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    CGFloat x=self.view.frame.size.width/2;

    if (indexPath.row==0) {
        
        
        UIImageView *PhotoImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_bg_2.png"]];
        PhotoImg.frame=CGRectMake(10,10, x-65,123);
        [cell.contentView addSubview:PhotoImg];
        
        UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50,20, 200, 20)];
        lbl.backgroundColor=[UIColor clearColor];
        lbl.text=[order_dict valueForKey:@"title"];
        lbl.numberOfLines=1;
        lbl.textAlignment=NSTextAlignmentLeft;
        lbl.font=[UIFont fontWithName:@"Arial" size:12];
        lbl.textColor=[UIColor blackColor];
        [lbl sizeToFit];
        [cell addSubview:lbl];

      
        
        UILabel *lbl_title=[[UILabel alloc] initWithFrame:CGRectMake(x-50,40, 200, 20)];
        lbl_title.backgroundColor=[UIColor clearColor];
        lbl_title.text=[order_dict valueForKey:@"brand"];
        lbl_title.numberOfLines=1;
        lbl_title.textAlignment=NSTextAlignmentLeft;
        lbl_title.font=[UIFont fontWithName:@"Arial" size:12];
        lbl_title.textColor=[UIColor redColor];
        [lbl_title sizeToFit];
        [cell addSubview:lbl_title];
        
        

        
        Dollerlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+220)/2,20, (self.view.frame.size.width-250)/2, 20)];
        Dollerlbl.backgroundColor=[UIColor clearColor];
        Dollerlbl.text=[NSString stringWithFormat:@"$%@",[order_dict valueForKey:@"price"]];
        Dollerlbl.numberOfLines=1;
        Dollerlbl.textAlignment=NSTextAlignmentRight;
        Dollerlbl.font=[UIFont fontWithName:@"Arial" size:12];
        Dollerlbl.textColor=[UIColor redColor];
        [cell addSubview:Dollerlbl];
        
        
        UILabel *Sizelbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 60, 50, 20)];
        Sizelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Sizelbl.text=@"Size";
        Sizelbl.backgroundColor=[UIColor clearColor];
        Sizelbl.textAlignment=NSTextAlignmentCenter;
        Sizelbl.textColor=[UIColor redColor];
        [cell.contentView addSubview:Sizelbl];
        
        UILabel *lbl1=[[UILabel alloc] initWithFrame:CGRectMake(x+5, 60, 50, 20)];
        lbl1.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
    //    lbl1.text=[[ProductArray objectAtIndex:btn.tag]valueForKey:@"brand"];
        lbl1.text=single.order_size;
        [lbl1 setBackgroundColor:[UIColor clearColor]];
        lbl1.textAlignment=NSTextAlignmentLeft;
        lbl1.textColor=[UIColor blackColor];
        [cell.contentView addSubview:lbl1];
        
        UILabel *Colourlbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 82, 50, 20)];
        Colourlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Colourlbl.text=@"Colour";
        Colourlbl.backgroundColor=[UIColor clearColor];
        Colourlbl.textAlignment=NSTextAlignmentCenter;
        Colourlbl.textColor=[UIColor redColor];
        [cell.contentView addSubview:Colourlbl];
        
        UILabel *lbl2=[[UILabel alloc] initWithFrame:CGRectMake(x+5, 82, 50, 20)];
        lbl2.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
     //   lbl2.text=[[ProductArray objectAtIndex:btn.tag]valueForKey:@"storeName"];
        lbl2.text=single.order_colour;
        [lbl2 setBackgroundColor:[UIColor clearColor]];
        lbl2.textAlignment=NSTextAlignmentLeft;
        lbl2.textColor=[UIColor blackColor];
        [cell.contentView addSubview:lbl2];
        
        UILabel *Qtylbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 104, 50, 20)];
        Qtylbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Qtylbl.text=@"Qty";
        [Qtylbl setBackgroundColor:[UIColor clearColor]];
        Qtylbl.textAlignment=NSTextAlignmentCenter;
        Qtylbl.textColor=[UIColor redColor];
        [cell.contentView addSubview:Qtylbl];
        
        UILabel *lbl3=[[UILabel alloc] initWithFrame:CGRectMake(x+5, 104, 20, 20)];
        lbl3.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        lbl3.text=@": 1";
       // lbl3.text=[NSString stringWithFormat:@"$%@",[[ProductArray objectAtIndex:btn.tag]valueForKey:@"price"]];
        [lbl3 setBackgroundColor:[UIColor clearColor]];
        lbl3.textAlignment=NSTextAlignmentLeft;
        lbl3.textColor=[UIColor blackColor];
        [cell.contentView addSubview:lbl3];
        
        UIImageView *arrowImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow@2x.png"]];
        arrowImg.frame=CGRectMake(x+30, 110, 18/2,10/2);
        //[cell.contentView addSubview:arrowImg];
        
        UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"delete@2x.png"]];
        AddToCart.frame=CGRectMake(x+x-30,110, 26/2, 33/2);
        AddToCart.userInteractionEnabled=YES;
        
        UIButton *SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SubmitBtn.frame=CGRectMake(x+110,110, 26/2, 33/2);
        [SubmitBtn setBackgroundColor:[UIColor clearColor]];
        [SubmitBtn setTitle:@"" forState:UIControlStateNormal];
        [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [SubmitBtn addTarget:self action:@selector(registerBtn:) forControlEvents:UIControlEventTouchUpInside];
        [AddToCart addSubview:SubmitBtn];
        
       // [cell.contentView addSubview:AddToCart];
        

        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        RectangleImg.frame=CGRectMake(0,140,self.view.frame.size.width,77/2);
        RectangleImg.userInteractionEnabled=YES;
        [cell addSubview:RectangleImg];

        
       
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(20,9, 200, 20)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"ORDER SUMMARY";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Txtlbl.textColor=[UIColor whiteColor];
        [Txtlbl sizeToFit];
        [RectangleImg addSubview:Txtlbl];
    
        
        UILabel *SubTotalLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+x-102, 180, 60, 20)];
        SubTotalLbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        [SubTotalLbl setBackgroundColor:[UIColor clearColor]];
        SubTotalLbl.text=@"SubTotal";
        SubTotalLbl.textAlignment=NSTextAlignmentCenter;
        SubTotalLbl.textColor=[UIColor redColor];
        [cell.contentView addSubview:SubTotalLbl];
        
        UILabel *lbl4=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-50, 180, 40, 20)];
        lbl4.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        lbl4.text=[NSString stringWithFormat:@":%@",Dollerlbl.text];
        [lbl4 setBackgroundColor:[UIColor clearColor]];
        lbl4.textAlignment=NSTextAlignmentRight;
        lbl4.textColor=[UIColor blackColor];
        [cell.contentView addSubview:lbl4];
        
        UILabel *Taxlbl=[[UILabel alloc] initWithFrame:CGRectMake(x+x-102, 202, 60, 20)];
        Taxlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Taxlbl.text=@"Tax";
        [Taxlbl setBackgroundColor:[UIColor clearColor]];
        Taxlbl.textAlignment=NSTextAlignmentCenter;
        Taxlbl.textColor=[UIColor redColor];
        [cell.contentView addSubview:Taxlbl];
        
        UILabel *lbl5=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-50, 202, 40, 20)];
        lbl5.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        lbl5.text=@": $30";
        [lbl5 setBackgroundColor:[UIColor clearColor]];
        lbl5.textAlignment=NSTextAlignmentRight;
        lbl5.textColor=[UIColor blackColor];
        [cell.contentView addSubview:lbl5];
        
        UILabel *Shippinglbl=[[UILabel alloc] initWithFrame:CGRectMake(x+x-142, 224, 100, 20)];
        Shippinglbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Shippinglbl.text=@"Total Shipping cost";
        [Shippinglbl setBackgroundColor:[UIColor clearColor]];
        Shippinglbl.textAlignment=NSTextAlignmentCenter;
        Shippinglbl.textColor=[UIColor redColor];
        [cell.contentView addSubview:Shippinglbl];
        
        int totalCost=[[NSString stringWithFormat:@"%@",[Dollerlbl.text stringByReplacingOccurrencesOfString:@"$" withString:@""]] intValue];
        
        int chargeCost=30;
        
        int totolFinal=totalCost+chargeCost;

        
        UILabel *lbl6=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-50, 224, 40, 20)];
        lbl6.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        lbl6.text=[NSString stringWithFormat:@":$%d",totolFinal];
        [lbl6 setBackgroundColor:[UIColor clearColor]];
        lbl6.textAlignment=NSTextAlignmentRight;
        lbl6.textColor=[UIColor blackColor];
        [cell.contentView addSubview:lbl6];
        
        
       

        
    }
    else if (indexPath.row==1){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(20,15, 100, 25)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"PRIVANCY";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
        PiKImg.frame=CGRectMake(x+x-20, 9, 13/2,21/2);
        [cell.contentView addSubview:PiKImg];
        
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
        RectangleImg.frame=CGRectMake(0,43, self.view.frame.size.width ,1);
        RectangleImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:RectangleImg];

        
    }
    else if (indexPath.row==2){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(20,15, 100, 25)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"PAYMENT CARD";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
        PiKImg.frame=CGRectMake(x+x-20, 9, 13/2,21/2);
        [cell.contentView addSubview:PiKImg];

        
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
        RectangleImg.frame=CGRectMake(0,43, self.view.frame.size.width ,1);
        RectangleImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:RectangleImg];
  
    }
    else if (indexPath.row==3){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(20,15, 100, 25)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"SHIPPING METHED";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
        PiKImg.frame=CGRectMake(x+x-20, 9, 13/2,21/2);
        [cell.contentView addSubview:PiKImg];
        
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
        RectangleImg.frame=CGRectMake(0,43, self.view.frame.size.width ,1);
        RectangleImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:RectangleImg];

        
    }
    else if (indexPath.row==4){
        
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(20,10, 150, 25)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Txtlbl.textColor=[UIColor blackColor];
        
        
        NSLog(@"ADDRESS------%@",single.shipping_address);
        
        if ([single.shipping_address isEqualToString:@""]) {
            Txtlbl.text=@"SHIPPING ADDRESS";

        }
        else{
            Txtlbl.text=single.shipping_address;

        }
        [cell.contentView addSubview:Txtlbl];

        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
        PiKImg.frame=CGRectMake(x+x-20, 9, 13/2,21/2);
        [cell.contentView addSubview:PiKImg];
        
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
        RectangleImg.frame=CGRectMake(0,43, self.view.frame.size.width ,1);
        RectangleImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:RectangleImg];
        
 
        
        
        
    }
    else if (indexPath.row==6){
        
        
        {
            
            
            UIImageView *bgColorIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundColor@2x.png"]];
            bgColorIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 179/2);
            bgColorIcon.userInteractionEnabled=YES;
            [cell.contentView addSubview:bgColorIcon];
            

            
            
            UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(40,15, self.view.frame.size.width-50, 20)];
            Txtlbl.backgroundColor=[UIColor clearColor];
            Txtlbl.text=@"Farin";
            Txtlbl.numberOfLines=1;
            Txtlbl.textAlignment=NSTextAlignmentLeft;
            Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
            Txtlbl.textColor=[UIColor blackColor];
            [Txtlbl sizeToFit];
            [bgColorIcon addSubview:Txtlbl];
            
            UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Picture.png"]];
            PiKImg.frame=CGRectMake(10, 10, 51/2,50/2);
            [bgColorIcon addSubview:PiKImg];
            
            
            UILabel *Titlelbl=[[UILabel alloc] initWithFrame:CGRectMake(40,40, self.view.frame.size.width-50, 20)];
            Titlelbl.backgroundColor=[UIColor clearColor];
            Titlelbl.text=@"Lorem ipsum is sumply dummy text of the printing and typesetting industry";
            Titlelbl.numberOfLines=2;
            Titlelbl.textAlignment=NSTextAlignmentLeft;
            Titlelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Titlelbl.textColor=[UIColor blackColor];
            [Titlelbl sizeToFit];
            [bgColorIcon addSubview:Titlelbl];
            
            UILabel *Datelbl=[[UILabel alloc] initWithFrame:CGRectMake(40,75, self.view.frame.size.width-50, 20)];
            Datelbl.backgroundColor=[UIColor clearColor];
            Datelbl.text=@"December 1, 2016";
            Datelbl.numberOfLines=3;
            Datelbl.textAlignment=NSTextAlignmentLeft;
            Datelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Datelbl.textColor=[UIColor blackColor];
            [Datelbl sizeToFit];
            [bgColorIcon addSubview:Datelbl];
            
            UILabel *Timelbl=[[UILabel alloc] initWithFrame:CGRectMake(x+x-50,75, 50, 20)];
            Timelbl.backgroundColor=[UIColor clearColor];
            Timelbl.text=@"3:12";
            Timelbl.numberOfLines=3;
            Timelbl.textAlignment=NSTextAlignmentLeft;
            Timelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Timelbl.textColor=[UIColor blackColor];
            [Timelbl sizeToFit];
            [bgColorIcon addSubview:Timelbl];
            
            
            
            
            UIImageView *replyIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"reply-field@2x.png"]];
            replyIcon.frame=CGRectMake(0,89, self.view.frame.size.width, 89/2);
            replyIcon.userInteractionEnabled=YES;
            [bgColorIcon addSubview:replyIcon];
            

            UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
            
    
            emailTextfield=[[UITextField alloc] init];
            emailTextfield.frame=CGRectMake(10,7.5, self.view.frame.size.width-20, 37);
            emailTextfield.tag=4;
            emailTextfield.delegate=self;
            emailTextfield.borderStyle=UITextBorderStyleNone;
            emailTextfield.textAlignment=NSTextAlignmentLeft;
            emailTextfield.returnKeyType = UIReturnKeyNext;
            emailTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
            emailTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Write a message" attributes:@{NSForegroundColorAttributeName: color}];
            
            
            emailTextfield.keyboardType=UIKeyboardTypeEmailAddress;
            [emailTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
            emailTextfield.autocapitalizationType=UITextAutocapitalizationTypeNone;
            [replyIcon addSubview:emailTextfield];
            
        
            
            UIImageView *emilIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"send-button@2x.png"]];
            emilIcon.frame=CGRectMake(emailTextfield.frame.size.width-25,20, 63/2, 22/2);
            [replyIcon addSubview:emilIcon];
            

        }
    }
    else if (indexPath.row==5){
        
        UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
        AddToCart.frame=CGRectMake((self.view.frame.size.width-260.5)/2,28.5, 521/2, 86/2);
        AddToCart.userInteractionEnabled=YES;
        
        UIButton *SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SubmitBtn.frame=CGRectMake(80,0, 100, 43);
        [SubmitBtn setBackgroundColor:[UIColor clearColor]];
        [SubmitBtn setTitle:@"SUBMIT" forState:UIControlStateNormal];
        [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [SubmitBtn addTarget:self action:@selector(orderBtn) forControlEvents:UIControlEventTouchUpInside];
        [AddToCart addSubview:SubmitBtn];
        
        [cell.contentView addSubview:AddToCart];
        

    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row==4) {
        
        ShippingMethodViewController *address=[[ShippingMethodViewController alloc] init];
        [self.navigationController pushViewController:address animated:YES];
    }
    
    
}

-(void)leftSlider{
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark TextFieldShouldReturn
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
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
    
    
    
    
    return YES;
}
-(void)orderBtn{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Checkout" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(orderResponse:) name:@"Checkout" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [delObj PostWebServer:dict type:@"Checkout"];
    

    
}
-(void)orderResponse:(NSNotification *)dict{
    
    
    
    NSDictionary *dictvalue=[dict userInfo];
    
    NSLog(@"DICT VALUE-----%@",dictvalue);
    
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:@"Checkout is successful" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];
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

