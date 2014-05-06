//
//  QuestSetupViewController.h
//  sword
//
//  Created by Verdi Ergun on 4/30/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwordAPI.h"

@interface QuestSetupViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *characterNameInput;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *characterClassInput;

@end
