//
//  Post.h
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class AFHTTPRequestOperation;

@interface Post : NSObject

@property (nonatomic, assign) NSUInteger postID;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) User *user;

+ (NSURLSessionDataTask *)getPostsGlobalStream:(void (^)(NSArray *posts, NSError *error))block;
+ (void)createPostGlobalStream:(Post *) post;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;


@end
