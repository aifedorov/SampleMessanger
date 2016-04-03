//
//  AFCreateMessegeViewController.m
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "AFCreateMessegeViewController.h"

@interface AFCreateMessegeViewController ()



@end

@implementation AFCreateMessegeViewController

#pragma mark - Actions

- (IBAction)cancelCreateMessage:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)sendMessage:(id)sender {
}

@end
