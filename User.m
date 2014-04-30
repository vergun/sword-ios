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
    self = [self initWithName:@"defaultName" description:@"defaultDescription"];
    return self;
}

- (id) initWithName:(NSString *)aName
        description:(NSString *)aDescription
{
    if (self) {
        self = [super init];
        self.name = aName;
        self.description = aDescription;
        self.sawTutorial = NO;
        [self listen];
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

- (void) listen
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndTutorial) name:@"user:sawTutorial" object:nil];
}

- (void) didEndTutorial
{

}

- (User *) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.description = [aDecoder decodeObjectForKey:@"description"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)anEncoder
{
    [anEncoder encodeObject:self.name forKey:@"name"];
    [anEncoder encodeObject:self.description forKey:@"description"];
    
}

@end
