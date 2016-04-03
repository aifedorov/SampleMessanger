//
//  User.m
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.userID = (NSUInteger)[[attributes valueForKeyPath:@"id"] integerValue];
    self.username = [attributes valueForKeyPath:@"username"];
    
    return self;
}

@end
