//
//  TutorialViewController.h
//  sword
//
//  Created by Verdi Ergun on 4/29/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController  <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;

@end
