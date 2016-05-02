//
//  ProductViewController.m
//  Project
//
//  Created by Possibility Solutions on 13/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController
@synthesize StrValue;
@synthesize store_id;
@synthesize store_name;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    ProductArray = [[[NSMutableArray alloc]init] mutableCopy];

    
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

    
    transactionTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-149) style:UITableViewStylePlain];
    transactionTbl.showsVerticalScrollIndicator=YES;
    transactionTbl.showsHorizontalScrollIndicator=NO;
    transactionTbl.showsVerticalScrollIndicator=NO;
    transactionTbl.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:transactionTbl];
    
    UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"foter-bg.png"]];
    imgLogo.frame=CGRectMake(0,64, self.view.frame.size.width, 93/2);
    [self.view addSubview:imgLogo];
    
    UILabel *ansLbl=[[UILabel alloc] initWithFrame:CGRectMake(10, 75, 50, 20)];
    ansLbl.text=@"Filter";
    ansLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
    ansLbl.textColor=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    ansLbl.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:ansLbl];
    
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(44, 83, 21/2, 13/2)];
    img.image=[UIImage imageNamed:@"arrow_down.png"];
    [self.view addSubview:img];
    
    UILabel *CategoryLbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-160, 75, 150, 20)];
    CategoryLbl.text=@"SHOP BY CATEGORY";
    CategoryLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
    CategoryLbl.textColor=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    CategoryLbl.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:CategoryLbl];
    
    
    
    
    [self buttonCategory];

   
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UIView *customView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    
    
    UIButton  *BackBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    BackBtn.frame=CGRectMake(10, 30, 24/2, 40/2);
    [BackBtn setImage:[UIImage imageNamed:@"BackBtn@2x.png"] forState:UIControlStateNormal];
    [BackBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:BackBtn];
    
    
    
    UIButton  *BackBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    BackBtn1.frame=CGRectMake(0/2, 30, 100, 50);
    [BackBtn1 addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:BackBtn1];
    

    
    
    UIButton *plusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    plusBtn.adjustsImageWhenHighlighted=NO;
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"plus@2x.png"] forState:UIControlStateNormal];
    plusBtn.frame=CGRectMake(self.view.frame.size.width-50, 35, 34/2, 31/2);
    //[plusBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:plusBtn];
    
    
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.adjustsImageWhenHighlighted=NO;
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search@2x.png"] forState:UIControlStateNormal];
    searchBtn.frame=CGRectMake(self.view.frame.size.width-20, 35, 30/2, 30/2);
    [searchBtn addTarget:self action:@selector(searchBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:searchBtn];
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=store_name;
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
}
-(void)searchBtnPressed{
    SearchCategoryViewController *search=[[SearchCategoryViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
    
}
-(void)buttonCategory{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Product" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"Product" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [dict setValue:store_id forKey:@"id"];
    [delObj PostWebServer:dict type:@"Product"];
    
    
}
-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    ProductArray = [(NSMutableArray *)[NSArray arrayWithArray:[dict valueForKey:@"result"]] mutableCopy];
    NSLog(@"..ProductArray..%@",ProductArray);
    
    transactionTbl.dataSource=self;
    transactionTbl.delegate=self;
    [transactionTbl reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
        
        NSInteger i;
        
        
        if ([ProductArray count]>0) {
            
            
            if ([ProductArray count]%2==1) {
                ;
                
                
                i=[ProductArray count]/2;
                
                i=i+1;
                
                return i;
            }
            else{
                
                i=[ProductArray count]/2;
               // i=i+1;
                
                return i;
                
            }
        }
        else{
            
            i=1;
            return i;
        }
        
        
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
        
        if ([ProductArray count]) {
            
            
            
            
            if (self.view.frame.size.height>568)
                
            {
                
                return 320;
                
            }
            else{
                
                if (indexPath.row==0) {
                    
                    return 230;
                    
                }
                else{
                    return 225;
                    
                }
                
            }
            
        }
        else{
            return 200;
            
        }
    
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    
        if ([ProductArray count]) {
            
            if (self.view.frame.size.height>568)
                
                
            {
                
                if (self.view.frame.size.height==667) {
                    
                    
                    CGFloat x=10;
                    NSInteger i=indexPath.row*2;
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                    
                    for (int j=0; j<=1; j++) {
                        
                        if (i<[ProductArray count]) {
                            
                            if (i==0) {
                                
                                
                                
                                
                                UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box.png"]];
                                imgLogo.frame=CGRectMake(10,20, 172, 290);
                                imgLogo.userInteractionEnabled=YES;
                                [cell.contentView addSubview:imgLogo];
                                
                                
                                UIButton *readMore=[UIButton buttonWithType:UIButtonTypeCustom];
                                readMore.frame=CGRectMake(10,20, 190, 235);
                                readMore.showsTouchWhenHighlighted=YES;
                                readMore.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
                                [readMore setTitleColor:[UIColor blueColor ] forState:UIControlStateNormal];
                                readMore.tag=i;
                                [readMore addTarget:self action:@selector(prodctDetail:) forControlEvents:UIControlEventTouchUpInside];
                                [cell.contentView addSubview:readMore];
                                
                                
                                
                                
                                UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(x, 0, 170, 20)];
                                title.text=[[ProductArray objectAtIndex:i] valueForKey:@"title"];
                                title.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                title.textColor=[UIColor blackColor];
                                title.textAlignment=NSTextAlignmentLeft;
                                title.backgroundColor=[UIColor clearColor];
                                [cell.contentView addSubview:title];
                                
                                
                                NSMutableArray *images=[[ProductArray objectAtIndex:i] valueForKey:@"images"];
                                
                                if ([images count]) {
                                    
                                    AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(x+5, 25, 162, 240)];
                                    imageView.contentMode=UIViewContentModeScaleAspectFill;
                                    imageView.clipsToBounds=YES;
                                    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
                                    imageView.imageURL=[NSURL URLWithString:[images objectAtIndex:0]];
                                    [cell addSubview:imageView];
                                    
                                }
                                else{
                                    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(15, 25, 180, 240)];
                                    img.image=[UIImage imageNamed:@"image.png"];
                                    [cell.contentView addSubview:img];
                                    
                                }
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                UIImageView *imgtime=[[UIImageView alloc] initWithFrame:CGRectMake(x+153, 275, 26/2, 23/2)];
                                imgtime.image=[UIImage imageNamed:@"Forma-143.png"];
                                [cell.contentView addSubview:imgtime];
                                
                                
                                UILabel *CategoryLbl=[[UILabel alloc] initWithFrame:CGRectMake(15, 270, 150, 20)];
                                CategoryLbl.text=[[ProductArray objectAtIndex:i] valueForKey:@"brand"];
                                CategoryLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                CategoryLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                                CategoryLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:CategoryLbl];
                                
                                UILabel *NumberLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+130, 270, 150, 20)];
                                NumberLbl.text=@"412";
                                NumberLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                NumberLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                                NumberLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:NumberLbl];
                                
                                
                                UILabel *TxtLbl=[[UILabel alloc] initWithFrame:CGRectMake(15, 290, 150, 20)];
                                TxtLbl.text=store_name;
                                TxtLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                TxtLbl.textColor=[UIColor colorWithRed:221.0/255.0 green:43.0/255.0 blue:36.0/255.0 alpha:1.0];
                                TxtLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:TxtLbl];
                                
                                
                                UILabel *price=[[UILabel alloc] initWithFrame:CGRectMake(x+200-70, 290, 35, 20)];
                                price.text=[NSString stringWithFormat:@"$%@",[[ProductArray objectAtIndex:i] valueForKey:@"price"]];
                                price.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                price.textColor=[UIColor redColor];
                                price.textAlignment=NSTextAlignmentRight;
                                price.backgroundColor=[UIColor clearColor];
                                [cell.contentView addSubview:price];
                                
                                
                                
                                //                                UIButton *readMore=[UIButton buttonWithType:UIButtonTypeCustom];
                                //                                readMore.frame=CGRectMake(x+113, 190, 141/2, 36/2);
                                //                                [readMore setImage:[UIImage imageNamed:@"buy.png"] forState:UIControlStateNormal];
                                //                                readMore.showsTouchWhenHighlighted=YES;
                                //                                readMore.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
                                //                                [readMore setTitleColor:[UIColor blueColor ] forState:UIControlStateNormal];
                                //                                readMore.tag=i;
                                //                                [readMore addTarget:self action:@selector(sendAnswer:) forControlEvents:UIControlEventTouchUpInside];
                                //                                [cell.contentView addSubview:readMore];
                                //
                                
                                i=i+1;
                                x=x+184;
                            }
                            
                            else{
                                
                                
                                UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(x, 0, 170, 20)];
                                title.text=[[ProductArray objectAtIndex:i] valueForKey:@"title"];
                                title.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                title.textColor=[UIColor blackColor];
                                title.textAlignment=NSTextAlignmentLeft;
                                title.backgroundColor=[UIColor clearColor];
                                [cell.contentView addSubview:title];
                                
                                
                                
                                
                                
                                
                                UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box.png"]];
                                imgLogo.frame=CGRectMake(x,20, 172, 290);
                                [cell.contentView addSubview:imgLogo];
                                
                                
                                
                                UIButton *readMore=[UIButton buttonWithType:UIButtonTypeCustom];
                                readMore.frame=CGRectMake(x,20, 190, 235);
                                readMore.showsTouchWhenHighlighted=YES;
                                readMore.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
                                [readMore setTitleColor:[UIColor blueColor ] forState:UIControlStateNormal];
                                readMore.tag=i;
                                [readMore addTarget:self action:@selector(prodctDetail:) forControlEvents:UIControlEventTouchUpInside];
                                [cell.contentView addSubview:readMore];
                                
                                
                                
                                
                                
                                NSMutableArray *images=[[ProductArray objectAtIndex:i] valueForKey:@"images"];
                                
                                if ([images count]) {
                                    
                                    AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(x+5, 25, 162, 240)];
                                    imageView.contentMode=UIViewContentModeScaleAspectFill;
                                    imageView.clipsToBounds=YES;
                                    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
                                    imageView.imageURL=[NSURL URLWithString:[images objectAtIndex:0]];
                                    [cell addSubview:imageView];
                                    
                                }
                                else{
                                    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(x+5, 25, 180, 240)];
                                    img.image=[UIImage imageNamed:@"image.png"];
                                    [cell.contentView addSubview:img];
                                    
                                }
                                
                                
                                
                                UIImageView *imgtime=[[UIImageView alloc] initWithFrame:CGRectMake(x+153, 275, 26/2, 23/2)];
                                imgtime.image=[UIImage imageNamed:@"Forma-143.png"];
                                [cell.contentView addSubview:imgtime];
                                
                                
                                
                                UILabel *CategoryLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+10, 270, 150, 20)];
                                CategoryLbl.text=[[ProductArray objectAtIndex:i] valueForKey:@"brand"];
                                CategoryLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                CategoryLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                                CategoryLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:CategoryLbl];
                                
                                UILabel *NumberLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+130, 270, 150, 20)];
                                NumberLbl.text=@"412";
                                NumberLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                NumberLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                                NumberLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:NumberLbl];
                                
                                UILabel *TxtLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+10, 290, 150, 20)];
                                TxtLbl.text=store_name;
                                TxtLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                TxtLbl.textColor=[UIColor colorWithRed:221.0/255.0 green:43.0/255.0 blue:36.0/255.0 alpha:1.0];
                                TxtLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:TxtLbl];
                                
                                
                                UILabel *price=[[UILabel alloc] initWithFrame:CGRectMake(x+200-70, 290, 35, 20)];
                                price.text=[NSString stringWithFormat:@"$%@",[[ProductArray objectAtIndex:i] valueForKey:@"price"]];
                                price.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                price.textColor=[UIColor redColor];
                                price.textAlignment=NSTextAlignmentRight;
                                price.backgroundColor=[UIColor clearColor];
                                [cell.contentView addSubview:price];
                                
                                
                                
                                
                                
                                //                                UIButton *readMore=[UIButton buttonWithType:UIButtonTypeCustom];
                                //                                readMore.frame=CGRectMake(x+113, 190, 141/2, 36/2);
                                //                                [readMore setImage:[UIImage imageNamed:@"buy.png"] forState:UIControlStateNormal];                                          readMore.showsTouchWhenHighlighted=YES;
                                //                                readMore.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
                                //                                [readMore setTitleColor:[UIColor blueColor ] forState:UIControlStateNormal];
                                //                                readMore.tag=i;
                                //                                [readMore addTarget:self action:@selector(sendAnswer:) forControlEvents:UIControlEventTouchUpInside];
                                //                                [cell.contentView addSubview:readMore];
                                
                                i=i+1;
                                x=x+184;
                            }
                            
                        }
                        
                        
                    }
                    
                }
                else{
                    
                    
                    CGFloat x=10;
                    NSInteger i=indexPath.row*2;
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                    
                    for (int j=0; j<=1; j++) {
                        
                        if (i<[ProductArray count]) {
                            
                            if (i==0) {
                                
                                
                                
                                
                                UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box.png"]];
                                imgLogo.frame=CGRectMake(10,20, 190, 290);
                                imgLogo.userInteractionEnabled=YES;
                                [cell.contentView addSubview:imgLogo];
                                
                                
                                UIButton *readMore=[UIButton buttonWithType:UIButtonTypeCustom];
                                readMore.frame=CGRectMake(10,20, 190, 290);
                                readMore.showsTouchWhenHighlighted=YES;
                                readMore.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
                                [readMore setTitleColor:[UIColor blueColor ] forState:UIControlStateNormal];
                                readMore.tag=i;
                                [readMore addTarget:self action:@selector(prodctDetail:) forControlEvents:UIControlEventTouchUpInside];
                                [cell.contentView addSubview:readMore];
                                

                                
                                
                                UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(x, 0, 190, 20)];
                                title.text=[[ProductArray objectAtIndex:i] valueForKey:@"title"];
                                title.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                title.textColor=[UIColor blackColor];
                                title.textAlignment=NSTextAlignmentLeft;
                                title.backgroundColor=[UIColor clearColor];
                                [cell.contentView addSubview:title];
                                
                                
                                NSMutableArray *images=[[ProductArray objectAtIndex:i] valueForKey:@"images"];
                                
                                if ([images count]) {
                                    
                                    AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(x+5, 25, 180, 240)];
                                    imageView.contentMode=UIViewContentModeScaleAspectFill;
                                    imageView.clipsToBounds=YES;
                                    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
                                    imageView.imageURL=[NSURL URLWithString:[images objectAtIndex:0]];
                                    [cell addSubview:imageView];
                                    
                                }
                                else{
                                     UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(15, 25, 180, 185)];
                                    img.image=[UIImage imageNamed:@"image.png"];
                                    [cell.contentView addSubview:img];
                                    
                                }
                                
                                
                                

                                
                                
                                
                                
                                
                                
                                
                                UIImageView *imgtime=[[UIImageView alloc] initWithFrame:CGRectMake(x+173, 275, 26/2, 23/2)];
                                imgtime.image=[UIImage imageNamed:@"Forma-143.png"];
                                [cell.contentView addSubview:imgtime];
                                
                                
                                UILabel *CategoryLbl=[[UILabel alloc] initWithFrame:CGRectMake(15, 270, 150, 20)];
                                CategoryLbl.text=[[ProductArray objectAtIndex:i] valueForKey:@"brand"];
                                CategoryLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                CategoryLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                                CategoryLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:CategoryLbl];
                                
                                UILabel *NumberLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+150, 270, 150, 20)];
                                NumberLbl.text=@"412";
                                NumberLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                NumberLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                                NumberLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:NumberLbl];
                                
                                
                                UILabel *TxtLbl=[[UILabel alloc] initWithFrame:CGRectMake(15, 290, 150, 20)];
                                TxtLbl.text=store_name;
                                TxtLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                TxtLbl.textColor=[UIColor colorWithRed:221.0/255.0 green:43.0/255.0 blue:36.0/255.0 alpha:1.0];
                                TxtLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:TxtLbl];
                                
                                
                                UILabel *price=[[UILabel alloc] initWithFrame:CGRectMake(x+200-50, 290, 35, 20)];
                                price.text=[NSString stringWithFormat:@"$%@",[[ProductArray objectAtIndex:i] valueForKey:@"price"]];
                                price.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                price.textColor=[UIColor redColor];
                                price.textAlignment=NSTextAlignmentRight;
                                price.backgroundColor=[UIColor clearColor];
                                [cell.contentView addSubview:price];
                     
                                i=i+1;
                                x=x+205;
                            }
                            
                            else{
                                
                                
                                UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(x, 0, 190, 20)];
                                title.text=[[ProductArray objectAtIndex:i] valueForKey:@"title"];
                                title.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                title.textColor=[UIColor blackColor];
                                title.textAlignment=NSTextAlignmentLeft;
                                title.backgroundColor=[UIColor clearColor];
                                [cell.contentView addSubview:title];
                                
                                
                                
                                
                                
                                
                                UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box.png"]];
                                imgLogo.frame=CGRectMake(x,20, 190, 290);
                                [cell.contentView addSubview:imgLogo];
                                
                                
                                
                                UIButton *readMore=[UIButton buttonWithType:UIButtonTypeCustom];
                                readMore.frame=CGRectMake(x,20, 190, 235);
                                readMore.showsTouchWhenHighlighted=YES;
                                readMore.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
                                [readMore setTitleColor:[UIColor blueColor ] forState:UIControlStateNormal];
                                readMore.tag=i;
                                [readMore addTarget:self action:@selector(prodctDetail:) forControlEvents:UIControlEventTouchUpInside];
                                [cell.contentView addSubview:readMore];
                                

                                
                                
                                
                                NSMutableArray *images=[[ProductArray objectAtIndex:i] valueForKey:@"images"];
                                
                                if ([images count]) {
                                    
                                    AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(x+5, 25, 180, 240)];
                                    imageView.contentMode=UIViewContentModeScaleAspectFill;
                                    imageView.clipsToBounds=YES;
                                    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
                                    imageView.imageURL=[NSURL URLWithString:[images objectAtIndex:0]];
                                    [cell addSubview:imageView];
                                    
                                }
                                else{
                                    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(x+5, 25, 180, 240)];
                                    img.image=[UIImage imageNamed:@"image.png"];
                                    [cell.contentView addSubview:img];
                                    
                                }
                                
                                
                                
                                UIImageView *imgtime=[[UIImageView alloc] initWithFrame:CGRectMake(x+173, 275, 26/2, 23/2)];
                                imgtime.image=[UIImage imageNamed:@"Forma-143.png"];
                                [cell.contentView addSubview:imgtime];
                                
                                
                                
                                UILabel *CategoryLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+10, 270, 150, 20)];
                                CategoryLbl.text=[[ProductArray objectAtIndex:i] valueForKey:@"brand"];
                                CategoryLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                CategoryLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                                CategoryLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:CategoryLbl];
                                
                                UILabel *NumberLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+150, 270, 150, 20)];
                                NumberLbl.text=@"412";
                                NumberLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                NumberLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                                NumberLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:NumberLbl];
                                
                                UILabel *TxtLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+10, 290, 150, 20)];
                                TxtLbl.text=store_name;
                                TxtLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                TxtLbl.textColor=[UIColor colorWithRed:221.0/255.0 green:43.0/255.0 blue:36.0/255.0 alpha:1.0];
                                TxtLbl.textAlignment=NSTextAlignmentLeft;
                                [cell.contentView addSubview:TxtLbl];
                                
                                
                                UILabel *price=[[UILabel alloc] initWithFrame:CGRectMake(x+200-50, 290, 35, 20)];
                                price.text=[NSString stringWithFormat:@"$%@",[[ProductArray objectAtIndex:i] valueForKey:@"price"]];
                                price.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                                price.textColor=[UIColor redColor];
                                price.textAlignment=NSTextAlignmentRight;
                                price.backgroundColor=[UIColor clearColor];
                                [cell.contentView addSubview:price];
                                
                                i=i+1;
                                x=x+205;
                            }
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            else{
                
                CGFloat x=10;
                NSInteger i=indexPath.row*2;
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                
                for (int j=0; j<=[ProductArray count]; j++) {
                    
                    if (i<[ProductArray count]) {
                        
                        if (i==0) {
                            
                            
                            
                            
                            UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(x, 0, 115, 20)];
                            title.text=[[ProductArray objectAtIndex:i] valueForKey:@"title"];
                            title.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            title.textColor=[UIColor blackColor];
                            title.textAlignment=NSTextAlignmentLeft;
                            title.backgroundColor=[UIColor clearColor];
                            [cell.contentView addSubview:title];
                            
                            UILabel *price=[[UILabel alloc] initWithFrame:CGRectMake(x+155-45, 0, 35, 20)];
                            price.text=[NSString stringWithFormat:@"$%@",[[ProductArray objectAtIndex:i] valueForKey:@"price"]];
                            price.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            price.textColor=[UIColor redColor];
                            price.textAlignment=NSTextAlignmentRight;
                            price.backgroundColor=[UIColor clearColor];
                            [cell.contentView addSubview:price];
                            
                            
                            UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box.png"]];
                            imgLogo.frame=CGRectMake(10,20, 299/2, 390/2);
                            [cell.contentView addSubview:imgLogo];
                        
                            
                            NSMutableArray *images=[[ProductArray objectAtIndex:i] valueForKey:@"images"];
                            
                            if ([images count]) {
                                
                                AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(x+5, 25, 276/2, 283/2)];
                                imageView.contentMode=UIViewContentModeScaleAspectFill;
                                imageView.clipsToBounds=YES;
                                [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
                                imageView.imageURL=[NSURL URLWithString:[images objectAtIndex:0]];
                                [cell addSubview:imageView];
                                
                            }
                            else{
                                UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(x+5, 25, 276/2, 283/2)];
                                img.image=[UIImage imageNamed:@"image.png"];
                                [cell.contentView addSubview:img];
                                
                            }
                            
                            
                            
                            UIImageView *imgtime=[[UIImageView alloc] initWithFrame:CGRectMake(x+130, 175, 26/2, 23/2)];
                            imgtime.image=[UIImage imageNamed:@"Forma-143.png"];
                            [cell.contentView addSubview:imgtime];

                            
                            UILabel *CategoryLbl=[[UILabel alloc] initWithFrame:CGRectMake(15, 170, 150, 20)];
                            CategoryLbl.text=@"Skull with snake";
                            CategoryLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            CategoryLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                            CategoryLbl.textAlignment=NSTextAlignmentLeft;
                            [cell.contentView addSubview:CategoryLbl];
                            
                            UILabel *NumberLbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-80)/2, 170, 150, 20)];
                            NumberLbl.text=@"412";
                            NumberLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            NumberLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                            NumberLbl.textAlignment=NSTextAlignmentLeft;
                            [cell.contentView addSubview:NumberLbl];
                            
                            
                            UILabel *TxtLbl=[[UILabel alloc] initWithFrame:CGRectMake(15, 190, 150, 20)];
                            TxtLbl.text=[[ProductArray objectAtIndex:i] valueForKey:@"brand"];
                            TxtLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            TxtLbl.textColor=[UIColor colorWithRed:221.0/255.0 green:43.0/255.0 blue:36.0/255.0 alpha:1.0];
                            TxtLbl.textAlignment=NSTextAlignmentLeft;
                            [cell.contentView addSubview:TxtLbl];

                            UIButton *readMore=[UIButton buttonWithType:UIButtonTypeCustom];
                            readMore.frame=CGRectMake(x+75, 190, 141/2, 36/2);
                            [readMore setImage:[UIImage imageNamed:@"buy.png"] forState:UIControlStateNormal];
                            readMore.showsTouchWhenHighlighted=YES;
                            readMore.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
                            [readMore setTitleColor:[UIColor blueColor ] forState:UIControlStateNormal];
                            readMore.tag=i;
                            [readMore addTarget:self action:@selector(sendAnswer:) forControlEvents:UIControlEventTouchUpInside];
                            [cell.contentView addSubview:readMore];
                            
                    
                            i=i+1;
                            x=x+155;
                        }
                        
                        else{
                            
                            UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(x, 0, 115, 20)];
                            title.text=[[ProductArray objectAtIndex:i] valueForKey:@"title"];
                            title.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            title.textColor=[UIColor blackColor];
                            title.textAlignment=NSTextAlignmentLeft;
                            title.backgroundColor=[UIColor clearColor];
                            [cell.contentView addSubview:title];
                            
                            UILabel *price=[[UILabel alloc] initWithFrame:CGRectMake(x+155-45, 0, 35, 20)];
                            price.text=[NSString stringWithFormat:@"$%@",[[ProductArray objectAtIndex:i] valueForKey:@"price"]];
                            price.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            price.textColor=[UIColor redColor];
                            price.textAlignment=NSTextAlignmentRight;
                            price.backgroundColor=[UIColor clearColor];
                            [cell.contentView addSubview:price];
                            

                            
                            
                            
                            UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box.png"]];
                            imgLogo.frame=CGRectMake(x,20, 299/2, 390/2);
                            [cell.contentView addSubview:imgLogo];
                            
                            
                           // UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(x+5, 25, 276/2, 283/2)];
                          //  img.image=[UIImage imageNamed:@"image.png"];
                          //  [cell.contentView addSubview:img];
                            
                            
                            
                            
                            NSMutableArray *images=[[ProductArray objectAtIndex:i] valueForKey:@"images"];
                            
                            if ([images count]) {
                                
                                AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(x+5, 25, 276/2, 283/2)];
                                imageView.contentMode=UIViewContentModeScaleAspectFill;
                                imageView.clipsToBounds=YES;
                                [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
                                imageView.imageURL=[NSURL URLWithString:[images objectAtIndex:0]];
                                [cell addSubview:imageView];
                                
                            }
                            else{
                                UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(x+5, 25, 276/2, 283/2)];
                                img.image=[UIImage imageNamed:@"image.png"];
                                [cell.contentView addSubview:img];
                                
                            }

                            
                            
                            
                            UIImageView *imgtime=[[UIImageView alloc] initWithFrame:CGRectMake(x+130, 175, 26/2, 23/2)];
                            imgtime.image=[UIImage imageNamed:@"Forma-143.png"];
                            [cell.contentView addSubview:imgtime];
                            
                            
                            
                            UILabel *CategoryLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+10, 170, 150, 20)];
                            CategoryLbl.text=@"Skull with snake";
                            CategoryLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            CategoryLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                            CategoryLbl.textAlignment=NSTextAlignmentLeft;
                            [cell.contentView addSubview:CategoryLbl];
                            
                            UILabel *NumberLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+110, 170, 150, 20)];
                            NumberLbl.text=@"412";
                            NumberLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            NumberLbl.textColor=[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:109.0/255.0 alpha:1.0];
                            NumberLbl.textAlignment=NSTextAlignmentLeft;
                            [cell.contentView addSubview:NumberLbl];
                            
                            UILabel *TxtLbl=[[UILabel alloc] initWithFrame:CGRectMake(x+10, 190, 150, 20)];
                            TxtLbl.text=[[ProductArray objectAtIndex:i] valueForKey:@"brand"];
                            TxtLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
                            TxtLbl.textColor=[UIColor colorWithRed:221.0/255.0 green:43.0/255.0 blue:36.0/255.0 alpha:1.0];
                            TxtLbl.textAlignment=NSTextAlignmentLeft;
                            [cell.contentView addSubview:TxtLbl];
                            
                            
                            UIButton *readMore=[UIButton buttonWithType:UIButtonTypeCustom];
                            readMore.frame=CGRectMake(x+75, 190, 141/2, 36/2);
                            [readMore setImage:[UIImage imageNamed:@"buy.png"] forState:UIControlStateNormal];                                          readMore.showsTouchWhenHighlighted=YES;
                            readMore.titleLabel.font=[UIFont fontWithName:@"Arial" size:13];
                            [readMore setTitleColor:[UIColor blueColor ] forState:UIControlStateNormal];
                            readMore.tag=i;
                            [readMore addTarget:self action:@selector(sendAnswer:) forControlEvents:UIControlEventTouchUpInside];
                            [cell.contentView addSubview:readMore];

                            i=i+1;
                            x=x+155;
                        }
                        
                        
                    }
                    
                    
                }
            }
            
            
            
        }
        else{
            
            
            UILabel *Answer=[[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
            Answer.text=@"No Record Found";
            Answer.font=[UIFont fontWithName:@"Arial" size:25];
            Answer.textColor=[UIColor blackColor];
            Answer.textAlignment=NSTextAlignmentCenter;
            Answer.backgroundColor=[UIColor clearColor];
            [cell.contentView addSubview:Answer];
            
            
        
        }
        
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    if (indexPath.row==0) {
//        
//        ProductDetailViewController *ProductDetail=[[ProductDetailViewController alloc]init];
//        ProductDetail.product_id=[[ProductArray objectAtIndex:indexPath.row]valueForKey:@"id"];
//        [self.navigationController pushViewController:ProductDetail animated:YES];
//        
//    }
//       else{
//        
//           ProductDetailViewController *ProductDetail=[[ProductDetailViewController alloc]init];
//           ProductDetail.product_id=[[ProductArray objectAtIndex:indexPath.row]valueForKey:@"id"];
//           [self.navigationController pushViewController:ProductDetail animated:YES];
//    }
    
}

-(void)prodctDetail:(id)sender{
    
    
    UIButton *btn=(UIButton *)sender;
    TagValue=btn.tag;
    
    
    ProductDetailViewController *ProductDetail=[[ProductDetailViewController alloc]init];
    ProductDetail.product_id=[[ProductArray objectAtIndex:TagValue]valueForKey:@"id"];
    [self.navigationController pushViewController:ProductDetail animated:YES];





}



-(void)sendAnswer:(id)sender{
    
    UIButton *btn=(UIButton *)sender;
    TagValue=btn.tag;
    
    
    
    
    mainView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mainView];
    mainView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"transprent@2x.png" inBundle:nil compatibleWithTraitCollection:nil]];
    [self.view bringSubviewToFront:mainView];
    
    
    
    
    
    UIImageView *ImgIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup-bg.png"]];
    ImgIcon.frame=CGRectMake((self.view.frame.size.width-258)/2,180, 517/2, 290);
    ImgIcon.userInteractionEnabled=YES;
    [mainView addSubview:ImgIcon];
    
    
    NSMutableArray *images=[[ProductArray objectAtIndex:TagValue] valueForKey:@"images"];
    
    if ([images count]) {
        
        AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(70,10, 120, 120)];
        imageView.contentMode=UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds=YES;
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
        imageView.layer.cornerRadius=7.0;
        imageView.layer.borderWidth=0.5;
        imageView.layer.borderColor=[UIColor lightGrayColor].CGColor;
        imageView.imageURL=[NSURL URLWithString:[images objectAtIndex:0]];
        [ImgIcon addSubview:imageView];
        
    }
    else{
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(70,10, 120, 120)];
        img.image=[UIImage imageNamed:@"image.png"];
        [ImgIcon addSubview:img];
        
    }


    
    UILabel *Productlbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 135, 100, 20)];
    Productlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    Productlbl.text=@"PRODUCT :";
    Productlbl.textAlignment=NSTextAlignmentRight;
    Productlbl.textColor=[UIColor redColor];
    [ImgIcon addSubview:Productlbl];
    
    lbl=[[UILabel alloc] initWithFrame:CGRectMake(123, 136, 100, 20)];
    lbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
    lbl.text=[[ProductArray objectAtIndex:btn.tag]valueForKey:@"brand"];
    [lbl setBackgroundColor:[UIColor clearColor]];
    lbl.textAlignment=NSTextAlignmentLeft;
    lbl.textColor=[UIColor blackColor];
    [ImgIcon addSubview:lbl];
    
    UILabel *Storelbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 160, 100, 20)];
    Storelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    Storelbl.text=@"STORE :";
    Storelbl.textAlignment=NSTextAlignmentRight;
    Storelbl.textColor=[UIColor redColor];
    [ImgIcon addSubview:Storelbl];
    
    lbl1=[[UILabel alloc] initWithFrame:CGRectMake(123, 162, 80, 20)];
    lbl1.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
    lbl1.text=[[ProductArray objectAtIndex:btn.tag]valueForKey:@"storeName"];
    [lbl1 setBackgroundColor:[UIColor clearColor]];
    lbl1.textAlignment=NSTextAlignmentLeft;
    lbl1.textColor=[UIColor blackColor];
    [ImgIcon addSubview:lbl1];
    
    UILabel *Pricelbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 185, 100, 20)];
    Pricelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    Pricelbl.text=@"PRICE :";
    Pricelbl.textAlignment=NSTextAlignmentRight;
    Pricelbl.textColor=[UIColor redColor];
    [ImgIcon addSubview:Pricelbl];
    
    lbl2=[[UILabel alloc] initWithFrame:CGRectMake(123, 186, 80, 20)];
    lbl2.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
    lbl2.text=[NSString stringWithFormat:@"$%@",[[ProductArray objectAtIndex:btn.tag]valueForKey:@"price"]];
    [lbl2 setBackgroundColor:[UIColor clearColor]];
    lbl2.textAlignment=NSTextAlignmentLeft;
    lbl2.textColor=[UIColor blackColor];
    [ImgIcon addSubview:lbl2];
    
    
    Sizelbl=[[UILabel alloc] initWithFrame:CGRectMake(50, 207, 199/2, 39/2)];
    Sizelbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    Sizelbl.text=@"Size";
    Sizelbl.userInteractionEnabled=YES;
    Sizelbl.textAlignment=NSTextAlignmentCenter;
    Sizelbl.textColor=[UIColor redColor];
    [ImgIcon addSubview:Sizelbl];
    
    SizeIconBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    SizeIconBtn.frame=CGRectMake(50,207, 119/2, 39/2);
    [SizeIconBtn setBackgroundColor:[UIColor clearColor]];
    [SizeIconBtn addTarget:self action:@selector(SizeIconBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:SizeIconBtn];
    
    
    colorlbl=[[UILabel alloc] initWithFrame:CGRectMake(120, 207, 126/2, 39/2)];
    colorlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    colorlbl.text=@"color";
    colorlbl.userInteractionEnabled=YES;
    colorlbl.textAlignment=NSTextAlignmentCenter;
    colorlbl.textColor=[UIColor redColor];
    [ImgIcon addSubview:colorlbl];
    
    ColorIconBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    ColorIconBtn.frame=CGRectMake(120,207, 126/2, 39/2);
    [ColorIconBtn setBackgroundColor:[UIColor clearColor]];
    [ColorIconBtn addTarget:self action:@selector(ColorIconBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:ColorIconBtn];
    
    
    UIImageView *CheckIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddButton@2x.png"]];
    CheckIcon.frame=CGRectMake(10,250, 192/2, 63/2);
    CheckIcon.userInteractionEnabled=YES;
    [ImgIcon addSubview:CheckIcon];
    
    AddItemBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    AddItemBtn.frame=CGRectMake(10,250, 192/2, 63/2);
    [AddItemBtn addTarget:self action:@selector(AddRequest) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:AddItemBtn];
    
    
    UIImageView *GoBackIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cancel.png"]];
    GoBackIcon.frame=CGRectMake(150,250, 192/2, 63/2);
    [ImgIcon addSubview:GoBackIcon];
    
    CancelBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CancelBtn.frame=CGRectMake(150,250, 192/2, 63/2);
    [CancelBtn addTarget:self action:@selector(CancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:CancelBtn];
    
    
}
-(void)AddRequest{
    
    
    NSMutableDictionary *FinalDict=[ProductArray objectAtIndex:TagValue];
    NSLog(@"dict-----%@",FinalDict);
    
    
    NSLog(@"dict value-----%@",[FinalDict valueForKey:@"id"]);
    NSLog(@"dict value-----%@",[FinalDict valueForKey:@"price"]);
    NSLog(@"dict value-----%@",[FinalDict valueForKey:@"quantity"]);
    
    
    NSString *idValue=[FinalDict valueForKey:@"id"];
    NSString *PriceValue=[FinalDict valueForKey:@"price"];
    NSString *QuantityValue=[FinalDict valueForKey:@"quantity"];
    
  
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Cart" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebServiceResponse:) name:@"Cart" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [dict setValue:idValue forKey:@"id"];
    [dict setValue:PriceValue forKey:@"price"];
    [dict setValue:QuantityValue forKey:@"quantity"];
    [dict setValue:Sizelbl.text forKey:@"sizes"];
    [dict setValue:colorlbl.text forKey:@"colors"];
    [delObj PostWebServer:dict type:@"Cart"];
    
    
}


-(void)WebServiceResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    NSLog(@"............%@",dict);
    
    for(UIView *subview in [mainView subviews]) {
        if([subview isKindOfClass:[UIView class]]) {
            [subview removeFromSuperview];
        } else {
            // Do nothing - not a UIButton or subclass instance
        }
    }
    
    
    
    UIImageView *ImgIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"small_box.png"]];
    ImgIcon.frame=CGRectMake((self.view.frame.size.width-258)/2,200, 517/2, 290/2);
    ImgIcon.userInteractionEnabled=YES;
    [mainView addSubview:ImgIcon];
    
    UILabel *Productlbl=[[UILabel alloc] initWithFrame:CGRectMake(30, 40, 230, 20)];
    Productlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    Productlbl.text=@"ITEM SUCCESSFULLY ADDED";
    Productlbl.textAlignment=NSTextAlignmentLeft;
    Productlbl.textColor=[UIColor redColor];
    [ImgIcon addSubview:Productlbl];
    
    UIImageView *checkedimg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checked_item@2x.png"]];
    checkedimg.frame=CGRectMake(5,40, 22,22);
    checkedimg.userInteractionEnabled=YES;
    [ImgIcon addSubview:checkedimg];
    
    
    UIImageView *CheckIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check_out@2x.png"]];
    CheckIcon.frame=CGRectMake(10,90, 192/2, 63/2);
    CheckIcon.userInteractionEnabled=YES;
    [ImgIcon addSubview:CheckIcon];
    
    AddItemBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    AddItemBtn.frame=CGRectMake(10,90, 192/2, 63/2);
    [AddItemBtn addTarget:self action:@selector(CancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:AddItemBtn];
    
    
    UIImageView *GoBackIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"go_back@2x.png"]];
    GoBackIcon.frame=CGRectMake(150,90, 192/2, 63/2);
    [ImgIcon addSubview:GoBackIcon];
    
    CancelBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CancelBtn.frame=CGRectMake(150,90, 192/2, 63/2);
    [CancelBtn addTarget:self action:@selector(CancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:CancelBtn];

    
    
    
    
    
    

}

-(void)CancelBtn{
    
    [mainView removeFromSuperview];
    
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
        
        
        Sizelbl.text=[SizeArray objectAtIndex:row];
    }
    else{
        
        colorlbl.text=[ColorArray objectAtIndex:row];
        
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
        
        NSString *valCountry = Sizelbl.text=[SizeArray objectAtIndex:row];
        
        return valCountry;
    }
    else{
        NSString *valCountry = colorlbl.text=[ColorArray objectAtIndex:row];
        
        return valCountry;
        
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
