//
//  User.m
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "User.h"
#import "AFNetworking.h"

@implementation User

- (id) init {
    self = [self initWithName:@"defaultName" description:@"defaultDescription" tutorial:@"NO" setup:(BOOL) NO characterClass:@"Warrior" level:(int) 1 strength:(float) 10 magic:(float) 10 totalMagic:(float) 10 experience:(double) 0 experienceToNextLevel:(double) 1000 gold:(double) 0 vitality:(double) 50 totalVitality:(double) 50];
    return self;
}

- (id) initWithName:(NSString *)aName
        description:(NSString *)aDescription
        tutorial:(NSString *)aTutorial
        setup:(BOOL)aSetup
        characterClass:(NSString *)aCharacterClass
              level:(int)aLevel
           strength:(float)anStrength
              magic:(float)anMagic
         totalMagic:(float)anTotalMagic
         experience:(double)anExperience
experienceToNextLevel:(double)anExperienceToNextLevel
               gold:(double)anGold
           vitality:(double)anVitality
    totalVitality:(double)anTotalVitality
{
    if (self) {
        self = [super init];
        self.name = aName;
        self.description = aDescription;
        self.tutorial = aTutorial;
        self.setup = aSetup;
        self.characterClass = aCharacterClass;
        self.level = aLevel;
        self.strength = anStrength;
        self.magic = anMagic;
        self.totalMagic = anTotalMagic;
        self.experience = anExperience;
        self.experienceToNextLevel = anExperienceToNextLevel;
        self.gold = anGold;
        self.vitality = anVitality;
        self.totalVitality = anTotalVitality;
        [User saveUser:self];
    }
    return self;
    
}

+ (void) saveUser:(User *)aUser
{
  [NSKeyedArchiver archiveRootObject:aUser toFile:[User getPathToArchive]];
}

+ (User *) getUser
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[User getPathToArchive]];
}

+ (NSString *) getPathToArchive
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    return [docsDir stringByAppendingPathComponent:@"user.model"];
}

+ (void) skipTutorial:(User*)aUser
{
    aUser.tutorial = @"YES";
    [User saveUser:aUser];
}

- (BOOL) sawTutorial:(User*)aUser
{
    return [aUser.tutorial isEqualToString:@"YES"] ? YES : NO;
}

- (User *) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.description = [aDecoder decodeObjectForKey:@"description"];
        self.tutorial = [aDecoder decodeObjectForKey:@"tutorial"];
        self.setup = [aDecoder decodeBoolForKey:@"setup"];
        self.characterClass = [aDecoder decodeObjectForKey:@"characterClass"];
        self.level = [aDecoder decodeIntForKey:@"level"];
        self.strength = [aDecoder decodeFloatForKey:@"strength"];
        self.magic = [aDecoder decodeFloatForKey:@"magic"];
        self.totalMagic = [aDecoder decodeFloatForKey:@"totalMagic"];
        self.experience = [aDecoder decodeDoubleForKey:@"experience"];
        self.experienceToNextLevel = [aDecoder decodeDoubleForKey:@"experienceToNextLevel"];
        self.gold = [aDecoder decodeDoubleForKey:@"gold"];
        self.vitality = [aDecoder decodeDoubleForKey:@"vitality"];
        self.totalVitality = [aDecoder decodeDoubleForKey:@"totalVitality"];

    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)anEncoder
{
    [anEncoder encodeObject:self.name forKey:@"name"];
    [anEncoder encodeObject:self.description forKey:@"description"];
    [anEncoder encodeObject:self.tutorial forKey:@"tutorial"];
    [anEncoder encodeBool:self.setup forKey:@"setup"];
    [anEncoder encodeObject:self.characterClass forKey:@"characterClass"];
    [anEncoder encodeInt:self.level forKey:@"level"];
    [anEncoder encodeFloat:self.strength forKey:@"strength"];
    [anEncoder encodeFloat:self.magic forKey:@"magic"];
    [anEncoder encodeFloat:self.totalMagic forKey:@"totalMagic"];
    [anEncoder encodeDouble:self.experience forKey:@"experience"];
    [anEncoder encodeDouble:self.experienceToNextLevel
                     forKey:@"experienceToNextLevel"];
    [anEncoder encodeDouble:self.gold forKey:@"gold"];
    [anEncoder encodeDouble:self.vitality forKey:@"vitality"];
    [anEncoder encodeDouble:self.totalVitality forKey:@"totalVitality"];

}

@end
