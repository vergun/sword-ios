//
//  Calculator.h
//  sword
//
//  Created by Verdi Ergun on 5/4/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
+ (Calculator*)defaultCalculator;
- (NSNumber*)randomNumberFromLength:(unsigned int)aNumber;

@end
