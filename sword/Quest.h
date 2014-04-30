//
//  Quest.h
//  sword
//
//  Created by Verdi Ergun on 4/30/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quest : NSObject


@property BOOL firstSlot;
@property BOOL secondSlot;
@property BOOL thirdSlot;

+ (NSString *) getPathToArchive;
+ (void) saveQuest:(Quest *)aQuest;
+ (Quest *) getQuest;

@end
