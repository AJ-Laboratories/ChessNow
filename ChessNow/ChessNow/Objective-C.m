//
//  Objective-C.m
//  ChessNow
//
//  Created by Johannes Berge on 09/12/14.
//  Copyright (c) 2014 Johannes Berge & Alexander Panayotov. All rights reserved.
//

#import "Objective-C.h"
#import "ChessNow-Swift.h"


@interface Objective_C()

@end
@implementation Objective_C
-(void)run {
    NSLog(@"test");
}
UIImageView *gridCell[65];
UIImageView *pawn[9];
UIImageView *highlight;
float cellX[65], cellY[65];
int cellWidth, cellHeight, leftX, topY;
int squares = 64;
int pawns = 8;
int which;
int i;
int row=0, col=0;
int firstColor = 0;

// --- Pieces -----
UIImageView *rook;
UIImageView *knight;
UIImageView *bishop;
UIImageView *queen;
UIImageView *king;


    


-(void)viewDidLoad {
    [super viewDidLoad];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        cellWidth = 50;
        cellHeight = cellWidth;
        topY = self.view.center.y-205;
        leftX = self.view.center.x-200;
        
    } else {
        
        cellWidth = 57;
        cellHeight = cellWidth;
        topY = self.view.frame.origin.y;
        leftX = self.view.frame.origin.x;
        
    }
    
    for (i=1; i<=64; i++) {
        
        if (firstColor == 0) {
            
            gridCell[i] = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"graySquare.png"]];
            
        } else {
            
            gridCell[i] = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"whiteSquare.png"]];
            
        }
        
        gridCell[i].frame = CGRectMake(leftX+cellWidth*col, topY+cellHeight*row, cellWidth, cellHeight);
        cellX[i] = gridCell[i].center.x;
        cellY[i] = gridCell[i].center.y;
        [self.view addSubview:gridCell[i]];
        col= col+1;
        firstColor = 1- firstColor;
        
        if(col >7) {
            row += 1;
            firstColor = 1-firstColor;
            col = 0;
            
        }
    }
    
    row = 0; col = 0;
    
    for (i=1; i<=8; i++) {
        
        pawn[i]=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whitePawn.png"]];
        
        pawn[i].frame = CGRectMake(gridCell[49+i].frame.origin.x, gridCell[49+1].frame.origin.y, cellWidth, cellHeight);
        
        col += 1;
        [self.view addSubview:pawn[i]];
        pawn[i].userInteractionEnabled = YES;
        pawn[i].multipleTouchEnabled = YES;
        
    }
    
    rook = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteRook.png"]];
    rook.frame = CGRectMake(leftX+cellWidth*0, topY+cellHeight*7, cellWidth, cellHeight); // HER e det. Se ka som skjer når du forandre på 0 og 7. Se korsen tårnet skifta posisjon
    [self.view addSubview:rook];
    rook.userInteractionEnabled = YES;
    rook.multipleTouchEnabled = YES;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    int i;
    which = 0;
    for(i=1;i<=pawns;i++) {
        if ([touch view]== pawn[i]) {
            pawn[i].center= location;
            which = i;
            highlight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"highlight.png"]];
            highlight.frame = CGRectMake(gridCell[49+i].frame.origin.x, gridCell[49+i].frame.origin.y, cellWidth, cellHeight);
            highlight.hidden = false;
            
            [self.view addSubview:highlight];
        } else {
            
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    
    int min=cellWidth*cellWidth*2;
    int closest=0;
    int i;
    
    float dSquared=0.0;
    
    float dX, dY;
    
    if (which!=0) {
        if (pawn[which].center.x>leftX && pawn[which].center.x<leftX+8.5*cellWidth &&
            pawn[which].center.y> pawn[which].center.y<topY+8.5*cellHeight)
            
            dX=pawn[which].center.x-cellX[1];
        
        dY=pawn[which].center.y-cellY[1];
        
        
        min=dX*dX+dY*dY;
        
        for (i=1; i <=squares;i++) {
            dX=pawn[which].center.x-cellX[i];
            dY=pawn[which].center.y-cellY[i];
            dSquared=dX*dX+dY*dY;
            
            if (dSquared<min) {
                min=dSquared;
                closest=i;
            }
        }
        
        pawn[which].center=CGPointMake(cellX[closest], cellY[closest]);
        
    }
}

-(void) CreateWhitePiece:(int) string second:(int)xPos third:(int)posY {
    
    switch (string) {
            
        case 1:
            rook = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteRook.png"]];
            break;
        case 2:
            rook = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteKnight.png"]];
            
        case 3:
            rook = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteBishop"]];
            
        case 4:
            rook = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteQuuen"]];
            
        case 5:
            rook = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteKing"]];
            
        default:
            break;
    }
    
    rook.frame = CGRectMake(xPos, posY*8, cellWidth, cellHeight);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
@end
