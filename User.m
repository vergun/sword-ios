//
//  User.m
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithName:(NSString *)aName
        description:(NSString *)aDescription
     characterClass:(NSString *)aCharacterClass
        enabled:(BOOL)isEnabled
        setup:(BOOL)aSetup
              level:(NSNumber *)aLevel
           strength:(NSNumber *)aStrength
              magic:(NSNumber *)aMagic
         totalMagic:(NSNumber *)aTotalMagic
         experience:(NSNumber *)anExperience
experienceToNextLevel:(NSNumber *)anExperienceToNextLevel
               gold:(NSNumber *)aGold
           vitality:(NSNumber *)aVitality
    totalVitality:(NSNumber *)aTotalVitality
              index:(NSNumber *)anIndex
{
    if (self = [super init]) {
        self.name = aName;
        self.description = aDescription;
        self.characterClass = aCharacterClass;
        self.enabled = isEnabled;
        self.setup = aSetup;
        self.level = aLevel;
        self.strength = aStrength;
        self.magic = aMagic;
        self.totalMagic = aTotalMagic;
        self.experience = anExperience;
        self.experienceToNextLevel = anExperienceToNextLevel;
        self.gold = aGold;
        self.vitality = aVitality;
        self.totalVitality = aTotalVitality;
        self.index = anIndex;
    }
    return self;
    
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _description = [aDecoder decodeObjectForKey:@"description"];
        _characterClass = [aDecoder decodeObjectForKey:@"characterClass"];
        _enabled = [aDecoder decodeBoolForKey:@"enabled"];
        _setup = [aDecoder decodeBoolForKey:@"setup"];
        _level = [aDecoder decodeObjectForKey:@"level"];
        _strength = [aDecoder decodeObjectForKey:@"strength"];
        _magic = [aDecoder decodeObjectForKey:@"magic"];
        _totalMagic = [aDecoder decodeObjectForKey:@"totalMagic"];
        _experience = [aDecoder decodeObjectForKey:@"experience"];
        _experienceToNextLevel = [aDecoder decodeObjectForKey:@"experienceToNextLevel"];
        _gold = [aDecoder decodeObjectForKey:@"gold"];
        _vitality = [aDecoder decodeObjectForKey:@"vitality"];
        _totalVitality = [aDecoder decodeObjectForKey:@"totalVitality"];
        _index = [aDecoder decodeObjectForKey:@"index"];

    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)anEncoder
{
    [anEncoder encodeObject:self.name forKey:@"name"];
    [anEncoder encodeObject:self.description forKey:@"description"];
    [anEncoder encodeBool:self.enabled forKey:@"enabled"];
    [anEncoder encodeBool:self.setup forKey:@"setup"];
    [anEncoder encodeObject:self.characterClass forKey:@"characterClass"];
    [anEncoder encodeObject:self.level forKey:@"level"];
    [anEncoder encodeObject:self.strength forKey:@"strength"];
    [anEncoder encodeObject:self.magic forKey:@"magic"];
    [anEncoder encodeObject:self.totalMagic forKey:@"totalMagic"];
    [anEncoder encodeObject:self.experience forKey:@"experience"];
    [anEncoder encodeObject:self.experienceToNextLevel
                     forKey:@"experienceToNextLevel"];
    [anEncoder encodeObject:self.gold forKey:@"gold"];
    [anEncoder encodeObject:self.vitality forKey:@"vitality"];
    [anEncoder encodeObject:self.totalVitality forKey:@"totalVitality"];
    [anEncoder encodeObject:self.index forKey:@"index"];
}

@end
