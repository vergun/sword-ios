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
    self = [self initWithName:@"defaultName" description:@"defaultDescription" tutorial:@"NO"];
    return self;
}

- (id) initWithName:(NSString *)aName
        description:(NSString *)aDescription
        tutorial:(NSString *)aTutorial
{
    if (self) {
        self = [super init];
        self.name = aName;
        self.description = aDescription;
        self.tutorial = aTutorial;
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

- (User *) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.description = [aDecoder decodeObjectForKey:@"description"];
        self.tutorial = [aDecoder decodeObjectForKey:@"tutorial"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)anEncoder
{
    [anEncoder encodeObject:self.name forKey:@"name"];
    [anEncoder encodeObject:self.description forKey:@"description"];
    [anEncoder encodeObject:self.tutorial forKey:@"tutorial"];
}

@end
