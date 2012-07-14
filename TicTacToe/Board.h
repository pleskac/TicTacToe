//
//  Board.h
//  TicTacToe
//
//  Created by Mark Pleskac on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject
-(int)getStateByRow:(int)row Column:(int)col;
-(int)getStateByPosition:(int)pos;
-(void)setStateByPosition:(int)pos Value:(int)val;
-(void)setStateByRow:(int)row Column:(int)col Value:(int)val;
-(void)reset;
@end
