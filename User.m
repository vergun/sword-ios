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
    }
    return self;
    
}

- (void) dataRetrieved
{
    NSLog(@"Data Retrieved");
}

- (id) initWithJSON
{
    self = [super init];
    
    if (self) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithJSONFinishedLoading" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataRetrieved) name:@"initWithJSONFinishedLoading" object:nil];
        
        
        
        
// AFNetworking Example
//        // 0
//        static NSString * const BaseURLString = @"http://www.raywenderlich.com/demos/weather_sample/";
//
//        
//        // 1
//        NSString *string = [NSString stringWithFormat:@"%@weather.php?format=json", BaseURLString];
//        NSURL *url = [NSURL URLWithString:string];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        
//        // 2
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//        operation.responseSerializer = [AFJSONResponseSerializer serializer];
//        
//        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//            
//            // 3
//            self.name = @"Hello";
//            self.description = @"JSON Retrieved";
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//            // 4
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
//                                                                message:[error localizedDescription]
//                                                               delegate:nil
//                                                      cancelButtonTitle:@"Ok"
//                                                      otherButtonTitles:nil];
//            [alertView show];
//        }];
//        
//        // 5
//        [operation start];
        
    }
    return self;
    
}

@end
