//
//  User.h
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *tutorial;
@property BOOL setup;
@property (strong, nonatomic) NSString *characterClass;
@property int level;
@property float strength;
@property float magic;
@property double experience;
@property double experienceToNextLevel;
@property double gold;
@property double vitality;
@property double totalVitality;

+ (NSString *) getPathToArchive;
+ (void) saveUser:(User *)aUser;
+ (User *) getUser;


+ (void) skipTutorial:(User*)aUser;
- (BOOL) sawTutorial:(User*)aUser;



@end
