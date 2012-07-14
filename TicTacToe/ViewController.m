//
//  ViewController.m
//  TicTacToe
//
//  Created by Mark Pleskac on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Board.h"
@implementation ViewController
@synthesize MultiplayerToggle;
@synthesize Button01;
@synthesize Button00;
@synthesize nameTextField;
@synthesize nameLabel;
@synthesize userName = _userName;
@synthesize Button02;
Board *currentBoard;
bool multiplayer = false;
bool playX = true;

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
    [self setMultiplayerToggle:nil];
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

- (IBAction)Clicked:(id)sender {
    if(playX){
        [sender setTitle:@"X" forState:UIControlStateNormal];
        //UPDATE CURRENT BOARD
        if(multiplayer){
            //DO THE AI ALGORITHM!!!
            //Basically, but an "O" somewhere on the board and disable it
            [self makeAIMove];
            playX = !playX;
        }
    }
    else{
        //UPDATE CURRENT BOARD
        [sender setTitle:@"O" forState:UIControlStateNormal];
    }
    playX = !playX;
    [sender setEnabled:false];
}

- (IBAction)PlayerSelectionChanged:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    
}

-(int)getPositionFromButton:(id)button{
    return -1;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"button index = %i", buttonIndex);
    //Cancel = 0
    if(buttonIndex == 0){
        BOOL oldstate = ![MultiplayerToggle isOn];
        [MultiplayerToggle setOn:oldstate animated:false];
    }
    else{
        //reset the board
        [self resetAllButtons];
        [currentBoard reset];
        
        //change the playing terms
        multiplayer = !multiplayer;
    }
}

-(void)resetAllButtons{
    [self.Button00 setEnabled:true];
    [self.Button00 setTitle:@"" forState:UIControlStateNormal];
    [self.Button01 setEnabled:true];
    [self.Button01 setTitle:@"" forState:UIControlStateNormal];
    [self.Button02 setEnabled:true];
    [self.Button02 setTitle:@"" forState:UIControlStateNormal];
    //TODO: add the rest of the buttons
}

-(void)makeAIMove{
    for(int i = 0; i < 9; i++){
        if([currentBoard getStateByPosition:i] == 0){
            [currentBoard setStateByPosition:i Value:2];
            //update the board
        }
    }
    
    //else, do nothing
}

@end
