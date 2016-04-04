//
//  AFPostTableViewCell.m
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "AFPostTableViewCell.h"
#import "Post.h"
#import "User.h"

@implementation AFPostTableViewCell

- (void)setPost:(Post *)post {
    _post = post;
    
    self.usernameLabel.text = [NSString stringWithFormat:@"%@:",_post.user.username];
    self.textMessageLabel.text = _post.text;
}

@end
