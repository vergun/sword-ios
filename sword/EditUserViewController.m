//
//  EditUserViewController.m
//  sword
//
//  Created by Verdi Ergun on 5/1/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "EditUserViewController.h"

@interface EditUserViewController ()
{
    User* currentUser;
}

@end

@implementation EditUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        currentUser = [[SwordAPI sharedInstance] getCurrentUser];
    }
    return self;
}
- (IBAction)editingNameTextFieldDidEnd:(id)sender {
    currentUser.name = [sender text];
    [[SwordAPI sharedInstance] saveCurrentUser];
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"user:didEditName" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.editNameTextField setText:currentUser.name];
    [self.editNameTextField becomeFirstResponder];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
