//
//  SwordAPI.m
//  sword
//
//  Created by Verdi Ergun on 5/4/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "SwordAPI.h"
#import "PersistencyManager.h"
#import "HTTPClient.h"



@interface SwordAPI() {
    PersistencyManager *persistencyManager;
    HTTPClient *httpClient;
    BOOL isOnline;
}
@end

@implementation SwordAPI

+(SwordAPI*)sharedInstance
{
    static SwordAPI *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[SwordAPI alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    if (self = [super init]) {
        persistencyManager = [[PersistencyManager alloc] init];
        httpClient = [[HTTPClient alloc] init];
        // currently doesn't work with a real server
        isOnline = NO;
    }
    return self;
}

- (NSArray*)getUsers
{
    return [persistencyManager getUsers];
    
}

- (User *)getCurrentUser
{
    return [persistencyManager getCurrentUser];
}

- (void) setCurrentUserAtIndex:(int)index
{
    [persistencyManager setCurrentUserAtIndex:index];
}

- (void) saveCurrentUser
{
    [persistencyManager saveCurrentUser];
}

- (void) saveUsers
{
    [persistencyManager saveUsers];
}

-(void)addUser:(User *)user atIndex:(int)index
{
    [persistencyManager addUser:user atIndex:index];
    if (isOnline)
    {
        [httpClient postRequest:@"/api/addUser" body:[user description]];
    }
    
}
-(void)deleteUserAtIndex:(int)index
{
    [persistencyManager deleteUserAtIndex:index];
    if (isOnline)
    {
        [httpClient postRequest:@"/api/deleteUser" body:[@(index) description]];
    }
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (NSArray*)getMonsters
{
    return [persistencyManager getMonsters];
}

// Returns a random monster for the current user level
// the current user is accessed as a property on persistencyManager
- (Monster*)getRandomMonster
{
    return [persistencyManager getRandomMonster];
}


@end
