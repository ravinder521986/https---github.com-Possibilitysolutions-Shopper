//
//  ShopViewController.m
//  Project
//
//  Created by Possibility Solutions on 03/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()

@end

@implementation ShopViewController
@synthesize StrValue;
- (void)viewDidLoad {
    [super viewDidLoad];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    ShopArray = [[[NSMutableArray alloc]init] mutableCopy];
    
    
    UISegmentedControl *SegmentChangeView=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"STORES",@"LOCATION",@"CATEGORIES", nil]];
    SegmentChangeView.frame=CGRectMake(10, 70, self.view.frame.size.width-20, 40);
    SegmentChangeView.selectedSegmentIndex=0;
    SegmentChangeView.momentary = NO;
    SegmentChangeView.semanticContentAttribute=UISegmentedControlSegmentLeft;
    [SegmentChangeView setTintColor:[UIColor redColor]];

    [SegmentChangeView setBackgroundColor:[UIColor whiteColor]];
    NSDictionary *attributes =[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:12],UITextAttributeFont,nil];
    [SegmentChangeView setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [SegmentChangeView addTarget:self action:@selector(SegmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    SegmentChangeView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:SegmentChangeView];
    
    passImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Line@2x.png"]];
    passImg.frame=CGRectMake((self.view.frame.size.width-280)/2,140, 160/2, 5/2);
    [self.view addSubview:passImg];
    
    
    transactionTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 155, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    transactionTbl.showsVerticalScrollIndicator=YES;
    transactionTbl.showsHorizontalScrollIndicator=NO;
    transactionTbl.showsVerticalScrollIndicator=NO;
    transactionTbl.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:transactionTbl];
    
    
    
    StrValue=@"0";
    [self buttonStore];
    
    [CanadaBtn removeFromSuperview];
    [USABtn removeFromSuperview];
    [WorldBtn removeFromSuperview];
    [WomenBtn removeFromSuperview];
    [MenBtn removeFromSuperview];
    [KidBtn removeFromSuperview];
    
   
    
   
    [self storeBtn];
    
    
    
    
    
}

