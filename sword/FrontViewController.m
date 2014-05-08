//
//  FrontViewController.m
//  sword
//
//  Created by Verdi Ergun on 5/6/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "FrontViewController.h"
#import "SWRevealViewController.h"
#import "RearViewDetailTableViewController.h"
#import "SwordAPI.h"

@interface FrontViewController ()

@end

@implementation FrontViewController

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
    SWRevealViewController *revealController = [self revealViewController];
    revealController.title = @"Enemy";
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"revealIcon.png"]style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    revealController.navigationItem.leftBarButtonItem = revealButtonItem;
    UIBarButtonItem *rightRevealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"chatIcon.png"]style:UIBarButtonItemStyleBordered target:revealController action:@selector(rightRevealToggle:)];
    revealController.navigationItem.rightBarButtonItem = rightRevealButtonItem;
    
    // Listen for click event
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didClickActionItem) name:@"didClickActionItem" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:revealController selector:@selector(revealToggle:) name:@"didClickActionGo" object:nil];
    
}

- (void) didClickActionItem {
    RearViewDetailTableViewController *detailTableViewController = [[RearViewDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:detailTableViewController  animated:YES];
    NSLog(@"Got here!");
}


- (IBAction)didPressFightButton:(id)sender {
    Monster *monster = [[SwordAPI sharedInstance] getRandomMonster];
    self.monsterLabel.text = [monster name];
    [self.view setNeedsDisplay];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
