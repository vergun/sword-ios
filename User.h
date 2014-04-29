//
//  User.h
//  sword
//
//  Created by Verdi Ergun on 4/27/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;

+ (NSString *) getPathToArchive;
+ (void) saveUser:(User *)aUser;
+ (User *) getUser;


@end