-(void)storeBtn{
    
    
    int x=10;
    
    int totalwidth=self.view.frame.size.width-20;
    
    NSLog(@"totalwidth----%d",totalwidth);
    
    int oneBoxValue=totalwidth/3;
    
    NSLog(@"oneBoxValue----%d",oneBoxValue);
    
    
    
   
        StrValue=@"0";
    
             AllBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        AllBtn.frame=CGRectMake(x,120, oneBoxValue, 30);
        [AllBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [AllBtn setTitle:@"ALL" forState:UIControlStateNormal];
        [AllBtn setBackgroundColor:[UIColor clearColor]];
        AllBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        AllBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        [AllBtn addTarget:self action:@selector(BtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:AllBtn];
        
        
        ClothBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        ClothBtn.frame=CGRectMake(x+oneBoxValue,120, oneBoxValue, 30);
        [ClothBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [ClothBtn setTitle:@"CLOTHING" forState:UIControlStateNormal];
        [ClothBtn setBackgroundColor:[UIColor clearColor]];
        ClothBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [ClothBtn addTarget:self action:@selector(Btn1Pressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:ClothBtn];
        
        ElectronicBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        ElectronicBtn.frame=CGRectMake(x+oneBoxValue*2,120, oneBoxValue, 30);
        [ElectronicBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [ElectronicBtn setTitle:@"ELECTRONICS" forState:UIControlStateNormal];
        [ElectronicBtn setBackgroundColor:[UIColor clearColor]];
        ElectronicBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [ElectronicBtn addTarget:self action:@selector(Btn2Pressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:ElectronicBtn];
        
        
        
        passImg.frame=CGRectMake(x+3,150, oneBoxValue-15, 3);
        
        
        
        
    

    
    
    
}

-(void)locationBtn
{
    StrValue=@"1";
    
    [AllBtn removeFromSuperview];
    [ClothBtn removeFromSuperview];
    [ElectronicBtn removeFromSuperview];
    [WomenBtn removeFromSuperview];
    [MenBtn removeFromSuperview];
    [KidBtn removeFromSuperview];
    
    
    
    CanadaBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CanadaBtn.frame=CGRectMake(10,110, self.view.frame.size.width-230, 30);
    [CanadaBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [CanadaBtn setTitle:@"CANADA" forState:UIControlStateNormal];
    CanadaBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [CanadaBtn addTarget:self action:@selector(BtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CanadaBtn];
    
    
    USABtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    USABtn.frame=CGRectMake(110,110, self.view.frame.size.width-230, 30);
    [USABtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [USABtn setTitle:@"USA" forState:UIControlStateNormal];
    USABtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [USABtn addTarget:self action:@selector(Btn1Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:USABtn];
    
    WorldBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    WorldBtn.frame=CGRectMake(220,110, self.view.frame.size.width-230, 30);
    WorldBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [WorldBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [WorldBtn setTitle:@"WORLD" forState:UIControlStateNormal];
    [WorldBtn addTarget:self action:@selector(Btn2Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:WorldBtn];
    
    
    
}

-(void)categoryBtn
{
    
    StrValue=@"2";
    [AllBtn removeFromSuperview];
    [ClothBtn removeFromSuperview];
    [ElectronicBtn removeFromSuperview];
    [CanadaBtn removeFromSuperview];
    [USABtn removeFromSuperview];
    [WorldBtn removeFromSuperview];
    
    
    
    WomenBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    WomenBtn.frame=CGRectMake(10,110, self.view.frame.size.width-230, 30);
    [WomenBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [WomenBtn setTitle:@"WOMAN" forState:UIControlStateNormal];
    WomenBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [WomenBtn addTarget:self action:@selector(BtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:WomenBtn];
    
    
    MenBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    MenBtn.frame=CGRectMake(110,110, self.view.frame.size.width-230, 30);
    [MenBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [MenBtn setTitle:@"MEN" forState:UIControlStateNormal];
    MenBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [MenBtn addTarget:self action:@selector(Btn1Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:MenBtn];
    
    KidBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    KidBtn.frame=CGRectMake(220,110, self.view.frame.size.width-230, 30);
    KidBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [KidBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [KidBtn setTitle:@"KIDS" forState:UIControlStateNormal];
    [KidBtn addTarget:self action:@selector(Btn2Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:KidBtn];
    
    
}
-(void)BtnPressed{
    
    int x=10;
    
    int totalwidth=self.view.frame.size.width-20;
    
    NSLog(@"totalwidth----%d",totalwidth);
    
    int oneBoxValue=totalwidth/3;
    
    NSLog(@"oneBoxValue----%d",oneBoxValue);
    
    passImg.frame=CGRectMake(x+3,150, oneBoxValue-15, 3);
    
    
    if ([StrValue isEqualToString:@"2"]) {
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Category" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebServiceResponse:) name:@"Category" object:nil];
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [dict setValue:@"WOMAN" forKey:@"category"];
        [delObj PostWebServer:dict type:@"Category"];
        

    }
    
    
    
}
-(void)Btn1Pressed{
    
    

    int x=10;
    
    int totalwidth=self.view.frame.size.width-20;
    
    NSLog(@"totalwidth----%d",totalwidth);
    
    int oneBoxValue=totalwidth/3;
    
    NSLog(@"oneBoxValue----%d",oneBoxValue);
    
    passImg.frame=CGRectMake(x+oneBoxValue+10,150, oneBoxValue-15, 3);
    
    if ([StrValue isEqualToString:@"2"]) {
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Category" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebServiceResponse:) name:@"Category" object:nil];
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [dict setValue:@"MAN" forKey:@"category"];
        [delObj PostWebServer:dict type:@"Category"];
        
        
    }
    
    
    
}

-(void)Btn2Pressed{
    
    
    int x=10;
    
    int totalwidth=self.view.frame.size.width-20;
    
    NSLog(@"totalwidth----%d",totalwidth);
    
    int oneBoxValue=totalwidth/3;
    
    NSLog(@"oneBoxValue----%d",oneBoxValue);
    
    passImg.frame=CGRectMake(x+10+oneBoxValue*2,150, oneBoxValue-15, 3);
    
    if ([StrValue isEqualToString:@"2"]) {
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Category" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebServiceResponse:) name:@"Category" object:nil];
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [dict setValue:@"KIDS" forKey:@"category"];
        [delObj PostWebServer:dict type:@"Category"];
        
        
    }
    
    
    
}
- (void)SegmentValueChanged:(UISegmentedControl *)segment
{
    int x=10;
    
    int totalwidth=self.view.frame.size.width-20;
    
    NSLog(@"totalwidth----%d",totalwidth);
    
    int oneBoxValue=totalwidth/3;
    
    NSLog(@"oneBoxValue----%d",oneBoxValue);
    

    
    if(segment.selectedSegmentIndex == 0)
    {
        StrValue=@"0";
        [self buttonStore];
        
        [CanadaBtn removeFromSuperview];
        [USABtn removeFromSuperview];
        [WorldBtn removeFromSuperview];
        [WomenBtn removeFromSuperview];
        [MenBtn removeFromSuperview];
        [KidBtn removeFromSuperview];
        
        
        
        AllBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        AllBtn.frame=CGRectMake(x,120, oneBoxValue, 30);
        [AllBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [AllBtn setTitle:@"ALL" forState:UIControlStateNormal];
        [AllBtn setBackgroundColor:[UIColor clearColor]];
        AllBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        AllBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

        [AllBtn addTarget:self action:@selector(BtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:AllBtn];
        
        
        ClothBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        ClothBtn.frame=CGRectMake(x+oneBoxValue,120, oneBoxValue, 30);
        [ClothBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [ClothBtn setTitle:@"CLOTHING" forState:UIControlStateNormal];
        [ClothBtn setBackgroundColor:[UIColor clearColor]];
        ClothBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [ClothBtn addTarget:self action:@selector(Btn1Pressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:ClothBtn];
        
        ElectronicBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        ElectronicBtn.frame=CGRectMake(x+oneBoxValue*2,120, oneBoxValue, 30);
        [ElectronicBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [ElectronicBtn setTitle:@"ELECTRONICS" forState:UIControlStateNormal];
        [ElectronicBtn setBackgroundColor:[UIColor clearColor]];
        ElectronicBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [ElectronicBtn addTarget:self action:@selector(Btn2Pressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:ElectronicBtn];
        
        
 
        passImg.frame=CGRectMake(x+3,150, oneBoxValue-15, 3);
 
        
        
        
    }
    if(segment.selectedSegmentIndex == 1)
    {
        StrValue=@"1";
        
        [AllBtn removeFromSuperview];
        [ClothBtn removeFromSuperview];
        [ElectronicBtn removeFromSuperview];
        [WomenBtn removeFromSuperview];
        [MenBtn removeFromSuperview];
        [KidBtn removeFromSuperview];
        
        
        
        CanadaBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        CanadaBtn.frame=CGRectMake(x,120, oneBoxValue, 30);
        [CanadaBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [CanadaBtn setTitle:@"CANADA" forState:UIControlStateNormal];
        CanadaBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [CanadaBtn addTarget:self action:@selector(BtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:CanadaBtn];
        
        
        USABtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        USABtn.frame=CGRectMake(x+oneBoxValue,120, oneBoxValue, 30);
        [USABtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [USABtn setTitle:@"USA" forState:UIControlStateNormal];
        USABtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [USABtn addTarget:self action:@selector(Btn1Pressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:USABtn];
        
        WorldBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        WorldBtn.frame=CGRectMake(x+oneBoxValue*2,120, oneBoxValue, 30);
        WorldBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [WorldBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [WorldBtn setTitle:@"WORLD" forState:UIControlStateNormal];
        [WorldBtn addTarget:self action:@selector(Btn2Pressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:WorldBtn];
        passImg.frame=CGRectMake(x+3,150, oneBoxValue-15, 3);

        
    }
    if(segment.selectedSegmentIndex == 2){
        
        StrValue=@"2";
        
        [AllBtn removeFromSuperview];
        [ClothBtn removeFromSuperview];
        [ElectronicBtn removeFromSuperview];
        [CanadaBtn removeFromSuperview];
        [USABtn removeFromSuperview];
        [WorldBtn removeFromSuperview];
        
        
        
        WomenBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        WomenBtn.frame=CGRectMake(x,120, oneBoxValue, 30);
        [WomenBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [WomenBtn setTitle:@"WOMAN" forState:UIControlStateNormal];
        WomenBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [WomenBtn addTarget:self action:@selector(BtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:WomenBtn];
        
        
        MenBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        MenBtn.frame=CGRectMake(x+oneBoxValue,120, oneBoxValue, 30);
        [MenBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [MenBtn setTitle:@"MEN" forState:UIControlStateNormal];
        MenBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [MenBtn addTarget:self action:@selector(Btn1Pressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:MenBtn];
        
        KidBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        KidBtn.frame=CGRectMake(x+oneBoxValue*2,120, oneBoxValue, 30);
        KidBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [KidBtn setTitleColor:[UIColor colorWithRed:214.0/255.0 green:43.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [KidBtn setTitle:@"KIDS" forState:UIControlStateNormal];
        [KidBtn addTarget:self action:@selector(Btn2Pressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:KidBtn];
        
        passImg.frame=CGRectMake(x+3,150, oneBoxValue-15, 3);
        
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Category" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebServiceResponse:) name:@"Category" object:nil];
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [dict setValue:@"WOMAN" forKey:@"category"];
        [delObj PostWebServer:dict type:@"Category"];



    }
    
    
    
}

-(void)buttonStore{
    
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Stores" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebServiceResponse:) name:@"Stores" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    //   [dict setValue:@"pageNumber" forKey:@"1"];
    
    [delObj PostWebServer:dict type:@"Stores"];
    
    
}

-(void)WebServiceResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    
    ShopArray = [(NSMutableArray *)[NSArray arrayWithArray:[dict valueForKey:@"result"]] mutableCopy];
    NSLog(@"..ShopArray..%@",ShopArray);
    
    
      
    transactionTbl.dataSource=self;
    transactionTbl.delegate=self;
    [transactionTbl reloadData];
    
    
}

-(void)buttonCategory{
    
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Category" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"Category" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [delObj PostWebServer:dict type:@"Category"];
    
    
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    NSLog(@"%@",dict);
    transactionTbl.dataSource=self;
    transactionTbl.delegate=self;
    [transactionTbl reloadData];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UIView *customView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.adjustsImageWhenHighlighted=NO;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"menu-icon.png"] forState:UIControlStateNormal];
    leftBtn.frame=CGRectMake(10, 35, 34/2, 31/2);
    // [leftBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:leftBtn];
    
    UIButton *plusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    plusBtn.adjustsImageWhenHighlighted=NO;
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"plus@2x.png"] forState:UIControlStateNormal];
    plusBtn.frame=CGRectMake(self.view.frame.size.width-50, 35, 34/2, 31/2);
    // [plusBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:plusBtn];
    
    
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.adjustsImageWhenHighlighted=NO;
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search@2x.png"] forState:UIControlStateNormal];
    searchBtn.frame=CGRectMake(self.view.frame.size.width-20, 35, 30/2, 30/2);
    [searchBtn addTarget:self action:@selector(searchBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:searchBtn];
    
    
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"SHOP";
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 51;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    if ([ShopArray count]) {
        
        return [ShopArray count];

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
    
    if ([ShopArray count]) {
        
        UILabel *TxtLbl=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 50)];
        TxtLbl.font=[UIFont fontWithName:@"Arial" size:12];
        TxtLbl.textAlignment=NSTextAlignmentLeft;
        TxtLbl.text=[[[ShopArray objectAtIndex:indexPath.row]valueForKey:@"details"]valueForKey:@"name"];
        [TxtLbl setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:TxtLbl];
        
        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next_arrow@2x.png"]];
        Img.frame=CGRectMake(self.view.frame.size.width-20,20, 13/2, 21/2);
        [cell.contentView addSubview:Img];
        
        UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
        LineImg.frame=CGRectMake(0,50,self.view.frame.size.width,1);
        [cell.contentView addSubview:LineImg];

    }
    
    
    
//    if ([StrValue isEqualToString:@"0"]) {
//        
//        UILabel *TxtLbl=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 50)];
//        TxtLbl.font=[UIFont fontWithName:@"Arial" size:12];
//        TxtLbl.textAlignment=NSTextAlignmentLeft;
//        TxtLbl.text=[[[ShopArray objectAtIndex:indexPath.row]valueForKey:@"details"]valueForKey:@"name"];
//        [TxtLbl setBackgroundColor:[UIColor clearColor]];
//        [cell.contentView addSubview:TxtLbl];
//        
//        UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next_arrow@2x.png"]];
//        Img.frame=CGRectMake(self.view.frame.size.width-20,20, 13/2, 21/2);
//        [cell.contentView addSubview:Img];
//        
//        UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Divider@2x.png"]];
//        LineImg.frame=CGRectMake(0,50,self.view.frame.size.width,1);
//        [cell.contentView addSubview:LineImg];
//        
//    }
//    else if ([StrValue isEqualToString:@"1"]){
//        
//        
//    }
//    else{
//        
//        
//    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([StrValue isEqualToString:@"0"]) {
        
        ProductViewController *ProductView=[[ProductViewController alloc]init];
        ProductView.store_id=[[ShopArray objectAtIndex:indexPath.row] valueForKey:@"id"];
        ProductView.store_name=[[[ShopArray objectAtIndex:indexPath.row]valueForKey:@"details"]valueForKey:@"name"];
        [self.navigationController pushViewController:ProductView animated:YES];
        
        
        
    }
    else if ([StrValue isEqualToString:@"1"]){
        
        
        
        
    }
    else{
        
        
    }
    
}




-(void)backbtn{
    
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
