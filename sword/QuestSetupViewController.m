//
//  QuestSetupViewController.m
//  sword
//
//  Created by Verdi Ergun on 4/30/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "QuestSetupViewController.h"
#import "User.h"

@interface QuestSetupViewController ()
@end

@implementation QuestSetupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)didEnterCharacterName:(id)sender {
    User *user = [User getUser];
    user.name = ((UITextField *)sender).text;
    [User saveUser:user];

}

- (IBAction)didSelectCharacterClass:(id)sender {
    NSLog(@"character class selected");
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

- (IBAction)didPressContinue:(id)sender {
    NSLog(@"Did press continue");
}

@end
