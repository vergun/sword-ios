//
//  StatsViewController.h
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserViewController : UIViewController

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *levelAndClassLabel;
@property (strong, nonatomic) IBOutlet UILabel *experienceAndExperienceToNextLevelLabel;
@property (strong, nonatomic) IBOutlet UILabel *strengthLabel;
@property (strong, nonatomic) IBOutlet UILabel *magicLabel;
@property (strong, nonatomic) IBOutlet UILabel *vitalityAndTotalVitalityLabel;

@end
