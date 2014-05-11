//
//  FrontViewController.m
//  sword
//
//  Created by Verdi Ergun on 5/6/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "FrontViewController.h"
#import "SWRevealViewController.h"
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

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *img = [UIImage imageNamed:@"revealIcon.png"];
    
    btn.frame = CGRectMake(0.0, 0.0, img.size.width, img.size.height);
    [btn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(didTapLeftUIBarButtonItem:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:@"revealIcon.png"] forState:UIControlStateNormal];
    // set Tint color: doesn't appear to be working....
    btn.tintColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    revealController.navigationItem.leftBarButtonItem = revealButtonItem;
    
    // set Tint color: doesn't appear to be working....
    revealController.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1];
    
    // set Tint color: doesn't appear to be working....

    revealButtonItem.tintColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1];
    
    
    UIBarButtonItem *rightRevealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"chatIcon.png"]style:UIBarButtonItemStyleBordered target:revealController action:@selector(rightRevealToggle:)];
    revealController.navigationItem.rightBarButtonItem = rightRevealButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:revealController selector:@selector(revealToggle:) name:@"didClickActionGo" object:nil];



}

- (void)didTapLeftUIBarButtonItem:(SWRevealViewController *)revealController;
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didWantToPopToRootViewControllerAfterDelay" object:nil];
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
