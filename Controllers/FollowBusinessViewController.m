//
//  FollowBusinessViewController.m
//  Project
//
//  Created by Possibility Solutions on 19/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "FollowBusinessViewController.h"

@interface FollowBusinessViewController ()

@end

@implementation FollowBusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UIView *customView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.adjustsImageWhenHighlighted=NO;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"BackBtn@2x.png"] forState:UIControlStateNormal];
    leftBtn.frame=CGRectMake(10, 30, 24/2, 40/2);
    [leftBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:leftBtn];
  

    
    UIButton *SkipBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SkipBtn.adjustsImageWhenHighlighted=NO;
    [SkipBtn setBackgroundImage:[UIImage imageNamed:@"SKIP.png"] forState:UIControlStateNormal];
    SkipBtn.frame=CGRectMake(self.view.frame.size.width-40, 38, 54/2, 19/2);
    [SkipBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:SkipBtn];
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"FOLLOW BUSINESS";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView addSubview:reallbl];
    
    
    
    UIButton *NextBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    NextBtn.frame=CGRectMake(0,self.view.frame.size.height-47, self.view.frame.size.width,94/2);
    [NextBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    NextBtn.backgroundColor=[UIColor clearColor];
    [NextBtn setTitle:@"Next" forState:UIControlStateNormal];
    UIImage *regImage = [UIImage imageNamed:@"next.png"];
    [NextBtn setBackgroundImage:regImage forState:UIControlStateNormal];
    NextBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [NextBtn addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:NextBtn];


    [self.view addSubview:customView];

    FollowBusinessTbl=[[UITableView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-320)/2, 64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    FollowBusinessTbl.showsVerticalScrollIndicator=YES;
    FollowBusinessTbl.showsHorizontalScrollIndicator=NO;
    FollowBusinessTbl.showsVerticalScrollIndicator=NO;
    FollowBusinessTbl.delegate=self;
    FollowBusinessTbl.dataSource=self;
    [self.view addSubview:FollowBusinessTbl];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return 10;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }
    

    UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"store@2x.png"]];
    Img.frame=CGRectMake((self.view.frame.size.width-300)/2,8, 90/2,91/2);
    [cell.contentView addSubview:Img];
    
    
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-150)/2,22, 200, 50)];
    lbl.backgroundColor=[UIColor clearColor];
    lbl.text=@"Nike Air Max";
    lbl.numberOfLines=1;
    lbl.textAlignment=NSTextAlignmentLeft;
    lbl.font=[UIFont fontWithName:@"Arial" size:15];
    lbl.textColor=[UIColor blackColor];
    [lbl sizeToFit];
    [cell.contentView addSubview:lbl];
    
    
    UIButton *FollowBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    FollowBtn.frame=CGRectMake((self.view.frame.size.width+200)/2,18, 105/2, 44/2);
  //  [FollowBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    FollowBtn.backgroundColor=[UIColor clearColor];
    UIImage *regImage = [UIImage imageNamed:@"follow-btn.png"];
    [FollowBtn setBackgroundImage:regImage forState:UIControlStateNormal];
    FollowBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [FollowBtn addTarget:self action:@selector(FollowBtn) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:FollowBtn];
    
    
    UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
    LineImg.frame=CGRectMake((self.view.frame.size.width-320)/2,59, 640/2,2/2);
    [cell.contentView addSubview:LineImg];

    return cell;
    
}
-(void)FollowBtn{
    
    FollowViewController *FollowBtn=[[FollowViewController alloc]init];
    [self.navigationController pushViewController:FollowBtn animated:YES];
    
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
