//
//  ViewController.h
//  TicTacToe
//
//  Created by Mark Pleskac on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *MultiplayerToggle;

- (IBAction)PlayerSelectionChanged:(id)sender;

-(void)resetAllButtons;
-(void)makeAIMove;
-(UIButton*)getButtonFromPosition:(int)position;
-(int)getPositionFromButton:(id)button;

- (IBAction)Clicked:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *Button22;
@property (weak, nonatomic) IBOutlet UIButton *Button21;
@property (weak, nonatomic) IBOutlet UIButton *Button20;

@property (weak, nonatomic) IBOutlet UIButton *Button12;
@property (weak, nonatomic) IBOutlet UIButton *Button11;
@property (weak, nonatomic) IBOutlet UIButton *Button10;

@property (weak, nonatomic) IBOutlet UIButton *Button02;
@property (weak, nonatomic) IBOutlet UIButton *Button01;
@property (weak, nonatomic) IBOutlet UIButton *Button00;



@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (copy, nonatomic) NSString *userName;


@end
