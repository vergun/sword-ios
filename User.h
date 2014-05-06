//
//  User.h
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name, *description, *characterClass;
@property BOOL enabled, setup;
@property NSNumber *level, *strength, *magic, *totalMagic, *experience, *experienceToNextLevel, *gold, *vitality, *totalVitality, *index;

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
              index:(NSNumber *)anIndex;

@end
