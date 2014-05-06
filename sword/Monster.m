//
//  Monster.m
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "Monster.h"

@interface Monster()
{
}
@end

@implementation Monster

- (id) init {
    self = [    self initWithName:@"defaultName"
                      description:@"default Description"
                         strength:@10
                            magic:@10
                       totalMagic:@10
                         vitality:@10
                    totalVitality:@10
                 giftedGoldMedian:@10
           giftedExperienceMedian:@10
                          phrase1:@"phrase1"
                          phrase2:@"phrase2"
                          phrase3:@"phrase3"
                             boss:NO];
    return self;
}

- (id)     initWithName:(NSString *)aName
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
                   boss:(BOOL) isBoss
{
    if (self = [super init])
    {
                     _name = aName;
              _description = aDescription;
                 _strength = aStrength;
                    _magic = aMagic;
               _totalMagic = aTotalMagic;
                 _vitality = aVitality;
            _totalVitality = aTotalVitality;
         _giftedGoldMedian = aGiftedGoldMedian;
   _giftedExperienceMedian = aGiftedExperienceMedian;
                  _phrase1 = aPhrase1;
                  _phrase2 = aPhrase2;
                  _phrase3 = aPhrase3;
                     _boss = isBoss;
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        _name           = [aDecoder decodeObjectForKey:@"name"];
        _description    = [aDecoder decodeObjectForKey:@"description"];
        _strength       = [aDecoder decodeObjectForKey:@"strength"];
        _magic          = [aDecoder decodeObjectForKey:@"magic"];
        _totalMagic     = [aDecoder decodeObjectForKey:@"totalMagic"];
        _vitality       = [aDecoder decodeObjectForKey:@"vitality"];
        _totalVitality  = [aDecoder decodeObjectForKey:@"totalVitality"];
      _giftedGoldMedian = [aDecoder decodeObjectForKey:@"giftedGoldMedian"];
_giftedExperienceMedian = [aDecoder decodeObjectForKey:@"giftedExperienceMedian"];
               _phrase1 = [aDecoder decodeObjectForKey:@"phrase1"];
               _phrase2 = [aDecoder decodeObjectForKey:@"phrase2"];
               _phrase3 = [aDecoder decodeObjectForKey:@"phrase3"];
                  _boss = [aDecoder decodeBoolForKey:@"boss"];
        
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)anEncoder
{
    [anEncoder encodeObject:self.name forKey:@"name"];
    [anEncoder encodeObject:self.description forKey:@"description"];
    [anEncoder encodeObject:self.strength forKey:@"strength"];
    [anEncoder encodeObject:self.magic forKey:@"magic"];
    [anEncoder encodeObject:self.totalMagic forKey:@"totalMagic"];
    [anEncoder encodeObject:self.vitality forKey:@"vitality"];
    [anEncoder encodeObject:self.totalVitality forKey:@"totalVitality"];
    [anEncoder encodeObject:self.giftedGoldMedian forKey:@"giftedGoldMedian"];
    [anEncoder encodeObject:self.giftedExperienceMedian forKey:@"giftedExperienceMedian"];
    [anEncoder encodeObject:self.phrase1 forKey:@"phrase1"];
    [anEncoder encodeObject:self.phrase2 forKey:@"phrase2"];
    [anEncoder encodeObject:self.phrase3 forKey:@"phrase3"];
    [anEncoder encodeBool:self.boss forKey:@"boss"];
}

@end
