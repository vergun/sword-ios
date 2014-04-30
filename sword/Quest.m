//
//  Quest.m
//  sword
//
//  Created by Verdi Ergun on 4/30/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "Quest.h"

@implementation Quest


- (id) init {
    self = [self initWithFirstSlot:NO secondSlot:NO thirdSlot:NO];
    return self;
}

- (id) initWithFirstSlot:(BOOL)aFirstSlot
              secondSlot:(BOOL)aSecondSlot
               thirdSlot:(BOOL)aThirdSlot
{
    if (self) {
        self = [super init];
        self.firstSlot = aFirstSlot;
        self.secondSlot = aSecondSlot;
        self.thirdSlot = aThirdSlot;
        [Quest saveQuest:self];
    }
    return self;
    
}

+ (void) saveQuest:(Quest *)aQuest
{
    [NSKeyedArchiver archiveRootObject:aQuest toFile:[Quest getPathToArchive]];
}

+ (Quest *) getQuest
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[Quest getPathToArchive]];
}

+ (NSString *) getPathToArchive
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    return [docsDir stringByAppendingPathComponent:@"quest.model"];
}


- (Quest *) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.firstSlot = [aDecoder decodeBoolForKey: @"firstSlot"];
        self.secondSlot = [aDecoder decodeBoolForKey:@"secondSlot"];
        self.thirdSlot = [aDecoder decodeBoolForKey:@"thirdSlot"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)anEncoder
{
    [anEncoder encodeBool:self.firstSlot forKey:@"firstSlot"];
    [anEncoder encodeBool:self.secondSlot forKey:@"secondSlot"];
    [anEncoder encodeBool:self.thirdSlot forKey:@"thirdSlot"];
}

@end
