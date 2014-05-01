//
//  EditUserViewController.h
//  sword
//
//  Created by Verdi Ergun on 5/1/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface EditUserViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *editNameTextField;
@property User *user;

@end
