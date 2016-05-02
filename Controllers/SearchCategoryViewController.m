//
//  SearchCategoryViewController.m
//  Project
//
//  Created by MAC on 27/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "SearchCategoryViewController.h"

@interface SearchCategoryViewController ()

@end

@implementation SearchCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
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
    [self.view addSubview:customView1];
    
    searchTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height-153) style:UITableViewStylePlain];
       searchTableView.showsHorizontalScrollIndicator=NO;
    searchTableView.showsVerticalScrollIndicator=NO;
    searchTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:searchTableView];
    
    searchBarCon = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    searchBarCon.backgroundColor=[UIColor redColor];
    searchBarCon.showsCancelButton=YES;
    searchBarCon.delegate=self;
    searchBarCon.barTintColor = [UIColor redColor];
    [[UIBarButtonItem appearanceWhenContainedIn: [UISearchBar class], nil] setTintColor:[UIColor whiteColor]];


    [self.view addSubview:searchBarCon];
    
    

    // Do any additional setup after loading the view.
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    // called only once
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // called twice every time
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    // called only once
    [searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    // called only once
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Search" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"Search" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [dict setValue:searchBar.text forKey:@"keyword"];
    [delObj PostWebServer:dict type:@"Search"];

    
}
-(void)WebCategoryResponse:(NSNotification *)dicr{
    
    
    NSDictionary *dict=[dicr userInfo];
    
    ProductArray = [(NSMutableArray *)[NSArray arrayWithArray:[dict valueForKey:@"result"]] mutableCopy];

    searchTableView.dataSource=self;
    searchTableView.delegate=self;
    [searchTableView reloadData];
    
    NSLog(@"SEARCH-----%@",dicr);
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
