//
//  AFCreateMessegeViewController.m
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "AFCreateMessageViewController.h"

@interface AFCreateMessageViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *messageTextView;

@end

@implementation AFCreateMessageViewController

static NSString *placeholder = @"Message text";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.messageTextView.text = placeholder;
    self.messageTextView.textColor = [UIColor lightGrayColor];
    
    UITapGestureRecognizer *handleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleEditing)];
    [self.view addGestureRecognizer:handleTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)cancelCreateMessage:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)sendMessage:(id)sender {
    
    if (![self.messageTextView.text isEqualToString:placeholder] && self.messageTextView.text.length != 0) {
        
        [self sendMessage];
        [self.navigationController popViewControllerAnimated:YES];
        
    } else {
        
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Warning!" message:@"Text message is empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"ОК"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:^{}];
    }
}


#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    if ([textView.text isEqualToString:placeholder]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    if (self.messageTextView.text.length == 0) {
        textView.text = placeholder;
        textView.textColor = [UIColor lightGrayColor];
    }
}

- (void) handleEditing {
    
    [self.view endEditing:YES];
}

#pragma mark - Private methods

-(void) sendMessage {
    
}

@end
