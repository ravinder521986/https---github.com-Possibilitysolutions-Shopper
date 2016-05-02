//
//  FollowViewController.m
//  Project
//
//  Created by Possibility Solutions on 19/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "FollowViewController.h"

@interface FollowViewController ()

@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    delObj = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    
    UISegmentedControl *SegmentChangeView=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"BUSINESS",@"PEOPLE", nil]];
    SegmentChangeView.frame=CGRectMake((self.view.frame.size.width-300)/2, 70, 300, 40);
    SegmentChangeView.selectedSegmentIndex=0;
    SegmentChangeView.momentary = NO;
    SegmentChangeView.semanticContentAttribute=UISegmentedControlSegmentLeft;
    [SegmentChangeView setTintColor:[UIColor redColor]];
    [SegmentChangeView setBackgroundColor:[UIColor whiteColor]];
    NSDictionary *attributes =[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:13],UITextAttributeFont,nil];
    [SegmentChangeView setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [SegmentChangeView addTarget:self action:@selector(SegmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    SegmentChangeView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:SegmentChangeView];
    
    
    
    UIColor *color = [UIColor colorWithRed:127.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0];
    
    SearchTextfield=[[UITextField alloc] init];
    SearchTextfield.frame=CGRectMake((self.view.frame.size.width-280)/2,115, 230, 37);
    SearchTextfield.tag=4;
    SearchTextfield.delegate=self;
    SearchTextfield.borderStyle=UITextBorderStyleNone;
    SearchTextfield.textAlignment=NSTextAlignmentLeft;
    SearchTextfield.returnKeyType = UIReturnKeyNext;
    SearchTextfield.font=[UIFont fontWithName:@"Roboto-Regular" size:12];
    SearchTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Search" attributes:@{NSForegroundColorAttributeName: color}];
    SearchTextfield.keyboardType=UIKeyboardTypeEmailAddress;
    [SearchTextfield setAutocorrectionType:UITextAutocorrectionTypeNo];
    SearchTextfield.autocapitalizationType=UITextAutocapitalizationTypeWords;
    [self.view addSubview:SearchTextfield];
    
    UIImageView *SearchImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_field.png"]];
    SearchImg.frame=CGRectMake((self.view.frame.size.width-300)/2,120, 611/2, 49/2);
    [self.view addSubview:SearchImg];

    UIImageView *SearchIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
    SearchIcon.frame=CGRectMake((self.view.frame.size.width+250)/2,125, 24/2, 24/2);
    [self.view addSubview:SearchIcon];
    
    // Do any additional setup after loading the view.
}
- (void)SegmentValueChanged:(UISegmentedControl *)segment
{
    
    
    if(segment.selectedSegmentIndex == 0)
    {
        
    }
    if(segment.selectedSegmentIndex == 1)
    {
        
        
    }
    if(segment.selectedSegmentIndex == 2){
        
        
        
    }
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
    reallbl.text=@"FOLLOW";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView addSubview:reallbl];
    [self.view addSubview:customView];
    
    
    UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"foter-bg.png"]];
    imgLogo.frame=CGRectMake(0,154, self.view.frame.size.width, 93/2);
    [self.view addSubview:imgLogo];
    
    UILabel *ansLbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, 169, 100, 20)];
    ansLbl.text=@"Filter";
    ansLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    ansLbl.textColor=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    ansLbl.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:ansLbl];
    
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-225)/2, 176, 21/2, 13/2)];
    img.image=[UIImage imageNamed:@"arrow_down.png"];
    [self.view addSubview:img];
    
    
    
    UILabel *CategoryLbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width+170)/2, 169, 150, 20)];
    CategoryLbl.text=@"BUSINESS";
    CategoryLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    CategoryLbl.textColor=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    CategoryLbl.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:CategoryLbl];
    
    
    FollowBusinessTbl=[[UITableView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-320)/2, 200, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
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
    UIImageView *Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"store.png"]];
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
    [FollowBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    [textField resignFirstResponder];
    

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
