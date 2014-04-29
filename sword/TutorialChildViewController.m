//
//  TutorialChildViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/29/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "TutorialChildViewController.h"

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
    
    // pageLabel
    self.screenNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,120,screenWidth,100)];
    self.screenNumberLabel.textAlignment = NSTextAlignmentCenter;
    self.screenNumberLabel.textColor = [UIColor whiteColor];
    self.screenNumberLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:25];
    [self.view addSubview:self.screenNumberLabel];
    
    // Other form elements should be added here
}

- (void) viewWillAppear:(BOOL)animated


{
    self.screenNumberLabel.text = [NSString stringWithFormat:@"Screen #%d", self.index + 1];
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


@end
