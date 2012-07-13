//
//  ViewController.m
//  TicTacToe
//
//  Created by Mark Pleskac on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize Button00;
@synthesize nameTextField;
@synthesize nameLabel;
@synthesize userName = _userName;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [self setNameLabel:nil];
    [self setButton00:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.nameTextField) {
        self.userName = self.nameTextField.text;
        NSString *nameString = self.userName;
        if ([nameString length] == 0) {
            nameString = @"World";
        }
        NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
        self.nameLabel.text = greeting;
        [textField resignFirstResponder];
    }
    return YES;
}
- (IBAction)Clicked00:(id)sender {
    if([self.Button00 currentTitle].length == 0){
        [self.Button00 setTitle:@"Clicked" forState:UIControlStateNormal];
    }
    else{
        [self.Button00 setTitle:@"" forState:UIControlStateNormal];
    }
}
@end
