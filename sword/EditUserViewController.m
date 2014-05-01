//
//  EditUserViewController.m
//  sword
//
//  Created by Verdi Ergun on 5/1/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "EditUserViewController.h"
#import "User.h"

@interface EditUserViewController ()

@end

@implementation EditUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.user = [User getUser];
        [self.editNameTextField setPlaceholder:self.user.name];
    }
    return self;
}
- (IBAction)editingNameTextFieldDidEnd:(id)sender {
    NSLog(@"%@", [sender text]);
    self.user.name = [sender text];
    [User saveUser:self.user];
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"user:didEditName" object:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.editNameTextField becomeFirstResponder];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
