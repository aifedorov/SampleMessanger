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
    
    self.textLabel.text = _post.user.username;
    self.detailTextLabel.text = _post.text;
}

@end
