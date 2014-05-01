//
//  StatsViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "UserViewController.h"
#import "User.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"User";
        self.tabBarItem.image = [UIImage imageNamed:@"tabBarUserIcon"];
        self.user = [User getUser];
        UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                       target:self
                                       action:@selector(editButtonTapped)];
        self.navigationItem.rightBarButtonItem = editButton;
    }
    return self;
}

- (void) editButtonTapped
{
    NSLog(@"Edit button tapped!");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = self.user.name;
    
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
    [User saveUser:self.user];
}

- (void)enteringForeground
{
    self.user = [User getUser];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
