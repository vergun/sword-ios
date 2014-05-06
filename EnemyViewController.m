//
//  EnemiesViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "EnemyViewController.h"
#import "SwordAPI.h"

@interface EnemyViewController ()

@end

@implementation EnemyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Enemy";
        self.tabBarItem.image = [UIImage imageNamed:@"tabBarEnemiesIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressFightButton:(id)sender {
    Monster *monster = [[SwordAPI sharedInstance] getRandomMonster];
    self.monsterLabel.text = [monster name];
    [self.view setNeedsDisplay];
}

@end
