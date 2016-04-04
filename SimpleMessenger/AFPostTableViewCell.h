//
//  AFPostTableViewCell.h
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Post;

@interface AFPostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *textMessageLabel;

@property (nonatomic, strong) Post *post;

@end
