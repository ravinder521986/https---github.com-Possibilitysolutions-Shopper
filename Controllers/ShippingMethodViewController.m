//
//  ShippingMethodViewController.m
//  Project
//
//  Created by Possibility Solutions on 27/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "ShippingMethodViewController.h"

@interface ShippingMethodViewController ()

@end

@implementation ShippingMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
   single=[SingleTonClass getInstance];
    
    
    
    
    
    
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
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 20)];
    reallbl.text=@"Shipping Method";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    ShippingTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    ShippingTbl.showsVerticalScrollIndicator=YES;
    ShippingTbl.showsHorizontalScrollIndicator=NO;
    ShippingTbl.showsVerticalScrollIndicator=NO;
    ShippingTbl.dataSource=self;
    ShippingTbl.delegate=self;
    [self.view addSubview:ShippingTbl];
    
    
}

-(void)buttonPressed{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [delObj PostWebServer:dict type:@""];
    
    
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];

    ShippingTbl.dataSource=self;
    ShippingTbl.delegate=self;
    [ShippingTbl reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return 5;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }
    
    if (indexPath.row==0) {
        
        UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        AddToCart.frame=CGRectMake(0,0, self.view.frame.size.width, 77/2);
        AddToCart.userInteractionEnabled=YES;
        
        UIButton *SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SubmitBtn.frame=CGRectMake(0,0, self.view.frame.size.width-20, 38.5);
        [SubmitBtn setBackgroundColor:[UIColor clearColor]];
        [SubmitBtn setTitle:@"Select Shipping method" forState:UIControlStateNormal];
        [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [AddToCart addSubview:SubmitBtn];
        
        [cell.contentView addSubview:AddToCart];
    
        
    }
    else if (indexPath.row==1){
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        img.image=[UIImage imageNamed:@"category_selected@2x.png"];
        [cell addSubview:img];

        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, self.view.frame.size.width-20, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@" Instant shipping";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [img addSubview:Txtlbl];
        
        
    }
    else if (indexPath.row==2){
        
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        img.image=[UIImage imageNamed:@"category_selected@2x.png"];
        [cell addSubview:img];
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, self.view.frame.size.width-20, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"Same day shipping";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [img addSubview:Txtlbl];

        
    }
    else if (indexPath.row==3){
        
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        img.image=[UIImage imageNamed:@"category_selected@2x.png"];
        [cell addSubview:img];
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, self.view.frame.size.width-20, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"Standard Shipping";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [img addSubview:Txtlbl];

    }
    else if (indexPath.row==4){
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        img.image=[UIImage imageNamed:@"category_selected@2x.png"];
        [cell addSubview:img];

        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, self.view.frame.size.width-20, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"Express Shipping";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [img addSubview:Txtlbl];

        

    }
    else{
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        img.image=[UIImage imageNamed:@"category_unselected@2x.png"];
        [cell addSubview:img];
        
    
        

    }
    if ([[[TopicArray objectAtIndex:indexPath.row] valueForKey:@"favourite"]isEqualToString:@"0"]) {
        UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        checkBtn.frame=CGRectMake(self.view.frame.size.width-40, 15, 26, 26);
        [checkBtn setImage:[UIImage imageNamed:@"check-orange@2x.png"] forState:UIControlStateNormal];
        [checkBtn addTarget:self action:@selector(checkBox:) forControlEvents:UIControlEventTouchUpInside];
        checkBtn.tag=indexPath.row;
        [cell addSubview:checkBtn];
        
        
    }
    else{
        
        UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        checkBtn.frame=CGRectMake(self.view.frame.size.width-40, 15, 26, 26);
        [checkBtn setImage:[UIImage imageNamed:@"check-grey@2x.png"] forState:UIControlStateNormal];
        [checkBtn addTarget:self action:@selector(checkBox:) forControlEvents:UIControlEventTouchUpInside];
        checkBtn.tag=indexPath.row;
        [cell addSubview:checkBtn];
    }
    

       return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==1) {
        
        single.shipping_address=@"Instant shipping";
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)checkBox:(id)sender{
    
    
    UIButton *btn=(UIButton *)sender;
    
    NSString *str=[[TopicArray objectAtIndex:btn.tag] valueForKey:@"topicID"];
    
    if ([selectedArray containsObject:str]) {
        [selectedArray removeObject:str];
    }
    else{
        
        [selectedArray addObject:str];
    }
    
    [ShippingTbl reloadData];
    
    
    
    
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)goNext{
    
    
    NSMutableArray *recordArray=[[[NSMutableArray alloc] init] mutableCopy];
    
    if ([selectedArray count]) {
        
        
        for (int i=0; i<[TopicArray count]; i++) {
            
            
            NSString *str=[[TopicArray objectAtIndex:i] valueForKey:@"topicID"];
            
            if ([selectedArray containsObject:str]) {
                
                
                [recordArray addObject:[TopicArray objectAtIndex:i]];
            }
            else{
                
                [selectedArray addObject:str];
            }
            
            
            
            
        }
        
    }
    else{
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Thank You" message:@"Please select your Topic" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
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

