//
//  ProductDetailViewController.m
//  Project
//
//  Created by Possibility Solutions on 17/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController
@synthesize product_id;
@synthesize order_dict;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    FinalDict=[[[NSMutableDictionary alloc]init]mutableCopy];
    
    
    SizeArray=[[[NSMutableArray alloc] init] mutableCopy];
    
    
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
    

    
    selectedImage=0;
    
    
    

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
   // [plusBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:plusBtn];
    
    
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search@2x.png"] forState:UIControlStateNormal];
    searchBtn.frame=CGRectMake(self.view.frame.size.width-20, 35, 30/2, 30/2);
    [searchBtn addTarget:self action:@selector(searchBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:searchBtn];
    
    
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"BROOKLYN";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    ProductDetailTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    ProductDetailTbl.showsVerticalScrollIndicator=YES;
    ProductDetailTbl.showsHorizontalScrollIndicator=NO;
    ProductDetailTbl.showsVerticalScrollIndicator=NO;
    ProductDetailTbl.separatorStyle=UITableViewCellSelectionStyleNone;
    [self.view addSubview:ProductDetailTbl];
    [self buttonPressed];

    
    
}
-(void)searchBtnPressed{
    SearchCategoryViewController *search=[[SearchCategoryViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
    
}

-(void)buttonPressed{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ProductDetails" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"ProductDetails" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [dict setValue:product_id forKey:@"id"];
    [delObj PostWebServer:dict type:@"ProductDetails"];
    
    
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    FinalDict=(NSMutableDictionary *)[NSDictionary dictionaryWithDictionary:[dict valueForKey:@"result"]];
    NSLog(@"...FinalDict...%@",FinalDict);
    
    
    if ([[FinalDict valueForKey:@"sizes"]isEqual:[NSNull null]]) {
    }
    else{
        SizeArray=[[FinalDict valueForKey:@"sizes"] mutableCopy];

    }

    
    
    if ([[FinalDict valueForKey:@"colors"]isEqual:[NSNull null]]) {

    }
    else{
        ColorArray=[[FinalDict valueForKey:@"colors"] mutableCopy];

        
    }

    
    
    
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
        
        return 250;
        
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if (indexPath.row==0) {
    
    
        
        NSMutableArray *images=[FinalDict valueForKey:@"images"];
        
        if ([images count]) {
            
            AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(10,10, self.view.frame.size.width-20,285)];
            imageView.contentMode=UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds=YES;
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:imageView];
            imageView.imageURL=[NSURL URLWithString:[images objectAtIndex:selectedImage]];
            [cell addSubview:imageView];
            
        }
        else{
           
            
        }

        
        
        UIScrollView *scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 297, self.view.frame.size.width, 50)];
        scrollview.userInteractionEnabled=YES;
        scrollview.showsHorizontalScrollIndicator=NO;
        scrollview.showsVerticalScrollIndicator=NO;
        
        [cell.contentView addSubview:scrollview];
        
        int x=5;
        for (int i=0; i<[images count]; i++) {
            
            AsyncImageView *SmallimageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(x,4, 50,50)];
            SmallimageView.contentMode=UIViewContentModeScaleAspectFill;
            SmallimageView.clipsToBounds=YES;
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:SmallimageView];
            SmallimageView.imageURL=[NSURL URLWithString:[images objectAtIndex:i]];
            [scrollview addSubview:SmallimageView];
            
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame=CGRectMake(x, 5, 40, 40);
            btn.tag=i;
            [btn addTarget:self action:@selector(tagProfileBtn:) forControlEvents:UIControlEventTouchUpInside];
            [scrollview addSubview:btn];
            
            
            
            
            x=x+50+5;
            scrollview.contentSize = CGSizeMake(x, 0);
        }
        

        
        
    

    
    
    
    
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle@2x.png"]];
        RectangleImg.frame=CGRectMake(10,10 ,self.view.frame.size.width-20,40);
        [cell addSubview:RectangleImg];
    
        UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(15,20, self.view.frame.size.width-50, 20)];
        lbl.backgroundColor=[UIColor clearColor];
        lbl.text=[FinalDict valueForKey:@"title"];
        lbl.textAlignment=NSTextAlignmentLeft;
        lbl.font=[UIFont fontWithName:@"Arial" size:15];
        lbl.textColor=[UIColor whiteColor];
        [cell addSubview:lbl];
        
        UILabel *Dollerlbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-75,20, 60, 20)];
        Dollerlbl.backgroundColor=[UIColor clearColor];
        Dollerlbl.text=[NSString stringWithFormat:@"$%@",[FinalDict valueForKey:@"price"]];
        Dollerlbl.numberOfLines=1;
        Dollerlbl.textAlignment=NSTextAlignmentRight;
        Dollerlbl.font=[UIFont fontWithName:@"Arial" size:12];
        Dollerlbl.textColor=[UIColor yellowColor];
        [cell addSubview:Dollerlbl];
     
        
        UIImageView *RectImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle-2.png"]];
        RectImg.frame=CGRectMake(10,355,self.view.frame.size.width-20,68/2);
        [cell.contentView addSubview:RectImg];
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(20,365, 150, 80)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=[FinalDict valueForKey:@"brand"];
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Arial-BoldMT" size:13];
        Txtlbl.textColor=[UIColor whiteColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];

        UIImageView *FollowImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"follow_detail@2x.png"]];
        FollowImg.frame=CGRectMake(self.view.frame.size.width-170, 363, 141/2,36/2);
        [cell.contentView addSubview:FollowImg];
        
        
        UIButton *BuyImg=[UIButton buttonWithType:UIButtonTypeCustom];
        [BuyImg setImage:[UIImage imageNamed:@"buy.png"] forState:UIControlStateNormal];
        BuyImg.frame=CGRectMake(self.view.frame.size.width-90,363, 141/2,36/2);
        [BuyImg addTarget:self action:@selector(sendAnswer:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:BuyImg];
        
        
        
        
        
        
        if (self.view.frame.size.height>568) {
            
            UIImageView *FavoriteImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"favourite.png"]];
            FavoriteImg.frame=CGRectMake(22, 400, 31/2,28/2);
            [cell.contentView addSubview:FavoriteImg];
            
            UILabel *Favoritelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,420, 100, 40)];
            Favoritelbl.text=@"Favourite";
            [Favoritelbl setBackgroundColor:[UIColor clearColor]];
            Favoritelbl.numberOfLines=1;
            Favoritelbl.textAlignment=NSTextAlignmentLeft;
            Favoritelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Favoritelbl.textColor=[UIColor blackColor];
            [Favoritelbl sizeToFit];
            [cell.contentView addSubview:Favoritelbl];
            
            UIImageView *CommentImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"comments.png"]];
            CommentImg.frame=CGRectMake(150,400, 27/2,27/2);
            [cell.contentView addSubview:CommentImg];
            
            UILabel *Commentlbl=[[UILabel alloc] initWithFrame:CGRectMake(120,420, 100, 40)];
            Commentlbl.text=@"30 Comments";
            [Commentlbl setBackgroundColor:[UIColor clearColor]];
            Commentlbl.numberOfLines=1;
            Commentlbl.textAlignment=NSTextAlignmentLeft;
            Commentlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Commentlbl.textColor=[UIColor blackColor];
            [Commentlbl sizeToFit];
            [cell.contentView addSubview:Commentlbl];
            
            UIImageView *FriendImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"friends.png"]];
            FriendImg.frame=CGRectMake(260, 400, 35/2,29/2);
            [cell.contentView addSubview:FriendImg];
            
            
            UILabel *Friendlbl=[[UILabel alloc] initWithFrame:CGRectMake(250,420, 100, 40)];
            Friendlbl.text=@"Friends";
            [Friendlbl setBackgroundColor:[UIColor clearColor]];
            Friendlbl.numberOfLines=1;
            Friendlbl.textAlignment=NSTextAlignmentLeft;
            Friendlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Friendlbl.textColor=[UIColor blackColor];
            [Friendlbl sizeToFit];
            [cell.contentView addSubview:Friendlbl];
            
            UIImageView *ShareImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shared.png"]];
            ShareImg.frame=CGRectMake(self.view.frame.size.width-35,400, 26/2,28/2);
            [cell.contentView addSubview:ShareImg];
            
            
            UILabel *Sharelbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-100,420, 90, 20)];
            Sharelbl.text=@"10 Share";
            [Sharelbl setBackgroundColor:[UIColor clearColor]];
            Sharelbl.numberOfLines=1;
            Sharelbl.textAlignment=NSTextAlignmentRight;
            Sharelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Sharelbl.textColor=[UIColor blackColor];
            [cell.contentView addSubview:Sharelbl];
            
            UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
            LineImg.frame=CGRectMake(0,448, self.view.frame.size.width ,1);
            [cell.contentView addSubview:LineImg];
            
            

        }
        else{
            UIImageView *FavoriteImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"favourite.png"]];
            FavoriteImg.frame=CGRectMake((self.view.frame.size.width-280)/2, 400, 31/2,28/2);
            [cell.contentView addSubview:FavoriteImg];
            
            UILabel *Favoritelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,420, 100, 40)];
            Favoritelbl.text=@"Favourite";
            [Favoritelbl setBackgroundColor:[UIColor clearColor]];
            Favoritelbl.numberOfLines=1;
            Favoritelbl.textAlignment=NSTextAlignmentLeft;
            Favoritelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Favoritelbl.textColor=[UIColor blackColor];
            [Favoritelbl sizeToFit];
            [cell.contentView addSubview:Favoritelbl];
            
            UIImageView *CommentImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"comments.png"]];
            CommentImg.frame=CGRectMake((self.view.frame.size.width-90)/2,400, 27/2,27/2);
            [cell.contentView addSubview:CommentImg];
            
            UILabel *Commentlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-150)/2,420, 100, 40)];
            Commentlbl.text=@"30 Comments";
            [Commentlbl setBackgroundColor:[UIColor clearColor]];
            Commentlbl.numberOfLines=1;
            Commentlbl.textAlignment=NSTextAlignmentLeft;
            Commentlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Commentlbl.textColor=[UIColor blackColor];
            [Commentlbl sizeToFit];
            [cell.contentView addSubview:Commentlbl];
            
            UIImageView *FriendImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"friends.png"]];
            FriendImg.frame=CGRectMake((self.view.frame.size.width+70)/2, 400, 35/2,29/2);
            [cell.contentView addSubview:FriendImg];
            
            
            UILabel *Friendlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+50)/2,420, 100, 40)];
            Friendlbl.text=@"Friends";
            [Friendlbl setBackgroundColor:[UIColor clearColor]];
            Friendlbl.numberOfLines=1;
            Friendlbl.textAlignment=NSTextAlignmentLeft;
            Friendlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Friendlbl.textColor=[UIColor blackColor];
            [Friendlbl sizeToFit];
            [cell.contentView addSubview:Friendlbl];
            
            UIImageView *ShareImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shared.png"]];
            ShareImg.frame=CGRectMake((self.view.frame.size.width+250)/2,400, 26/2,28/2);
            [cell.contentView addSubview:ShareImg];
            
            
            UILabel *Sharelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+220)/2,420, 100, 40)];
            Sharelbl.text=@"10 Share";
            [Sharelbl setBackgroundColor:[UIColor clearColor]];
            Sharelbl.numberOfLines=1;
            Sharelbl.textAlignment=NSTextAlignmentLeft;
            Sharelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
            Sharelbl.textColor=[UIColor blackColor];
            [Sharelbl sizeToFit];
            [cell.contentView addSubview:Sharelbl];
            
            UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
            LineImg.frame=CGRectMake(0,448, self.view.frame.size.width ,1);
            [cell.contentView addSubview:LineImg];
            
            

        }
        
        
        
        
        
        
        
    }
    else if (indexPath.row==1){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, 100, 80)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"RATING & REVIEWS";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];

        UILabel *Commentlbl=[[UILabel alloc] initWithFrame:CGRectMake(120,15, 100, 40)];
        Commentlbl.text=@"30 Comments";
        [Commentlbl setBackgroundColor:[UIColor clearColor]];
        Commentlbl.numberOfLines=1;
        Commentlbl.textAlignment=NSTextAlignmentLeft;
        Commentlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
        Commentlbl.textColor=[UIColor redColor];
        [Commentlbl sizeToFit];
        [cell.contentView addSubview:Commentlbl];

        UILabel *Ratinglbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-130,15, 30, 80)];
        Ratinglbl.backgroundColor=[UIColor clearColor];
        Ratinglbl.text=@"4.0";
        Ratinglbl.numberOfLines=1;
        Ratinglbl.textAlignment=NSTextAlignmentLeft;
        Ratinglbl.font=[UIFont fontWithName:@"Arial" size:12];
        Ratinglbl.textColor=[UIColor blackColor];
        [Ratinglbl sizeToFit];
        [cell.contentView addSubview:Ratinglbl];
        
        UIImageView *StarImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star.png"]];
        StarImg.frame=CGRectMake(self.view.frame.size.width-100, 15, 27/2,26/2);
        [cell.contentView addSubview:StarImg];
        
        UIImageView *Star1Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star.png"]];
        Star1Img.frame=CGRectMake(self.view.frame.size.width-80,15, 27/2,26/2);
        [cell.contentView addSubview:Star1Img];
        
        UIImageView *Star2Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star.png"]];
        Star2Img.frame=CGRectMake(self.view.frame.size.width-60, 15, 27/2,26/2);
        [cell.contentView addSubview:Star2Img];
        
        UIImageView *Star3Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star.png"]];
        Star3Img.frame=CGRectMake(self.view.frame.size.width-40, 15, 27/2,26/2);
        [cell.contentView addSubview:Star3Img];
        
        UIImageView *Star_2Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_2.png"]];
        Star_2Img.frame=CGRectMake(self.view.frame.size.width-20, 15, 27/2,26/2);
        [cell.contentView addSubview:Star_2Img];
        
        UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
        LineImg.frame=CGRectMake(0,48, self.view.frame.size.width ,1);
        [cell.contentView addSubview:LineImg];
        

        
    }
    else if (indexPath.row==2){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, 100, 80)];
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

        
        UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
        LineImg.frame=CGRectMake(0,48, self.view.frame.size.width ,1);
        [cell.contentView addSubview:LineImg];
        UILabel *Ratinglbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-180,15, 170, 20)];
        Ratinglbl.backgroundColor=[UIColor clearColor];
        Ratinglbl.text=@"+ 40";
        Ratinglbl.numberOfLines=1;
        Ratinglbl.textAlignment=NSTextAlignmentRight;
        Ratinglbl.font=[UIFont fontWithName:@"Arial" size:12];
        Ratinglbl.textColor=[UIColor redColor];
        [cell.contentView addSubview:Ratinglbl];
        
    }
    else if (indexPath.row==3){
        
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,10, 100, 20)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"DESCRIPTION";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle-3.png"]];
        LineImg.frame=CGRectMake((self.view.frame.size.width+270)/2,20, 25/2 ,3/2);
        LineImg.backgroundColor=[UIColor redColor];
        //[cell.contentView addSubview:LineImg];

        NSString *content_title=[NSString stringWithFormat:@"%@",[FinalDict valueForKey:@"description"]];
        CGSize constraint_title = CGSizeMake(self.view.frame.size.width-20, 20000.0f);
        CGSize size = [content_title boundingRectWithSize:constraint_title
                                                  options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin                                         attributes:roboto_regular_12 context:nil].size;
        CGFloat title_height = MAX(size.height, 12.0f);
        
        
        UILabel*titleLbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 28, self.view.frame.size.width-20, title_height+2)];
        titleLbl.backgroundColor=[UIColor clearColor];
        titleLbl.text=[FinalDict valueForKey:@"description"];
        titleLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:12];
        titleLbl.textColor=[UIColor colorWithRed:75.0/255.0 green:73.0/255.0 blue:85.0/255.0 alpha:1.0];
        titleLbl.textAlignment=NSTextAlignmentLeft;
        titleLbl.numberOfLines=0;
        [cell addSubview:titleLbl];

        
        
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
        RectangleImg.frame=CGRectMake(0,title_height+36, self.view.frame.size.width ,1);
        [cell.contentView addSubview:RectangleImg];
        
        
        

    }
    else if (indexPath.row==4){
        
        
            Sizelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,5, 200, 30)];
            Sizelbl.backgroundColor=[UIColor clearColor];
            Sizelbl.text=@"SIZE & FIT";
            Sizelbl.numberOfLines=1;
            Sizelbl.textAlignment=NSTextAlignmentLeft;
            Sizelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
            Sizelbl.textColor=[UIColor blackColor];
            [Sizelbl sizeToFit];
            [cell.contentView addSubview:Sizelbl];
            
            
            UIImageView *ImgSize=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plus@_2x.png"]];
            ImgSize.frame=CGRectMake(self.view.frame.size.width-20, 5, 24/2,24/2);
            ImgSize.userInteractionEnabled=YES;
            [cell.contentView addSubview:ImgSize];
            
            
            SizeIconBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            SizeIconBtn.frame=CGRectMake(self.view.frame.size.width-50,0, 50, 50);
            [SizeIconBtn setBackgroundColor:[UIColor clearColor]];
            //[SizeIconBtn addTarget:self action:@selector(SizeIconBtn) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:SizeIconBtn];
            
            
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
        RectangleImg.frame=CGRectMake(0,48, self.view.frame.size.width ,1);
        [cell.contentView addSubview:RectangleImg];
        
    
        
    }
    else if (indexPath.row==5){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, 100, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"SHIPPING & RETURN";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plus@_2x.png"]];
        PiKImg.frame=CGRectMake(self.view.frame.size.width-20, 20, 24/2,24/2);
        [cell.contentView addSubview:PiKImg];
        
        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
        RectangleImg.frame=CGRectMake(0,48, self.view.frame.size.width ,1);
        [cell.contentView addSubview:RectangleImg];
        
    }
    else if (indexPath.row==6){
        
        
        
        UIImageView *CallImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"call-bg.png"]];
        CallImg.frame=CGRectMake((self.view.frame.size.width-310)/2, 10, 304/2,76/2);
        [cell.contentView addSubview:CallImg];
        
        UIImageView *PhoneImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"call.png"]];
        PhoneImg.frame=CGRectMake((self.view.frame.size.width-200)/2, 20, 17/2,28/2);
        [cell.contentView addSubview:PhoneImg];

        UILabel *Calllbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-175)/2,20, 100, 30)];
        Calllbl.backgroundColor=[UIColor clearColor];
        Calllbl.text=@"CALL";
        Calllbl.numberOfLines=1;
        Calllbl.textAlignment=NSTextAlignmentLeft;
        Calllbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
        Calllbl.textColor=[UIColor whiteColor];
        [Calllbl sizeToFit];
        [cell.contentView addSubview:Calllbl];

        UIImageView *EmailImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email-bg.png"]];
        EmailImg.frame=CGRectMake((self.view.frame.size.width+5)/2,10, 304/2,76/2);
        [cell.contentView addSubview:EmailImg];
        
        
        UIImageView *BoxImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email.png"]];
        BoxImg.frame=CGRectMake((self.view.frame.size.width+120)/2, 25, 28/2,19/2);
        [cell.contentView addSubview:BoxImg];
        
        UILabel *Emaillbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+160)/2,22, 100, 30)];
        Emaillbl.backgroundColor=[UIColor clearColor];
        Emaillbl.text=@"EMAIL";
        Emaillbl.numberOfLines=1;
        Emaillbl.textAlignment=NSTextAlignmentLeft;
        Emaillbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
        Emaillbl.textColor=[UIColor whiteColor];
        [Emaillbl sizeToFit];
        [cell.contentView addSubview:Emaillbl];
        
        
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,65, 170, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"AMBERCOMBINE & FITCH NY,USA";
        Txtlbl.numberOfLines=2;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        UIImageView *FITCHImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FITCH-pik.png"]];
        FITCHImg.frame=CGRectMake(10,105, self.view.frame.size.width-20 ,280/2);
        FITCHImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:FITCHImg];

        
        
        UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
        LineImg.frame=CGRectMake(0,248, self.view.frame.size.width ,1);
        [cell.contentView addSubview:LineImg];

        
    }
    
    return cell;
    
}


