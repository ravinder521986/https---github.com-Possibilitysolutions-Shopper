//
//  CartViewController.m
//  Project
//
//  Created by Possibility Solutions on 03/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self btnPressed:nil];
    // Do any additional setup after loading the view.
}
-(void)btnPressed:(id)sender{
    
    OrderViewController *Order=[[OrderViewController alloc]init];
    [self.navigationController pushViewController:Order animated:YES];
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
