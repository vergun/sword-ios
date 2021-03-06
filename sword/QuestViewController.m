//
//  QuestViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/30/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "QuestViewController.h"
#import "QuestSetupViewController.h"
#import "EnemyViewController.h"
#import "MapViewController.h"
#import "UserViewController.h"
#import "WorldViewController.h"
#import "InventoryTableViewController.h"
#import "SwordAPI.h"
#import "SWRevealViewController.h"
#import "FrontViewController.h"
#import "RightViewController.h"
#import "RearViewTableViewController.h"

@interface QuestViewController () <SWRevealViewControllerDelegate>
{
    User *currentUser;
    NSArray *allUsers;

}
@end

@implementation QuestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // allAlbums variable is defined once, assigned once, and used class-wide thereafter
    allUsers = [[SwordAPI sharedInstance] getUsers];
    if (allUsers)
    {
        for (int i=0; i < ([allUsers count]); i++)
        {
            User *user = allUsers[i];
            if ([user enabled])
            {
                NSString *buttonText = [NSString stringWithFormat:@"%@ : Level %@ %@", [user name], [user level], [user characterClass]];
                [(UIButton*)[self.view viewWithTag:i+1] setTitle:buttonText forState:UIControlStateNormal];
            }
        }
    }
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

- (IBAction)tappedSlotButton:(id)sender {
    NSUInteger *selectedTag = (NSUInteger *)[sender tag];
    currentUser  = [allUsers objectAtIndex:(NSUInteger) selectedTag-1];
    [[SwordAPI sharedInstance] setCurrentUserAtIndex:[currentUser.index intValue]];
    
    if ([currentUser setup]) {[self normalPath];}
    else {[self setupPath];}
}

- (void)setupPath
{
    QuestSetupViewController *questSetupVC = [[QuestSetupViewController alloc] init];
    [self presentViewController:questSetupVC animated:YES completion:nil];
}

- (void)enteringBackground
{
    [[SwordAPI sharedInstance] saveUsers];
}

- (void)enteringForeground
{
    allUsers = [[SwordAPI sharedInstance] getUsers];
}

- (void) normalPath
{
    //ViewControllers
    MapViewController* mapVC = [[MapViewController alloc] init];
    UserViewController *userVC = [[UserViewController alloc] init];
    InventoryTableViewController *inventoryTableViewController = [[InventoryTableViewController alloc] init];
    WorldViewController *worldVC = [[WorldViewController alloc] init];
    
    //SWView Test
    FrontViewController *frontViewController = [FrontViewController new];
    RearViewTableViewController *rearViewTableViewController = [[RearViewTableViewController alloc] initWithStyle:UITableViewStylePlain];
    RightViewController *rightViewController = [RightViewController new];
    UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewTableViewController];
    
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    
    revealController.delegate = self;
    revealController.rightViewController = rightViewController;

//    NavigationControllers
    UINavigationController *enemyNavController = [[UINavigationController alloc] initWithRootViewController:revealController];
    UINavigationController *mapNavController = [[UINavigationController alloc] initWithRootViewController:mapVC];
    UINavigationController *userNavController = [[UINavigationController alloc] initWithRootViewController:userVC];
    UINavigationController *inventoryNavController = [[UINavigationController alloc] initWithRootViewController:inventoryTableViewController];
    UINavigationController *worldNavController = [[UINavigationController alloc] initWithRootViewController:worldVC];
    
    //TabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    enemyNavController.tabBarItem.image = [UIImage imageNamed:@"tabBarEnemiesIcon"];
    NSArray *viewControllers = [NSArray arrayWithObjects: enemyNavController, mapNavController, userNavController, inventoryNavController, worldNavController, nil];
    [tabBarController setViewControllers:viewControllers];
    
    //DisplayView
    tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:tabBarController animated:YES completion:nil];
//    return YES;
}


- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:nil];
}

@end
