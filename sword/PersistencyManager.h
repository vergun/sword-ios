//
//  PersistencyManager.h
//  sword
//
//  Created by Verdi Ergun on 5/4/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Monster.h"


@interface PersistencyManager : NSObject
- (NSArray*)getUsers;
- (User*)getCurrentUser;
- (void)saveCurrentUser;
- (void)setCurrentUserAtIndex:(int)index;
- (void)addUser:(User*)user atIndex:(int)index;
- (void)deleteUserAtIndex:(int)index;
- (void)saveUsers;
- (NSArray*)getMonsters;
- (Monster*)getRandomMonster;
- (NSArray *)getActionMenu;
- (NSDictionary *)getActionMenuSubMenu;

@end
