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
@synthesize Button22;
@synthesize Button21;
@synthesize Button20;
@synthesize Button12;
@synthesize Button11;
@synthesize Button10;
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
    currentBoard = [[Board alloc] init];
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
    [self setButton10:nil];
    [self setButton11:nil];
    [self setButton12:nil];
    [self setButton20:nil];
    [self setButton21:nil];
    [self setButton22:nil];
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
        int pos = [self getPositionFromButton:sender];
        [currentBoard setStateByPosition:pos Value:1];
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
        int pos = [self getPositionFromButton:sender];
        [currentBoard setStateByPosition:pos Value:2];
    }
    playX = !playX;
    [sender setEnabled:false];
}

- (IBAction)PlayerSelectionChanged:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"This will clear the board" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    
}

-(int)getPositionFromButton:(id)button{
    if(button == self.Button00){
        return 0;
    }
    else if(button == self.Button01){
        return 1;
    }
    else if(button == self.Button02){
        return 2;
    }
    else if(button == self.Button10){
        return 3;
    }
    else if(button == self.Button11){
        return 4;
    }
    else if(button == self.Button12){
        return 5;
    }
    else if(button == self.Button20){
        return 6;
    }
    else if(button == self.Button21){
        return 7;
    }
    else if(button == self.Button22){
        return 8;
    }
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
        playX = true; 
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
    
    [self.Button10 setEnabled:true];
    [self.Button10 setTitle:@"" forState:UIControlStateNormal];
    [self.Button11 setEnabled:true];
    [self.Button11 setTitle:@"" forState:UIControlStateNormal];
    [self.Button12 setEnabled:true];
    [self.Button12 setTitle:@"" forState:UIControlStateNormal];
    
    [self.Button20 setEnabled:true];
    [self.Button20 setTitle:@"" forState:UIControlStateNormal];
    [self.Button21 setEnabled:true];
    [self.Button21 setTitle:@"" forState:UIControlStateNormal];
    [self.Button22 setEnabled:true];
    [self.Button22 setTitle:@"" forState:UIControlStateNormal];
}

-(void)makeAIMove{
    for(int i = 0; i < 9; i++){
        if([currentBoard getStateByPosition:i] == 0){
            [currentBoard setStateByPosition:i Value:2];
            [[self getButtonFromPosition:i] setTitle:@"O" forState:UIControlStateNormal];
            [[self getButtonFromPosition:i] setEnabled:false];
            return;
        }
    }
    
    //else, do nothing
}

-(UIButton*)getButtonFromPosition:(int)position{
    switch (position){
        case 0:
            return self.Button00;
        case 1:
            return self.Button01;
        case 2:
            return self.Button02;
        case 3:
            return self.Button10;
        case 4:
            return self.Button11;
        case 5:
            return self.Button12;
        case 6:
            return self.Button20;
        case 7:
            return self.Button21;
        case 8:
            return self.Button22;
    }
    return nil;
}

@end
