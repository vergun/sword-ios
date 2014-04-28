//
//  Enemy.m
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (id) init {
    self = [self initWithName:@"defaultName" description:@"default Description"];
    return self;
}

- (id) initWithName:(NSString *)aName
        description:(NSString *)aDescription
{
    self = [super init];
    if (self) {
        self.name = aName;
        self.description = aDescription;
    }
    return self;
    
}

@end
