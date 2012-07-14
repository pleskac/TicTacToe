//
//  Board.m
//  TicTacToe
//
//  Created by Mark Pleskac on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"

@implementation Board
//0 = unplayed
//1 = x
//2 = y
int theBoard[9];

-(void)reset{
    for(int i = 0; i < 9; i++){
        theBoard[i] = 0;
    }
}

-(int)getStateByRow:(int)row Column:(int)col{
    return nil;
}

//TODO: better error handling
-(int)getStateByPosition:(int)pos{
    if(pos >= 0 && pos < 9)
        return theBoard[pos];
    return nil;
}

//TODO: error checking
-(void)setStateByRow:(int)row Column:(int)col Value:(int)val{
    if(row == 0){
        [self setStateByPosition:col Value:val];
    }
    else if(row == 1){
        [self setStateByPosition:2+col Value:val];
    }
    else{
        [self setStateByPosition:5+col Value:val];
    }
}
-(void)setStateByPosition:(int)pos Value:(int)val{
    theBoard[pos] = val;
}

@end