//
//  ViewController.h
//  TicTacToe
//
//  Created by Mark Pleskac on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
- (IBAction)Clicked02:(id)sender;
- (IBAction)Clicked01:(id)sender;
- (IBAction)Clicked00:(id)sender;
- (IBAction)PlayerSelectionChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Button01;
@property (weak, nonatomic) IBOutlet UIButton *Button00;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (copy, nonatomic) NSString *userName;
@property (weak, nonatomic) IBOutlet UIButton *Button02;
@end
