//
//  StatsViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()
{
    User* currentUser;
}

@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"User";
        self.tabBarItem.image = [UIImage imageNamed:@"tabBarUserIcon"];
        currentUser = [[SwordAPI sharedInstance] getCurrentUser];
        UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                       target:self
                                       action:@selector(editButtonTapped)];
        self.navigationItem.rightBarButtonItem = editButton;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadView:) name:@"user:didEditName" object:nil];
    }
    return self;
}

- (void) reloadView:(NSNotification *) notification
{
    currentUser = [[SwordAPI sharedInstance] getCurrentUser];
    self.nameLabel.text = currentUser.name;
    self.levelAndClassLabel.text = [NSString stringWithFormat:@"Level %@ %@",currentUser.level,currentUser.characterClass];
    self.experienceAndExperienceToNextLevelLabel.text = [NSString stringWithFormat:@"%@ / %@",currentUser.experience, currentUser.experienceToNextLevel];
    self.strengthLabel.text = [NSString stringWithFormat:@"%@ Strength",currentUser.strength];
    self.magicLabel.text = [NSString stringWithFormat:@"%@ / %@ Magic",currentUser.magic, currentUser.totalMagic];
    self.vitalityAndTotalVitalityLabel.text = [NSString stringWithFormat:@"%@ / %@ Vitality",currentUser.vitality, currentUser.totalVitality];
    [self.view setNeedsDisplay];
}

- (void) editButtonTapped
{
    EditUserViewController *editView = [[EditUserViewController alloc] init];
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [self.navigationController pushViewController:editView animated:NO];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = currentUser.name;
    self.levelAndClassLabel.text = [NSString stringWithFormat:@"Level %@ %@", currentUser.level, currentUser.characterClass];
    self.experienceAndExperienceToNextLevelLabel.text = [NSString stringWithFormat:@"%@ / %@", currentUser.experience, currentUser.experienceToNextLevel];
    
    self.strengthLabel.text = [NSString stringWithFormat:@"%@ Strength", currentUser.strength];
    self.magicLabel.text = [NSString stringWithFormat:@"%@ / %@ Magic", currentUser.magic, currentUser.totalMagic];
    self.vitalityAndTotalVitalityLabel.text = [NSString stringWithFormat:@"%@ / %@ Vitality", currentUser.vitality, currentUser.totalVitality];

    // enteringBackground
    [[NSNotificationCenter defaultCenter]
     addObserver:self
        selector:@selector(enteringBackground)
            name:UIApplicationDidEnterBackgroundNotification
            object:nil];
    
    // enteringForeground
    [[NSNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(enteringForeground)
               name:UIApplicationWillEnterForegroundNotification
             object:nil];
}

- (void)enteringBackground
{
    [[SwordAPI sharedInstance] saveCurrentUser];
}

- (void)enteringForeground
{    
    currentUser = [[SwordAPI sharedInstance] getCurrentUser];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)leaveCurrentGame:(id)sender {
    [[SwordAPI sharedInstance] saveCurrentUser];
    QuestViewController *questVC = [QuestViewController new];
    [self presentViewController:questVC animated:YES completion:nil];

}

@end
