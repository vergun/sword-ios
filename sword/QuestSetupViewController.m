//
//  QuestSetupViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/30/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "QuestSetupViewController.h"
#import "EnemyViewController.h"
#import "MapViewController.h"
#import "UserViewController.h"
#import "WorldViewController.h"
#import "InventoryTableViewController.h"


@interface QuestSetupViewController ()
{
    User *currentUser;
}
@end

@implementation QuestSetupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        currentUser = [[SwordAPI sharedInstance] getCurrentUser];
    }
    return self;
}

- (IBAction)didEnterCharacterName:(id)sender {
    currentUser.name = ((UITextField *)sender).text;
    [[SwordAPI sharedInstance] saveCurrentUser];
}

- (IBAction)didSelectCharacterClass:(id)sender {
    NSString *characterClass;
    UISegmentedControl * control = sender;
    long selectedIndex = [control selectedSegmentIndex];
    if (selectedIndex == 0) { characterClass = @"Warrior";}
    if (selectedIndex == 1) { characterClass = @"Sorceress";}
    currentUser.characterClass = characterClass;
    [[SwordAPI sharedInstance] saveCurrentUser];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.characterNameInput becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressContinue:(id)sender {
    currentUser.setup = YES;
    currentUser.enabled = YES;
    [[SwordAPI sharedInstance] saveCurrentUser];
    [self normalPath];
}

- (void)enteringBackground
{
    [[SwordAPI sharedInstance] saveCurrentUser];
}

- (void)enteringForeground
{
    currentUser = [[SwordAPI sharedInstance] getCurrentUser];
}

-(void)normalPath
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
    tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:tabBarController animated:YES completion:nil];
}

@end
