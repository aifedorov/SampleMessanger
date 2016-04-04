//
//  Post.m
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "Post.h"
#import "User.h"
#import "AFAppDotNetAPIClient.h"

@implementation Post

static NSString *AuthorizationToken = @"Bearer AQAAAAAADkwyyEPGS0bFUx654diCUvC6CsxafZx_NOTX_BB_ySqnMoDb6yHAqrkrJiCW5f8kxg3haF5Pfqb6o2Iimyd_3Fm-1A";

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.postID = (NSUInteger)[[attributes valueForKeyPath:@"id"] integerValue];
    self.text = [attributes valueForKeyPath:@"text"];
    
    self.user = [[User alloc] initWithAttributes:[attributes valueForKeyPath:@"user"]];
    
    return self;
}

+ (NSURLSessionDataTask *)getPostsGlobalStream:(void (^)(NSArray *posts, NSError *error))block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"/posts/stream/global" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"data"];
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (NSDictionary *attributes in postsFromResponse) {
            Post *post = [[Post alloc] initWithAttributes:attributes];
            [mutablePosts addObject:post];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

+ (void)createPostGlobalStream:(Post *) post{
    
    AFAppDotNetAPIClient *dotNetAPIClient =  [AFAppDotNetAPIClient sharedClient];
    
    [dotNetAPIClient.requestSerializer setValue:AuthorizationToken forHTTPHeaderField:@"Authorization"];
    [dotNetAPIClient.requestSerializer setValue:@"X-ADN-Pretty-JSON" forHTTPHeaderField:@"1"];
    
    NSDictionary *params = @{@"text":post.text};
    
    [dotNetAPIClient POST:@"/posts" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"JSON = %@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ERROR = %@", error);
        
    }];
}

@end