-(void)tagProfileBtn:(id)sender{
    
    
    UIButton *btn=(UIButton *)sender;
    
    NSInteger tag1=btn.tag;
    
    selectedImage=tag1;
    
    NSLog(@"tag1-----%ld",(long)tag1);
    
    [ProductDetailTbl reloadData];
  
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

-(void)sendAnswer:(id)sender{
    
    
    
    
    mainView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mainView];
    mainView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"transprent@2x.png" inBundle:nil compatibleWithTraitCollection:nil]];
    [self.view bringSubviewToFront:mainView];
    
    
    
    
    
    UIImageView *ImgIcon=[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-258)/2,140, 517/2, 290)];
    ImgIcon.userInteractionEnabled=YES;
    ImgIcon.backgroundColor=[UIColor whiteColor];
    ImgIcon.layer.cornerRadius=15.0;
    [mainView addSubview:ImgIcon];
    
    
    NSMutableArray *images=[FinalDict valueForKey:@"images"];
    
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
    
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(123, 136, 100, 20)];
    lbl.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    
    NSString *brand=[FinalDict valueForKey:@"brand"];
    
    if(brand.length==0 || [brand isKindOfClass:[NSNull class]] || [brand isEqualToString:@""]||[brand isEqualToString:@"(null)"]||brand==nil || [brand isEqualToString:@"<null>"]){

    }
    else{
        
        lbl.text=[FinalDict valueForKey:@"brand"];

        
    }
    
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
    
    UILabel *lbl1=[[UILabel alloc] initWithFrame:CGRectMake(123, 162, 80, 20)];
    lbl1.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    
    
    NSString *storeName=[FinalDict valueForKey:@"storeName"];
    
    if([storeName isEqual:[NSNull null]]){
        
    }
    else{
        
        lbl1.text=[FinalDict valueForKey:@"storeName"];
        
        
    }

    
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
    
    UILabel *lbl2=[[UILabel alloc] initWithFrame:CGRectMake(123, 186, 80, 20)];
    lbl2.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    
    NSString *price=[FinalDict valueForKey:@"price"];
    
     if([price isEqual:[NSNull null]]){
     }
    else{
        
        lbl2.text=[NSString stringWithFormat:@"$%@",[FinalDict valueForKey:@"price"]];
        
        
    }

    
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
    
    UIButton *ColorIconBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    ColorIconBtn.frame=CGRectMake(120,207, 126/2, 39/2);
    [ColorIconBtn setBackgroundColor:[UIColor clearColor]];
    [ColorIconBtn addTarget:self action:@selector(ColorIconBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:ColorIconBtn];
    
    
    UIImageView *CheckIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddButton@2x.png"]];
    CheckIcon.frame=CGRectMake(27,250, 192/2, 63/2);
    CheckIcon.userInteractionEnabled=YES;
    [ImgIcon addSubview:CheckIcon];
    
    UIButton * AddItemBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    AddItemBtn.frame=CGRectMake(27,250, 192/2, 63/2);
    [AddItemBtn addTarget:self action:@selector(AddRequest) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:AddItemBtn];
    
    
    UIImageView *GoBackIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cancel.png"]];
    GoBackIcon.frame=CGRectMake(133,250, 192/2, 63/2);
    [ImgIcon addSubview:GoBackIcon];
    
    UIButton *CancelBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CancelBtn.frame=CGRectMake(133,250, 192/2, 63/2);
    [CancelBtn addTarget:self action:@selector(CancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:CancelBtn];
    
    
}
-(void)AddRequest{
    
    
    if ([self loginValidation]) {
        
        SingleTonClass *single=[SingleTonClass getInstance];
        single.order_size=Sizelbl.text;
        single.order_colour=colorlbl.text;
        
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
    
    
    
    
    
}

-(BOOL)loginValidation{
    
    
    
    if(Sizelbl.text.length<1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select the size"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    if([Sizelbl.text isEqualToString:@"Size"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select the size"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    if([colorlbl.text isEqualToString:@"color"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select the colour"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    
    if(colorlbl.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:@"Please select the colour"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    
    
    return YES;
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
    
     UIButton * AddItemBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    AddItemBtn.frame=CGRectMake(10,90, 192/2, 63/2);
    [AddItemBtn addTarget:self action:@selector(cartBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:AddItemBtn];
    
    
    UIImageView *GoBackIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"go_back@2x.png"]];
    GoBackIcon.frame=CGRectMake(150,90, 192/2, 63/2);
    [ImgIcon addSubview:GoBackIcon];
    
    UIButton  *CancelBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CancelBtn.frame=CGRectMake(150,90, 192/2, 63/2);
    [CancelBtn addTarget:self action:@selector(CancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [ImgIcon addSubview:CancelBtn];
    
    
    
    
    
    
    
    
}

-(void)cartBtn{
    
    [mainView removeFromSuperview];

    
    OrderUserViewController *order=[[OrderUserViewController alloc] init];
    order.order_dict=FinalDict;
    [self.navigationController pushViewController:order animated:YES];
    
    
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

