//
//  PersistencyManager+Utility.m
//  sword
//
//  Created by Verdi Ergun on 5/6/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "PersistencyManager+Utility.h"
#import "SwordAPI.h"

@implementation PersistencyManager (Utility)

- (NSNumber *) mlfcul_monstersLengthForCurrentUserLevel:(NSNumber *)level
{
    //todo count the monsters within a level, not all monsters
    return [NSNumber numberWithUnsignedInteger:[[[SwordAPI sharedInstance] getMonsters] count] ];
}



@end
