//
//  PersistencyManager.m
//  sword
//
//  Created by Verdi Ergun on 5/4/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "PersistencyManager.h"
#import "PersistencyManager+Utility.h"
#import "Calculator.h"


@interface PersistencyManager(){
    NSMutableArray *users;
    NSMutableArray *monsters;
    User *currentUser;
}
@end

@implementation PersistencyManager

#pragma mark - User Data persistence

- (id)init
{
    if (self = [super init]) {
        [self initUsers];
        [self initMonsters];
        }
    return self;
}

- (void) initUsers
{
    NSString *modelType = @"user";
    users = [NSKeyedUnarchiver unarchiveObjectWithFile:[PersistencyManager getPathToArchive:modelType]];
    if (users == nil){
        users = [NSMutableArray arrayWithArray:
                 @[
                   [[User alloc] initWithName:@"defaultName" description:@"defaultDescription" characterClass:@"Warrior" enabled:(BOOL) NO setup:(BOOL) NO  level:(NSNumber *) @1 strength:(NSNumber *) @10 magic:(NSNumber *)@10 totalMagic:(NSNumber *) @10 experience:(NSNumber *) @0 experienceToNextLevel:(NSNumber *) @1000 gold:(NSNumber *) @0 vitality:(NSNumber *) @50 totalVitality:(NSNumber *) @50 index:(NSNumber *) @0],
                   [[User alloc] initWithName:@"defaultName" description:@"defaultDescription" characterClass:@"Warrior" enabled:(BOOL) NO setup:(BOOL) NO  level:(NSNumber *) @1 strength:(NSNumber *) @10 magic:(NSNumber *)@10 totalMagic:(NSNumber *) @10 experience:(NSNumber *) @0 experienceToNextLevel:(NSNumber *) @1000 gold:(NSNumber *) @0 vitality:(NSNumber *) @50 totalVitality:(NSNumber *) @50 index:(NSNumber *) @1],
                   [[User alloc] initWithName:@"defaultName" description:@"defaultDescription" characterClass:@"Warrior" enabled:(BOOL) NO setup:(BOOL) NO  level:(NSNumber *) @1 strength:(NSNumber *) @10 magic:(NSNumber *)@10 totalMagic:(NSNumber *) @10 experience:(NSNumber *) @0 experienceToNextLevel:(NSNumber *) @1000 gold:(NSNumber *) @0 vitality:(NSNumber *) @50 totalVitality:(NSNumber *) @50 index:(NSNumber *) @2]
                   ]
                 ];
        currentUser = users[0];
        [self saveUsers];
    }
}

- (NSArray*)getUsers
{
    return users;
}

- (void) addUser:(User*)user atIndex:(int)index
{
    if (users.count >= index)
        [users insertObject:user atIndex:index];
    else
        [users addObject:user];
}

- (void)deleteUserAtIndex:(int)index
{
    [users removeObjectAtIndex:index];
}

- (void)saveCurrentUser
{
    int index = [currentUser.index intValue];
    users[index] = currentUser;
    [self saveUsers];
}

- (void)saveUsers
{
    NSString *modelType = @"user";
    [NSKeyedArchiver archiveRootObject:users toFile:[PersistencyManager getPathToArchive:modelType]];
}

- (void) setCurrentUserAtIndex:(int)index
{
    currentUser = users[index];
}

- (User *) getCurrentUser
{
    return currentUser;
}

#pragma mark - Monsters Data Persistence


- (void) saveMonsters
{
    
    NSString *modelType = @"monster";
    [NSKeyedArchiver archiveRootObject:monsters toFile:[PersistencyManager getPathToArchive:modelType]];
    
}


- (void)initMonsters
{
    NSString *modelType = @"monster";
    monsters = [NSKeyedUnarchiver unarchiveObjectWithFile:[PersistencyManager getPathToArchive:modelType]];
    if (monsters == nil){
        monsters = [NSMutableArray arrayWithArray:
                 @[
                   [[Monster alloc] initWithName:@"Kyrwegebo" description:@"Smells like a musty swamp" strength:@10 magic:@0 totalMagic:@0 vitality:@10 totalVitality:@10 giftedGoldMedian:@5 giftedExperienceMedian:@10 phrase1:@"Eaklj la kaj :D" phrase2:@"A ALLKJkd akl  :D" phrase3:@"Hella kl D:" boss:NO],
                  [[Monster alloc] initWithName:@"Heartsansdeek" description:@"A pointy horn on its head" strength:@15 magic:@5 totalMagic:@5 vitality:@15 totalVitality:@15 giftedGoldMedian:@10 giftedExperienceMedian:@15 phrase1:@"Haaaaaarrkkakaaa dooo :D" phrase2:@"Mellancholal delaioa !  :D" phrase3:@"Pardon me! D:" boss:NO],
                   [[Monster alloc] initWithName:@"Tremeliodosa" description:@"Food is its main concern" strength:@16 magic:@10 totalMagic:@10 vitality:@20 totalVitality:@20 giftedGoldMedian:@20 giftedExperienceMedian:@25 phrase1:@"Blurp blurp" phrase2:@"Tricohnodorgola;" phrase3:@"Topseka turveka" boss:NO]
                   ]
                 ];
        [self saveMonsters];
    }
}


#pragma mark - General Persistency methods


+ (NSString *) getPathToArchive:(NSString *)type
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    if ([type isEqualToString:@"user"]) return [docsDir stringByAppendingPathComponent:@"user.model"];
    if ([type isEqualToString:@"monster"]) return [docsDir stringByAppendingPathComponent:@"monster.model"];
    else return nil;
}

- (NSArray*)getMonsters
{
    return monsters;
}

- (Monster *)getRandomMonster
{
    NSNumber *monstersForCurrentLevel = [self mlfcul_monstersLengthForCurrentUserLevel:currentUser.level];
    NSNumber *randomNumber = [[Calculator defaultCalculator] randomNumberFromLength:[monstersForCurrentLevel intValue]];
    Monster *randomMonster = [monsters objectAtIndex:[randomNumber intValue]];
    return randomMonster;
}

@end

