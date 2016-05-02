//
//  AppDelegate.m
//  Project
//
//  Created by MAC on 11/07/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize serverRequest;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    loginViewController *objectiphone=[[loginViewController alloc] init];
    navController=[[UINavigationController alloc]initWithRootViewController:objectiphone];
    navController.navigationBar.hidden=YES;
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
    
    
}

-(void)PostWebServer:(NSMutableDictionary *)dict type:(NSString *)webServive{
    
    urlType=webServive;
    
    if(serverRequest) {
        
        NSLog(@"CANCEL REQUEST");
        [self.serverRequest cancel];
        [self.serverRequest clearDelegatesAndCancel];
    }
    
    
    if ([webServive isEqualToString:@"Login"]) {
        
        NSString *strurl=[NSString stringWithFormat:@"%@userLogin",webServiceUrl];
        NSURL *url=[NSURL URLWithString:strurl];
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest setPostValue:[dict valueForKey:@"user_name"] forKey:@"user_name"];
        [serverRequest setPostValue:[dict valueForKey:@"password"] forKey:@"password"];
        [serverRequest setRequestMethod:@"POST"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
        
    }
    else if ([webServive isEqualToString:@"Register"]) {
        

        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        
        if (! jsonData) {
            NSLog(@"Got an error: %@", error);
        } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        
      
        urlstring = [NSString stringWithFormat:@"%@api/Users",webServiceUrl];

        NSURL *url=[NSURL URLWithString:urlstring];
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest addRequestHeader:@"content-type" value:@"application/json"];
        [serverRequest setPostBody:[NSMutableData dataWithData:[jsonString  dataUsingEncoding:NSUTF8StringEncoding]]];
     //   [serverRequest setPostValue:[dict valueForKey:@"email"] forKey:@"email"];
     //   [serverRequest setPostValue:[dict valueForKey:@"password"] forKey:@"password"];
     //   [serverRequest setPostValue:[dict valueForKey:@"userName"] forKey:@"userName"];
     //   [serverRequest setPostValue:[dict valueForKey:@"birthDate"] forKey:@"birthDate"];

        [serverRequest setRequestMethod:@"POST"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];

      
        
        
    }
    else if ([webServive isEqualToString:@"ResetPassword"]){
        
        
        urlstring=[NSString stringWithFormat:@"%@api/ResetPasswords/?emailAddress=%@",webServiceUrl,[dict valueForKey:@"email"]];
        NSURL *url=[NSURL URLWithString:urlstring];
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest addRequestHeader:@"content-type" value:@"application/json"];
        [serverRequest setPostBody:[NSMutableData dataWithData:[jsonString  dataUsingEncoding:NSUTF8StringEncoding]]];
        [serverRequest setRequestMethod:@"POST"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
        
        
    }
    else if ([webServive isEqualToString:@"Stores"]){
        
        
        NSString *strurl=[NSString stringWithFormat:@"%@api/Stores/1",webServiceUrl];
        NSURL *url=[NSURL URLWithString:strurl];
        NSLog(@"%@",url);
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest setRequestMethod:@"get"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
        
        

    }
    else if ([webServive isEqualToString:@"StoreDetails"]){
        

    NSString *strurl=[NSString stringWithFormat:@"%@api/StoreDetails/=%@id",webServiceUrl,[[NSUserDefaults standardUserDefaults]valueForKey:@"id"]];
    NSURL *url=[NSURL URLWithString:strurl];
    NSLog(@"%@",url);
    serverRequest=[ASIFormDataRequest requestWithURL:url];
    [serverRequest setRequestMethod:@"get"];
    [serverRequest setDelegate:self];
    [serverRequest startAsynchronous];
        
    }
    else if ([webServive isEqualToString:@"Product"]){
        
        
        NSString *strurl=[NSString stringWithFormat:@"%@api/Products/Store/%@/%@",webServiceUrl,[dict valueForKey:@"id"],@"1"];
        NSURL *url=[NSURL URLWithString:strurl];
        NSLog(@"%@",url);
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest setRequestMethod:@"get"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
        
    }
    else if ([webServive isEqualToString:@"ProductDetails"]){
        NSString *strurl=[NSString stringWithFormat:@"%@api/ProductDetails/%@",webServiceUrl,[dict valueForKey:@"id"]];
        NSURL *url=[NSURL URLWithString:strurl];
        NSLog(@"%@",url);
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest setRequestMethod:@"get"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
        
    }
    else if ([webServive isEqualToString:@"Cart"]){
     
        
           
        
        NSString *strurl=[NSString stringWithFormat:@"%@api/Cart",webServiceUrl];
        NSURL *url=[NSURL URLWithString:strurl];
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest setPostValue:[dict valueForKey:@"id"] forKey:@"productId"];
        [serverRequest setPostValue:[dict valueForKey:@"price"] forKey:@"price"];
        [serverRequest setPostValue:[dict valueForKey:@"quantity"] forKey:@"quantity"];
        [serverRequest setPostValue:[dict valueForKey:@"sizes"] forKey:@"size"];
        [serverRequest setPostValue:[dict valueForKey:@"colors"] forKey:@"color"];
        [serverRequest addRequestHeader:@"Authorization" value:[NSString stringWithFormat:@"bearer %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"userid"]]];

        [serverRequest setRequestMethod:@"POST"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
    }
    else if ([webServive isEqualToString:@"Checkout"]){
        
        NSString *strurl=[NSString stringWithFormat:@"%@api/Checkout",webServiceUrl];
        NSURL *url=[NSURL URLWithString:strurl];
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest addRequestHeader:@"Authorization" value:[NSString stringWithFormat:@"bearer %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"userid"]]];

        [serverRequest setRequestMethod:@"POST"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
    }
    
    else if ([webServive isEqualToString:@"Category"]){
        
        NSString *strurl=[NSString stringWithFormat:@"%@api/Products/Category/%@/%@",webServiceUrl,[dict valueForKey:@"category"],@"1"];
        NSURL *url=[NSURL URLWithString:strurl];
        NSLog(@"%@",url);
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest setRequestMethod:@"get"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
        
    }
    else if ([webServive isEqualToString:@"Search"]){
        
        
        NSString *strurl=[NSString stringWithFormat:@"%@api/Products/Search/%@/%@",webServiceUrl,[[dict valueForKey:@"keyword"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],@"1"];
        NSURL *url=[NSURL URLWithString:strurl];
        NSLog(@"%@",url);
        serverRequest=[ASIFormDataRequest requestWithURL:url];
        [serverRequest setRequestMethod:@"GET"];
        [serverRequest setDelegate:self];
        [serverRequest startAsynchronous];
        
    }
    
    
    
    

}

-(void)requestFinished:(ASIHTTPRequest *)request{
    
    
    
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:nil];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:urlType object:self userInfo:dict];

    
}

-(void)showView{
    
    spinerView=[[UIView alloc] initWithFrame:CGRectMake((self.window.frame.size.width-100)/2, self.window.frame.size.height/2, 100, 100)];
    spinerView.backgroundColor=[UIColor blackColor];
    spinerView.layer.cornerRadius=8;
    self.window.userInteractionEnabled=NO;
    [self.window addSubview:spinerView];
    activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityView.frame=CGRectMake(35, 30, 25, 25);
    
    
    UILabel *loading=[[UILabel alloc] initWithFrame:CGRectMake(15, 55, 100, 20)];
    loading.backgroundColor=[UIColor clearColor];
    loading.text=@"Loading";
    loading.textColor=[UIColor whiteColor];
    [spinerView addSubview:loading];
    [spinerView addSubview:activityView];
    [activityView startAnimating];
    
}


-(void)hideView
{
    self.window.userInteractionEnabled=YES;
    [spinerView removeFromSuperview];
}



-(void)requestFailed:(ASIHTTPRequest *)request{
   
    [self hideView];
    
}
 
-(void)createTabbar{
    
    TranscationViewController *homeObj=[[TranscationViewController alloc] init];
    ShopViewController *ShopObj=[[ShopViewController alloc] init];
    MessageViewController *MessageObj=[[MessageViewController alloc] init];
    CartViewController *CartObj=[[CartViewController alloc] init];

    
    
    UINavigationController *navhome=[[UINavigationController alloc] initWithRootViewController:homeObj];
    navhome.tabBarItem.image=[UIImage imageNamed:@"home_tab@2x.png"];
    navhome.navigationBar.hidden=YES;
    navhome.title=@"HOME";
    
    UINavigationController *navgroup=[[UINavigationController alloc] initWithRootViewController:ShopObj];
    navgroup.tabBarItem.image=[UIImage imageNamed:@"shop_tab@2x.png"];
    navgroup.navigationBar.hidden=YES;
    navgroup.title=@"SHOP";
    
    UINavigationController *navlist=[[UINavigationController alloc] initWithRootViewController:MessageObj];
    navlist.tabBarItem.image=[UIImage imageNamed:@"message_tab@2x.png"];
    navlist.navigationBar.hidden=YES;
    navlist.title=@"MESSAGE";
    
    
    
    UINavigationController *navCart=[[UINavigationController alloc] initWithRootViewController:CartObj];
    navCart.tabBarItem.image=[UIImage imageNamed:@"carts_tab@2x.png"];
    navCart.navigationBar.hidden=YES;
    navCart.title=@"CART";
    
    NSArray* controllers = [NSArray arrayWithObjects:navhome,navgroup,navlist,navCart, nil];
    tabsController = [[UITabBarController alloc] init];
    tabsController.viewControllers = controllers;
    tabsController.selectedIndex=0;
    tabsController.delegate=self;
    tabsController.tabBar.barTintColor = [UIColor redColor];
    tabsController.tabBar.tintColor = [UIColor whiteColor];
    [navController presentViewController:tabsController animated:YES completion:nil];
}

- (void)tabBarController:(UITabBarController *)tabBarControllers didSelectViewController:(UIViewController *)viewController
{
    
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)viewController popToRootViewControllerAnimated:NO];
    }
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
