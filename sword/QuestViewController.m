//
//  QuestViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/30/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "QuestViewController.h"
#import "EnemyViewController.h"
#import "MapViewController.h"
#import "UserViewController.h"
#import "WorldViewController.h"
#import "InventoryTableViewController.h"

@interface QuestViewController ()
@end

@implementation QuestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didPressSlotButton:(UIButton*) sender
{
//    if(sender.textLabel){}
    
}
- (IBAction)tappedFirstSlotButton:(id)sender {
    [self normalPath];
}
- (IBAction)tappedSecondSlotButton:(id)sender {
    [self normalPath];
}
- (IBAction)tappedThirdSlotButton:(id)sender {
    [self normalPath];
}


- (void)normalPath
{
    //ViewControllers
    EnemyViewController* enemyVC = [[EnemyViewController alloc] init];
    MapViewController* mapVC = [[MapViewController alloc] init];
    UserViewController *userVC = [[UserViewController alloc] init];
    InventoryTableViewController *inventoryTableViewController = [[InventoryTableViewController alloc] init];
    WorldViewController *worldVC = [[WorldViewController alloc] init];
    
    //NavigationControllers
    UINavigationController *enemyNavController = [[UINavigationController alloc] initWithRootViewController:enemyVC];
    UINavigationController *mapNavController = [[UINavigationController alloc] initWithRootViewController:mapVC];
    UINavigationController *userNavController = [[UINavigationController alloc] initWithRootViewController:userVC];
    UINavigationController *inventoryNavController = [[UINavigationController alloc] initWithRootViewController:inventoryTableViewController];
    UINavigationController *worldNavController = [[UINavigationController alloc] initWithRootViewController:worldVC];
    
    //TabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSArray *viewControllers = [NSArray arrayWithObjects: enemyNavController, mapNavController, userNavController, inventoryNavController, worldNavController, nil];
    [tabBarController setViewControllers:viewControllers];
    
    //DisplayView
    [self presentViewController:tabBarController animated:NO completion:nil];
}

@end
