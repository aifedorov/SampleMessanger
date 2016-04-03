//
//  User.h
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (readonly, nonatomic, assign) NSUInteger userID;
@property (readonly, nonatomic, copy) NSString *username;

@end
