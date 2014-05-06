//
//  TutorialChildViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/29/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "TutorialChildViewController.h"
#import "QuestViewController.h"
#import "User.h"

@interface TutorialChildViewController ()

@end

@implementation TutorialChildViewController

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
    
    // screen dimensions
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;

    // pageLabel
    self.screenNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,120,screenWidth,100)];
    self.screenNumberLabel.textAlignment = NSTextAlignmentCenter;
    self.screenNumberLabel.textColor = [UIColor whiteColor];
    self.screenNumberLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:25];
    [self.view addSubview:self.screenNumberLabel];
        
    // setUserSawTutorialButton
    int endTutorialButtonWidth = screenWidth/2;
    int endTutorialButtonHeight = screenHeight*4/5;
    self.endTutorialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:self.endTutorialButton];
    [self.endTutorialButton setTitle:@"Skip" forState:UIControlStateNormal];
    [self.endTutorialButton setContentEdgeInsets:UIEdgeInsetsMake(2, 6, 2, 6)];
    [self.endTutorialButton sizeToFit];
    self.endTutorialButton.center = CGPointMake(endTutorialButtonWidth, endTutorialButtonHeight);
    [self.endTutorialButton addTarget:self action:@selector(endTutorial) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) viewWillAppear:(BOOL)animated


{
    self.screenNumberLabel.text = [NSString stringWithFormat:@"Screen #%ld", self.index + 1];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)endTutorial
{
    QuestViewController *viewController = [QuestViewController new];
    [self presentViewController:viewController animated:YES completion:nil];
}


@end
