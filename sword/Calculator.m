//
//  Calculator.m
//  sword
//
//  Created by Verdi Ergun on 5/4/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "Calculator.h"

@interface Calculator() {
    // instance variables here;
}
@end

@implementation Calculator


+(Calculator*)defaultCalculator
{
    static Calculator *_defaultCalculator = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _defaultCalculator = [[Calculator alloc] init];
    });
    return _defaultCalculator;
}

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (NSNumber*) randomNumberFromLength:(unsigned int) aNumber
{
    return [NSNumber numberWithInt:arc4random() % aNumber];
}


@end
