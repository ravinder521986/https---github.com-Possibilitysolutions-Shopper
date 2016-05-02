//
//  ChooseShippingAddressViewController.m
//  Project
//
//  Created by Possibility Solutions on 04/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "ChooseShippingAddressViewController.h"

@interface ChooseShippingAddressViewController ()

@end

@implementation ChooseShippingAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
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
    Websitelbl.font = [UIFont fontWithName:@"Arial" size:12];
    Websitelbl.text=@"CHOOSE YOUR SHIPPING ADDRESS";
    Websitelbl.textAlignment=NSTextAlignmentCenter;
    Websitelbl.textColor=[UIColor whiteColor];
    Websitelbl.numberOfLines = 1;
    [Websitelbl sizeToFit];
    [FormaIcon addSubview:Websitelbl];

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
    reallbl.text=@"SHIPPING ADDRESS";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    ProductDetailTbl=[[UITableView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-320)/2, 164, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    ProductDetailTbl.showsVerticalScrollIndicator=YES;
    ProductDetailTbl.showsHorizontalScrollIndicator=NO;
    ProductDetailTbl.showsVerticalScrollIndicator=NO;
    [self.view addSubview:ProductDetailTbl];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return 3;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }

        
        UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2,5, 200, 80)];
        lbl.backgroundColor=[UIColor clearColor];
        lbl.text=@"Tshirt with printed design";
        lbl.numberOfLines=1;
        lbl.textAlignment=NSTextAlignmentLeft;
        lbl.font=[UIFont fontWithName:@"Arial" size:12];
        lbl.textColor=[UIColor whiteColor];
        [lbl sizeToFit];
        [cell.contentView addSubview:lbl];
        
        
        UIImageView *FavoriteImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"favourite.png"]];
        FavoriteImg.frame=CGRectMake((self.view.frame.size.width-280)/2, 400, 31/2,28/2);
        [cell.contentView addSubview:FavoriteImg];
        
        UILabel *Favoritelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,90, 100, 40)];
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
        
        UILabel *Commentlbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-150)/2,140, 100, 40)];
        Commentlbl.text=@"30 Comments";
        [Commentlbl setBackgroundColor:[UIColor clearColor]];
        Commentlbl.numberOfLines=1;
        Commentlbl.textAlignment=NSTextAlignmentLeft;
        Commentlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:10];
        Commentlbl.textColor=[UIColor blackColor];
        [Commentlbl sizeToFit];
        [cell.contentView addSubview:Commentlbl];
    
    
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
