//
//  SwordAPI.h
//  sword
//
//  Created by Verdi Ergun on 5/4/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Monster.h"
#import "Calculator.h"

@interface SwordAPI : NSObject
// persistency
+ (SwordAPI*)sharedInstance;
- (NSArray*)getUsers;
- (User*)getCurrentUser;
- (void) saveCurrentUser;
- (void) setCurrentUserAtIndex:(int)index;
- (void)saveUsers;
- (void)addUser:(User*)user atIndex:(int) index;
- (void)deleteUserAtIndex:(int) index;
- (NSArray*)getMonsters;
- (Monster *)getRandomMonster;

@end
