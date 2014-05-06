//
//  Monster.h
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monster : NSObject
@property(strong,nonatomic)NSString *name, *description, *phrase1, *phrase2, *phrase3;
@property  NSNumber *strength, *magic, *totalMagic, *vitality, *totalVitality, *giftedGoldMedian, *giftedExperienceMedian;
@property BOOL boss;

- (id) initWithName:(NSString *)aName
        description:(NSString *)aDescription
            strength: (NSNumber *)aStrength
               magic: (NSNumber *)aMagic
          totalMagic:(NSNumber *)aTotalMagic
            vitality:(NSNumber *)aVitality
       totalVitality: (NSNumber *)aTotalVitality
    giftedGoldMedian: (NSNumber *)aGiftedGoldMedian
giftedExperienceMedian: (NSNumber *)aGiftedExperienceMedian
            phrase1:(NSString *)aPhrase1
            phrase2:(NSString *)aPhrase2
            phrase3:(NSString *)aPhrase3
               boss:(BOOL)isBoss;


@end