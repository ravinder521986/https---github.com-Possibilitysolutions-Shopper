//
//  OrderViewController.m
//  Project
//
//  Created by Possibility Solutions on 20/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    FinalDict=[[[NSMutableDictionary alloc]init]mutableCopy];
    
    
    
    
    
    
    
    [self buttonPressed];
    
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
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"plus@2x.png"] forState:UIControlStateNormal];
    plusBtn.frame=CGRectMake(self.view.frame.size.width-50, 35, 34/2, 31/2);
    [plusBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:plusBtn];
    
    
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.adjustsImageWhenHighlighted=NO;
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search@2x.png"] forState:UIControlStateNormal];
    searchBtn.frame=CGRectMake(self.view.frame.size.width-20, 35, 30/2, 30/2);
    [searchBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:searchBtn];
    
    
    
    
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
    
    return 8;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        
        return 450;
        
    }
    else if (indexPath.row==1){
        
        return 50;
        
    }
    else if (indexPath.row==2){
        
        return 50;
        
    }
    else if (indexPath.row==3){
        
        
        NSString *content=[FinalDict valueForKey:@"description"];
        CGSize constraint = CGSizeMake(self.view.frame.size.width-20, 20000.0f);
        CGSize size = [content boundingRectWithSize:constraint
                                            options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                         attributes:roboto_regular_12 context:nil].size;
        CGFloat content_height = MAX(size.height, 12.0f);
        return content_height+60;
        
    }
    else if (indexPath.row==4){
        
        return 50;
    }
    else if (indexPath.row==5){
        
        return 50;
        
    }
    else if (indexPath.row==6){
        
        return 90;
        
    }
    else if (indexPath.row==7){
        
        NSString *content=[FinalDict valueForKey:@"description"];
        CGSize constraint = CGSizeMake(self.view.frame.size.width-20, 20000.0f);
        CGSize size = [content boundingRectWithSize:constraint
                                            options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                         attributes:roboto_regular_12 context:nil].size;
        CGFloat content_height = MAX(size.height, 12.0f);
        
        return content_height+370;
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
    
    if (indexPath.row==0) {
        

        
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle@2x.png"]];
        RectangleImg.frame=CGRectMake(10,0,self.view.frame.size.width-20,61/2);
        [cell addSubview:RectangleImg];
        
        UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2,5, 200, 20)];
        lbl.backgroundColor=[UIColor clearColor];
        lbl.text=[FinalDict valueForKey:@"title"];
        lbl.numberOfLines=1;
        lbl.textAlignment=NSTextAlignmentLeft;
        lbl.font=[UIFont fontWithName:@"Arial" size:12];
        lbl.textColor=[UIColor whiteColor];
        [lbl sizeToFit];
        [cell addSubview:lbl];
        
        UILabel *Dollerlbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-75,5, 60, 20)];
        Dollerlbl.backgroundColor=[UIColor clearColor];
        Dollerlbl.text=[NSString stringWithFormat:@"$%@",[FinalDict valueForKey:@"price"]];
        Dollerlbl.numberOfLines=1;
        Dollerlbl.textAlignment=NSTextAlignmentRight;
        Dollerlbl.font=[UIFont fontWithName:@"Arial" size:12];
        Dollerlbl.textColor=[UIColor yellowColor];
        [cell addSubview:Dollerlbl];
        
        UIImageView *PhotoImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_bg_2.png"]];
        PhotoImg.frame=CGRectMake((self.view.frame.size.width-300)/2,305, 103/2,103/2);
        [cell.contentView addSubview:PhotoImg];
        
        UIImageView *PickImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image-nd-bg.png"]];
        PickImg.frame=CGRectMake((self.view.frame.size.width-100)/2,305, 103/2,103/2);
        [cell.contentView addSubview:PickImg];
        
        UIImageView *RectImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle-2.png"]];
        RectImg.frame=CGRectMake(10,355, 607/2,68/2);
        [cell.contentView addSubview:RectImg];
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2,365, 200, 80)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=[FinalDict valueForKey:@"brand"];
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        Txtlbl.textColor=[UIColor whiteColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        
        
    }
    else if (indexPath.row==1){
        
        
        
    }
    else if (indexPath.row==2){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,15, 100, 80)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"FAVOURITE BY";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Picture.png"]];
        PiKImg.frame=CGRectMake((self.view.frame.size.width-50)/2, 15, 51/2,50/2);
        [cell.contentView addSubview:PiKImg];
        
        UIImageView *PiK1Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Picture.png"]];
        PiK1Img.frame=CGRectMake((self.view.frame.size.width+10)/2,15, 51/2,50/2);
        [cell.contentView addSubview:PiK1Img];
        
        UIImageView *PiK2Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Picture.png"]];
        PiK2Img.frame=CGRectMake((self.view.frame.size.width+70)/2, 15, 51/2,50/2);
        [cell.contentView addSubview:PiK2Img];
        
        UIImageView *PiK3Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Picture.png"]];
        PiK3Img.frame=CGRectMake((self.view.frame.size.width+130)/2, 15, 51/2,50/2);
        [cell.contentView addSubview:PiK3Img];
        
        UIImageView *PiK4Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Picture.png"]];
        PiK4Img.frame=CGRectMake((self.view.frame.size.width+190)/2, 15, 51/2,50/2);
        [cell.contentView addSubview:PiK4Img];
        
        
        UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
        LineImg.frame=CGRectMake(0,49, self.view.frame.size.width ,2/2);
        [cell.contentView addSubview:LineImg];
        
        UILabel *Ratinglbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+245)/2,20, 200, 80)];
        Ratinglbl.backgroundColor=[UIColor clearColor];
        Ratinglbl.text=@"+ 40";
        Ratinglbl.numberOfLines=1;
        Ratinglbl.textAlignment=NSTextAlignmentLeft;
        Ratinglbl.font=[UIFont fontWithName:@"Arial" size:12];
        Ratinglbl.textColor=[UIColor redColor];
        [Ratinglbl sizeToFit];
        [cell.contentView addSubview:Ratinglbl];
        
    }
    else if (indexPath.row==3){
        
        
        
    }
    else if (indexPath.row==4){
        
        
        
        
        
        
    }
    else if (indexPath.row==5){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,15, 100, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"SHIPPING & RETURN";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plus@_2x.png"]];
        PiKImg.frame=CGRectMake((self.view.frame.size.width+270)/2, 20, 24/2,24/2);
        [cell.contentView addSubview:PiKImg];
        
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
        RectangleImg.frame=CGRectMake(0,49, self.view.frame.size.width ,2/2);
        RectangleImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:RectangleImg];
        
    }
    else if (indexPath.row==6){
        
        
        
    }
    else if (indexPath.row==7){
        
        
        NSString *content_title=[NSString stringWithFormat:@"%@",[FinalDict valueForKey:@"description"]];
        CGSize constraint_title = CGSizeMake(self.view.frame.size.width-20, 20000.0f);
        CGSize size = [content_title boundingRectWithSize:constraint_title
                                                  options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin                                         attributes:Arial_Font context:nil].size;
        CGFloat title_height = MAX(size.height, 12.0f);
        
        
        UILabel*titleLbl=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, 10, self.view.frame.size.width-20, title_height+2)];
        titleLbl.backgroundColor=[UIColor clearColor];
        titleLbl.text=[FinalDict valueForKey:@"description"];
        titleLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:12];
        titleLbl.textColor=[UIColor colorWithRed:75.0/255.0 green:73.0/255.0 blue:85.0/255.0 alpha:1.0];
        titleLbl.textAlignment=NSTextAlignmentLeft;
        titleLbl.numberOfLines=0;
        [cell.contentView addSubview:titleLbl];
        
        UIButton *DesignerBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        DesignerBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,title_height+17, 521/2, 89/2);
        UIImage *regImage = [UIImage imageNamed:@"DESIGNER.png"];
        [DesignerBtn setBackgroundImage:regImage forState:UIControlStateNormal];
        DesignerBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [DesignerBtn addTarget:self action:@selector(DesignerBtn) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:DesignerBtn];
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,title_height+90, 170, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"AMBERCOMBINE & FITCH NY,USA";
        Txtlbl.numberOfLines=2;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        UIImageView *FITCHImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FITCH-pik.png"]];
        FITCHImg.frame=CGRectMake((self.view.frame.size.width-300)/2,title_height+140, 609/2 ,280/2);
        FITCHImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:FITCHImg];
        
        
        UIImageView *StoreImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Storage.png"]];
        StoreImg.frame=CGRectMake((self.view.frame.size.width-260)/2,title_height+300, 521/2 ,89/2);
        StoreImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:StoreImg];
        
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
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

