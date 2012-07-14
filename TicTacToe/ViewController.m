//
//  ViewController.m
//  TicTacToe
//
//  Created by Mark Pleskac on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize Button01;
@synthesize Button00;
@synthesize nameTextField;
@synthesize nameLabel;
@synthesize userName = _userName;
@synthesize Button02;

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
    [self setButton01:nil];
    [self setButton02:nil];
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
- (IBAction)Clicked02:(id)sender {
    [self.Button02 setTitle:@"X" forState:UIControlStateNormal];
    [self.Button02 setEnabled:false];
}

- (IBAction)Clicked01:(id)sender {
    [self.Button01 setTitle:@"X" forState:UIControlStateNormal];
    [self.Button01 setEnabled:false];
}

- (IBAction)Clicked00:(id)sender {
    [self.Button00 setTitle:@"X" forState:UIControlStateNormal];
    [self.Button00 setEnabled:false];
}

- (IBAction)PlayerSelectionChanged:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    //reset the board
    
    //change the playing terms
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"button index = %i", buttonIndex);
    //Cancel = 0
    //OK = 1
}

@end
