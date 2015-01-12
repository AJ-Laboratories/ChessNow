//
//  ViewController.swift
//  ChessNow
//
//  Created by Johannes Berge on 21/11/14.
//  Copyright (c) 2014 Johannes Berge & Alexander Panayotov. All rights reserved.
//

import UIKit
import SpriteKit

//x-Axis coordinates
let a:CGFloat = 0 * pieceSize
let b =  pieceSize
let c = 2 * pieceSize
let d = 3 * pieceSize
let e = 4 * pieceSize
let f = 5 * pieceSize
let g = 6 * pieceSize
let h = 7 * pieceSize

let xAxisArr = [a,b,c,d,e,f,g,h]


//y-Axis coordinates
let _1 = screenHeight/2 + 3 * pieceSize
let _2 = screenHeight/2 + 2 * pieceSize
let _3 = screenHeight/2 + 1 * pieceSize
let _4 = screenHeight/2
let _5 = screenHeight/2 - 1 * pieceSize
let _6 = screenHeight/2 - 2 * pieceSize
let _7 = screenHeight/2 - 3 * pieceSize
let _8 = screenHeight/2 - 4 * pieceSize

let yAxisArr = [_1,_2,_3,_4,_5,_6,_7,_8]


//BOARDER
let boarderBoard = UIImageView(frame: CGRectMake(-0.01*pieceSize, _1 - 7*pieceSize, 8*pieceSize, 8*pieceSize))

//size-properties
let screenSize: CGRect = UIScreen.mainScreen().bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let pieceSize = sqrt(screenWidth * screenWidth / 64)
//timers
var timerNumber:Double = 0
var movementTimer = NSTimer()

//markers
var pieceMarked = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var pieceOptions : Array<UIImageView> = []


//chesspieces:
var whitePawn1 = UIImageView(frame: CGRectMake(a, _2, pieceSize , pieceSize))
var whitePawn2 = UIImageView(frame: CGRectMake(b, _2, pieceSize, pieceSize))
var whitePawn3 = UIImageView(frame: CGRectMake(c, _2, pieceSize , pieceSize))
var whitePawn4 = UIImageView(frame: CGRectMake(d, _2, pieceSize, pieceSize))
var whitePawn5 = UIImageView(frame: CGRectMake(e, _2, pieceSize , pieceSize))
var whitePawn6 = UIImageView(frame: CGRectMake(f, _2, pieceSize, pieceSize))
var whitePawn7 = UIImageView(frame: CGRectMake(g, _2, pieceSize , pieceSize))
var whitePawn8 = UIImageView(frame: CGRectMake(h, _2, pieceSize, pieceSize))


var whiteKnight1 = UIImageView(frame: CGRectMake(b, _1, pieceSize, pieceSize))
var whiteKnight2 = UIImageView(frame: CGRectMake(g, _1, pieceSize, pieceSize))

var whiteBishop1 = UIImageView(frame: CGRectMake(c, _1, pieceSize, pieceSize))
var whiteBishop2 = UIImageView(frame: CGRectMake(f, _1, pieceSize, pieceSize))


var whiteRook1 = UIImageView(frame: CGRectMake(h, _1, pieceSize, pieceSize))
var whiteRook2 = UIImageView(frame: CGRectMake(a, _1, pieceSize, pieceSize))


var whiteQueen = UIImageView(frame: CGRectMake(d, _1, pieceSize, pieceSize))

var whiteKing = UIImageView(frame: CGRectMake(e, _1, pieceSize, pieceSize))

var blackPawn1 = UIImageView(frame: CGRectMake(a, _7, pieceSize, pieceSize))
var blackPawn2 = UIImageView(frame: CGRectMake(b, _7, pieceSize, pieceSize))
var blackPawn3 = UIImageView(frame: CGRectMake(c, _7, pieceSize, pieceSize))
var blackPawn4 = UIImageView(frame: CGRectMake(d, _7, pieceSize, pieceSize))
var blackPawn5 = UIImageView(frame: CGRectMake(e, _7, pieceSize, pieceSize))
var blackPawn6 = UIImageView(frame: CGRectMake(f, _7, pieceSize, pieceSize))
var blackPawn7 = UIImageView(frame: CGRectMake(g, _7, pieceSize, pieceSize))
var blackPawn8 = UIImageView(frame: CGRectMake(h, _7, pieceSize, pieceSize))

var blackKnight1 = UIImageView(frame: CGRectMake(b, _8, pieceSize, pieceSize))
var blackKnight2 = UIImageView(frame: CGRectMake(g, _8, pieceSize, pieceSize))

var blackBishop1 = UIImageView(frame: CGRectMake(c, _8, pieceSize, pieceSize))
var blackBishop2 = UIImageView(frame: CGRectMake(f, _8, pieceSize, pieceSize))

var blackRook1 = UIImageView(frame: CGRectMake(a, _8, pieceSize, pieceSize))
var blackRook2 = UIImageView(frame: CGRectMake(h, _8, pieceSize, pieceSize))

var blackQueen = UIImageView(frame: CGRectMake(d, _8, pieceSize, pieceSize))

var blackKing = UIImageView(frame: CGRectMake(e, _8, pieceSize, pieceSize))


var blackKnights = [blackKnight1, blackKnight2]
var blackBishops = [blackBishop1, blackBishop2]
var blackRooks = [blackRook1, blackRook2]
var blackPawns = [blackPawn1, blackPawn2, blackPawn3, blackPawn4, blackPawn5, blackPawn6, blackPawn7, blackPawn8]
var blackQueens = [blackQueen]
var blackKings = [blackKing]

var whitePawns  = [whitePawn1, whitePawn2, whitePawn3, whitePawn4, whitePawn5, whitePawn6, whitePawn7, whitePawn8]
var whiteKnights = [whiteKnight1, whiteKnight2]
var whiteBishops = [whiteBishop1, whiteBishop2]
var whiteRooks = [whiteRook1, whiteRook2]
var whiteQueens = [whiteQueen]
var whiteKings = [whiteKing]

var whitePiecesArrs = [whitePawns,whiteKnights,whiteBishops,whiteRooks,whiteQueens,whiteKings]
var whitePiecesArrsString = ["whitePawn","whiteKnight","whiteBishop","whiteRook","whiteQueen","whiteKing"]

var blackPiecesArrs = [blackKnights,blackBishops,blackRooks,blackPawns, blackQueens, blackKings]
var blackPiecesArrsString = ["blackKnight","blackBishop","blackRook","blackPawn", "blackQueen", "blackKing"]

var blackPieces = [blackPawn1, blackPawn2, blackPawn3, blackPawn4, blackPawn5, blackPawn6, blackPawn7, blackPawn8, blackKnight1, blackKnight2, blackBishop1, blackBishop2, blackRook1, blackRook2, blackQueen, blackKing]
var blackPiecesString = ["blackPawn","blackPawn","blackPawn","blackKnight","blackBishop","blackRook"]
var whitePieces = [whitePawn1,whitePawn2, whitePawn3, whitePawn4, whitePawn5, whitePawn6, whitePawn7, whitePawn8, whiteKnight1, whiteKnight2 ,whiteBishop1, whiteBishop2, whiteRook1, whiteRook2 , whiteQueen, whiteKing]
var whitePiecesString = ["whitePawn","whitePawn","whitePawn","whitePawn","whitePawn","whitePawn","whitePawn","whitePawn","whiteKnight","whiteKnight","whiteBishop","whiteBishop","whiteRook","whiteQueen","whiteKing"]


//Must be equal!
var piecesArrs = [whiteQueens,whiteKings,whitePawns,blackPawns,whiteKnights,whiteBishops,whiteRooks, blackKnights, blackBishops, blackRooks, blackQueens, blackKings]
var piecesString = ["whiteQueen","whiteKing","whitePawn","blackPawn","whiteKnight","whiteBishop","whiteRook", "blackKnight", "blackBishop", "blackRook", "blackQueen", "blackKing"]
//

var pieces = [whitePawn1,whitePawn2, whitePawn3, whitePawn4, whitePawn5, whitePawn6, whitePawn7, whitePawn8, whiteKnight1,whiteBishop1, whiteRook1, whiteQueen, whiteKing,blackPawn1, blackPawn2, blackPawn3]


//bool to check if pieces are "alive"
var whitePawn1Alive = true
var whitePawn2Alive = true
var blackPawn1Alive = true

var moveByAmounty: CGFloat = 0.0
var moveByAmountx: CGFloat = 0.0

//initiated?
var selectedPiece: UIImageView = whitePawn1
var eatenPieces = UIImageView(frame: CGRectMake(a, _2, pieceSize , pieceSize))
var pieceCanTake : UIImageView = whitePawn1
var pieceToTake : UIImageView = whitePawn1
var canTake : Bool = false

var pawnState = 0
var movementallowed: CGFloat = 2

//let eatenPiece1 = UIImageView(frame: CGRectMake(a + 0.3 * pieceSize, _2 + 2.4 * pieceSize, 35 , 35))
//let eatenPiece2 = UIImageView(frame: CGRectMake(a + 0.8 * pieceSize, _2 + 2.4 * pieceSize, 35 , 35))
//let eatenPiece3 = UIImageView(frame: CGRectMake(a + 1.3 * pieceSize, _2 + 2.4 * pieceSize, 35 , 35))
//let eatenPiece4 = UIImageView(frame: CGRectMake(a + 1.8 * pieceSize, _2 + 2.4 * pieceSize, 35 , 35))
//let eatenPiece5 = UIImageView(frame: CGRectMake(a + 2.3 * pieceSize, _2 + 2.4 * pieceSize, 35 , 35))

var takenWhitePieces : Array<UIImageView> = []
var takenBlackPieces : Array<UIImageView> = []


var increasey : CGFloat = 1;
var increasex : CGFloat = 1;
var piecePos : Array<UIImageView> = []


class ViewController: UIViewController {
	
	let objc = Objective_C()
	
	@IBOutlet weak var chessBoard: UIImageView!
	
// MARK: - View did load! 😄
	override func viewDidLoad() {
		
		
		super.viewDidLoad()
		
		
		for var i = 0 ; i < 8; i++ {
			for var t = 0; t < 8; t++ {
					var pieceSqr = UIImageView(frame: CGRectMake(xAxisArr[t] , yAxisArr[i] , pieceSize, pieceSize))
					self.view.addSubview(pieceSqr)
					piecePos += [pieceSqr]
			}
		}
		
		//tab-bar and navigation bar
		self.tabBarController?.tabBar.hidden = true
		var nav = self.navigationController?.navigationBar
		nav?.barStyle = UIBarStyle.BlackTranslucent
		
		
		//load marker
		pieceMarked.image = UIImage(named: "pieceMarked.png")
		self.view.addSubview(pieceMarked)
		pieceMarked.hidden = true
		
		
		//chesspieces loading - REMEMBER TO ADD PIECES TO ARRAYS!! Right order as well!!

		for var i = 0; i < piecesArrs.count; i++ {
			for var t = 0; t < piecesArrs[i].count; t++ {
				piecesArrs[i][t].image = UIImage(named: piecesString[i])
				self.view.addSubview(piecesArrs[i][t])
				piecesArrs[i][t].contentMode = .ScaleAspectFit
				piecesArrs[i][t].userInteractionEnabled = true
				piecesArrs[i][t].multipleTouchEnabled = true
			}
		}
		
		println("\(screenHeight) is the height and \(screenWidth) is the width. \(screenSize) is the screensize. \(pieceSize) is the pieceSize")
		
	}
	
	
	
// MARK: - Setup-functions 🔍
	override func prefersStatusBarHidden() -> Bool {
		return true
	}
	
	override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
		return UIStatusBarAnimation.Slide
	}

// MARK: - Functions to make life easier 💕
	func movePiece(var _moveByAmountx:CGFloat,var _moveByAmounty:CGFloat) {
		resetTimer()
		hidePieceOptions()
		moveByAmountx = _moveByAmountx
		moveByAmounty = _moveByAmounty
		movementTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateMovementTimer"), userInfo: nil, repeats: true)
	}
	
	func hidePieceOptions() {
		for var p = 0 ; p < pieceOptions.count; p++ {
			pieceOptions[p].hidden = true
			pieceMarked.hidden = true
		}
		pieceOptions = []
	}
	

// MARK: - Pieces selected! 👾
	
	func whiteBishopSelected(var _event:UIEvent, var _touch:UITouch) {
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			for var t = 0; t < whiteBishops.count; t++ {
				
				if whiteBishops[t].frame.origin.x == selectedPiece.frame.origin.x && whiteBishops[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmountx; byAmountx >= -8 && byAmountx <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
						}
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = blackPieces[r]
								canThePieceGofurther = false
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}
						
					}
				}
			}
		}
		
		
		letThemAppear(1, 1, 1, 1)
		letThemAppear(1,-1,1,-1)
		letThemAppear(-1,1,-1,1)
		letThemAppear(-1,-1,-1,-1)
	}
	
	func whiteKnightSelected(var _event:UIEvent, var _touch:UITouch) {
		
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat, var byAmountz:CGFloat, var increaserz:CGFloat ) {
			var canThePieceGofurther: Bool = true
			
			for var t = 0; t < whiteKnights.count; t++ {
				
				if whiteKnights[t].frame.origin.x == selectedPiece.frame.origin.x && whiteKnights[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmountx; byAmountz <= 2; byAmountx += increaserx, byAmounty += increasery, byAmountz += increaserz {
						
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
							
						}
						
						
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true{
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = blackPieces[r]
								canThePieceGofurther = false
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}
						
					}
				}
			}
		}
		
		
		letThemAppear(2, 1, 0, 0, 1 ,1)
		letThemAppear(-2, 1, 0, 0, 1 ,1)
		letThemAppear(1, 2, 0, 0, 1 ,1)
		letThemAppear(1, -2, 0, 0, 1 ,1)
		letThemAppear(-1, 2, 0, 0, 1 ,1)
		letThemAppear(-1, -2, 0, 0, 1 ,1)
		letThemAppear(2, -1, 0, 0, 1 ,1)
		letThemAppear(-2, -1, 0, 0, 1 ,1)
		
		
	}

	
	func whiteRookSelected(var _event:UIEvent, var _touch:UITouch) {
		
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			for var t = 0; t < whiteRooks.count; t++ {
				
				if whiteRooks[t].frame.origin.x == selectedPiece.frame.origin.x && whiteRooks[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
						}
						
						
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = blackPieces[r]
								canThePieceGofurther = false
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}
						
					}
				}
			}
		}
		
		letThemAppear(0, 1, 0, 1)
		letThemAppear(0, -1, 0, -1)
		letThemAppear(1, 0, 1, 0)
		letThemAppear(-1, 0, -1, 0)
		
	}
	
	func whiteQueenSelected(var _event:UIEvent, var _touch:UITouch) {
		
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
				
				if whiteQueen.frame.origin.x == selectedPiece.frame.origin.x && whiteQueen.frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
						}
						
						
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = blackPieces[r]
								canThePieceGofurther = false
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}
						
					}
				}
			}
		
		letThemAppear(0, 1, 0, 1)
		letThemAppear(0, -1, 0, -1)
		letThemAppear(1, 0, 1, 0)
		letThemAppear(-1, 0, -1, 0)
		letThemAppear(1, 1, 1, 1)
		letThemAppear(1,-1,1,-1)
		letThemAppear(-1,1,-1,1)
		letThemAppear(-1,-1,-1,-1)
		
	}
	
	func whiteKingSelected(var _event:UIEvent, var _touch:UITouch) {
		
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			
			if whiteKing.frame.origin.x == selectedPiece.frame.origin.x && whiteKing.frame.origin.y == selectedPiece.frame.origin.y {
				
				for byAmountx; byAmountx >= -1 && byAmountx <= 1 && byAmounty >= -1 && byAmounty <= 1; byAmountx += increaserx, byAmounty += increasery {
					
					
					for var q = 0; q < whitePieces.count; q++ {
						if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
							canThePieceGofurther = false
						}
					}
					
					
					if canThePieceGofurther == true {
						
						var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
						pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						pieceOptions += [pieceOption]
					}
					
					
					for var r = 0; r < blackPieces.count; r++ {
						if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
							pieceCanTake = pieceOption
							pieceToTake = blackPieces[r]
							canThePieceGofurther = false
							
						}
					}
					for var o = 0 ; o < pieceOptions.count; o++ {
						if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
							[pieceOptions[o] .removeFromSuperview()]
							pieceOptions.removeAtIndex(o)
						}
					}
					
				}
			}
		}
		
		letThemAppear(0, 1, 0, 1)
		letThemAppear(0, -1, 0, -1)
		letThemAppear(1, 0, 1, 0)
		letThemAppear(-1, 0, -1, 0)
		letThemAppear(1, 1, 1, 1)
		letThemAppear(1,-1,1,-1)
		letThemAppear(-1,1,-1,1)
		letThemAppear(-1,-1,-1,-1)
		
	}

	
	func whitePawnSelected(var _event:UIEvent, var _touch:UITouch) {
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			var takeEitherWay: Bool = false
			
			for var t = 0; t < whitePawns.count; t++ {
				
				if whitePawns[t].frame.origin.x == selectedPiece.frame.origin.x && whitePawns[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmounty; byAmounty <= 2; byAmountx += increaserx, byAmounty += increasery {
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - 1 * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						for var q = 0; q < blackPieces.count; q++ {
							if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x && blackPieces[q].frame.origin.y + 1 * pieceSize == selectedPiece.frame.origin.y{
								canThePieceGofurther = false
							}
						}
						
						if canThePieceGofurther == true && selectedPiece.frame.origin.y == _2 {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							
							pieceOptions += [pieceOption]
						} else if canThePieceGofurther == true {
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							
							pieceOptions += [pieceOption]
						}
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x - byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - 1 * pieceSize {
								
								println("working")
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - byAmountx * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								canThePieceGofurther = false
								takeEitherWay == true
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}

						
					}
					
				}
			}
			
			
		}
		letThemAppear(1, 1, 0, 1)
		letThemAppear(-1, 1, 0, 1)
		
	}
	
	func blackPawnSelected(var _event:UIEvent, var _touch:UITouch) {
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			for var t = 0; t < blackPawns.count; t++ {
				
				if blackPawns[t].frame.origin.x == selectedPiece.frame.origin.x && blackPawns[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmounty;  byAmounty <= 2 ; byAmountx += increaserx, byAmounty += increasery {
						
						for var q = 0; q < blackPieces.count; q++ {
							if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y + 1 * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x && whitePieces[q].frame.origin.y - 1 * pieceSize == selectedPiece.frame.origin.y{
								canThePieceGofurther = false
							}
						}
						
						if canThePieceGofurther == true && selectedPiece.frame.origin.y == _7 {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							
							pieceOptions += [pieceOption]
						} else if canThePieceGofurther == true {
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + 1 * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							
							pieceOptions += [pieceOption]
						}
						for var r = 0; r < whitePieces.count; r++ {
							if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x - byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y + 1 * pieceSize {
								
								println("working")
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - byAmountx * pieceSize, selectedPiece.frame.origin.y + 1 * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								canThePieceGofurther = false
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}
						
						
					}
					
				}
			}
			
			
		}
		letThemAppear(1, 1, 0, 1)
		letThemAppear(-1, 1, 0, 1)
		
	}
	
	func blackBishopSelected(var _event:UIEvent, var _touch:UITouch) {
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			for var t = 0; t < blackBishops.count; t++ {
				
				if blackBishops[t].frame.origin.x == selectedPiece.frame.origin.x && blackBishops[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmountx; byAmountx >= -8 && byAmountx <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						
						for var q = 0; q < blackPieces.count; q++ {
							if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
						}
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = blackPieces[r]
								canThePieceGofurther = false
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}
						
					}
				}
			}
		}
		
		
		letThemAppear(1, 1, 1, 1)
		letThemAppear(1,-1,1,-1)
		letThemAppear(-1,1,-1,1)
		letThemAppear(-1,-1,-1,-1)
	}
	
	func blackKnightSelected(var _event:UIEvent, var _touch:UITouch) {
		
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat, var byAmountz:CGFloat, var increaserz:CGFloat ) {
			var canThePieceGofurther: Bool = true
			
			for var t = 0; t < blackKnights.count; t++ {
				
				if blackKnights[t].frame.origin.x == selectedPiece.frame.origin.x && blackKnights[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmountx; byAmountz <= 2; byAmountx += increaserx, byAmounty += increasery, byAmountz += increaserz {
						
						
						for var q = 0; q < blackPieces.count; q++ {
							if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
							
						}
						
						
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true{
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = blackPieces[r]
								canThePieceGofurther = false
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}
						
					}
				}
			}
		}
		
		
		letThemAppear(2, 1, 0, 0, 1 ,1)
		letThemAppear(-2, 1, 0, 0, 1 ,1)
		letThemAppear(1, 2, 0, 0, 1 ,1)
		letThemAppear(1, -2, 0, 0, 1 ,1)
		letThemAppear(-1, 2, 0, 0, 1 ,1)
		letThemAppear(-1, -2, 0, 0, 1 ,1)
		letThemAppear(2, -1, 0, 0, 1 ,1)
		letThemAppear(-2, -1, 0, 0, 1 ,1)
		
		
	}
	
	func blackRookSelected(var _event:UIEvent, var _touch:UITouch) {
		
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			for var t = 0; t < blackRooks.count; t++ {
				
				if blackRooks[t].frame.origin.x == selectedPiece.frame.origin.x && blackRooks[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						
						for var q = 0; q < blackPieces.count; q++ {
							if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
						}
						
						
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = blackPieces[r]
								canThePieceGofurther = false
								
							}
						}
						for var o = 0 ; o < pieceOptions.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
								[pieceOptions[o] .removeFromSuperview()]
								pieceOptions.removeAtIndex(o)
							}
						}
						
					}
				}
			}
		}
		
		letThemAppear(0, 1, 0, 1)
		letThemAppear(0, -1, 0, -1)
		letThemAppear(1, 0, 1, 0)
		letThemAppear(-1, 0, -1, 0)
		
	}
	
	func blackQueenSelected(var _event:UIEvent, var _touch:UITouch) {
		
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			
			if blackQueen.frame.origin.x == selectedPiece.frame.origin.x && blackQueen.frame.origin.y == selectedPiece.frame.origin.y {
				
				for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
					
					
					for var q = 0; q < blackPieces.count; q++ {
						if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
							canThePieceGofurther = false
						}
					}
					
					
					if canThePieceGofurther == true {
						
						var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
						pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						pieceOptions += [pieceOption]
					}
					
					
					for var r = 0; r < blackPieces.count; r++ {
						if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
							pieceCanTake = pieceOption
							pieceToTake = blackPieces[r]
							canThePieceGofurther = false
							
						}
					}
					for var o = 0 ; o < pieceOptions.count; o++ {
						if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
							[pieceOptions[o] .removeFromSuperview()]
							pieceOptions.removeAtIndex(o)
						}
					}
					
				}
			}
		}
		
		letThemAppear(0, 1, 0, 1)
		letThemAppear(0, -1, 0, -1)
		letThemAppear(1, 0, 1, 0)
		letThemAppear(-1, 0, -1, 0)
		letThemAppear(1, 1, 1, 1)
		letThemAppear(1,-1,1,-1)
		letThemAppear(-1,1,-1,1)
		letThemAppear(-1,-1,-1,-1)
		
	}
	
	func blackKingSelected(var _event:UIEvent, var _touch:UITouch) {
		
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			
			if blackKing.frame.origin.x == selectedPiece.frame.origin.x && blackKing.frame.origin.y == selectedPiece.frame.origin.y {
				
				for byAmountx; byAmountx >= -1 && byAmountx <= 1 && byAmounty >= -1 && byAmounty <= 1; byAmountx += increaserx, byAmounty += increasery {
					
					
					for var q = 0; q < blackPieces.count; q++ {
						if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
							canThePieceGofurther = false
						}
					}
					
					
					if canThePieceGofurther == true {
						
						var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
						pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						pieceOptions += [pieceOption]
					}
					
					
					for var r = 0; r < blackPieces.count; r++ {
						if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
							pieceCanTake = pieceOption
							pieceToTake = blackPieces[r]
							canThePieceGofurther = false
							
						}
					}
					for var o = 0 ; o < pieceOptions.count; o++ {
						if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
							[pieceOptions[o] .removeFromSuperview()]
							pieceOptions.removeAtIndex(o)
						}
					}
					
				}
			}
		}
		
		letThemAppear(0, 1, 0, 1)
		letThemAppear(0, -1, 0, -1)
		letThemAppear(1, 0, 1, 0)
		letThemAppear(-1, 0, -1, 0)
		letThemAppear(1, 1, 1, 1)
		letThemAppear(1,-1,1,-1)
		letThemAppear(-1,1,-1,1)
		letThemAppear(-1,-1,-1,-1)
		
	}



	


	
	
// MARK: - Timer-functions ⏳
	func resetTimer() {
		movementTimer.invalidate()
		timerNumber = 0
	}
	
	func updateMovementTimer() {
		//              var piece: UIImageView = timer.userInfo! as UIImageView
		timerNumber++
		if timerNumber > 10 {
			movementTimer.invalidate()
			
		}
			
		else {
			var positionx = selectedPiece.frame.origin.x
			var positiony = selectedPiece.frame.origin.y
			positiony +=  moveByAmounty / 10
			positionx += moveByAmountx / 10
			println("positiony: " + "\(positiony)")
			println("positionx: " + "\(positionx)")
			selectedPiece.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
			
			
		}
		
	}
	
	// MARK: - Touches began! 👆
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		
		let touch :UITouch = event.allTouches()?.anyObject() as UITouch
		
		for var o = 0 ; o < piecePos.count; o++ {
			if CGRectContainsPoint(selectedPiece.frame, piecePos[o].center) {
				selectedPiece.frame.origin.x = piecePos[o].frame.origin.x
				selectedPiece.frame.origin.y = piecePos[o].frame.origin.y
			}
		}
		
		for var i = 0; i < whitePawns.count;i++ {
			if touch.view == whitePawns[i] {
				selectedPiece = whitePawns[i]
				whitePawnSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		}
		
		for var o = 0 ; o < pieceOptions.count ; o++ {
			
			if touch.view == pieceOptions[o] {
			for var i = 0; i < whitePieces.count; i++ {
				if touch.view == pieceOptions[o] && pieceOptions[o].frame.origin.x == whitePieces[i].frame.origin.x && pieceOptions[o].frame.origin.y == whitePieces[i].frame.origin.y  {
					
					whitePieces[i].removeFromSuperview()
					whitePieces.removeAtIndex(i)
					
					var takenPiece = UIImageView(frame: CGRectMake(CGFloat(takenWhitePieces.count) * pieceSize * 0.65, screenHeight / 2 - 5 * pieceSize + pieceSize * 0.05, pieceSize * 0.65, pieceSize * 0.65))
					takenPiece.image = UIImage(named: whitePiecesString[i])
					takenWhitePieces += [takenPiece]
					self.view.addSubview(takenPiece)
				}
				}
				
			for var t = 0; t < blackPieces.count; t++ {
				if touch.view == pieceOptions[o] && pieceOptions[o].frame.origin.x == blackPieces[t].frame.origin.x && pieceOptions[o].frame.origin.y == blackPieces[t].frame.origin.y  {
					
					blackPieces[t].removeFromSuperview()
					blackPieces.removeAtIndex(t)
					
					var takenPiece = UIImageView(frame: CGRectMake(CGFloat(takenBlackPieces.count) * pieceSize * 0.65, screenHeight / 2 + 4 * pieceSize + pieceSize * 0.3, pieceSize * 0.65, pieceSize * 0.65))
					takenPiece.image = UIImage(named: blackPiecesString[t])
					takenBlackPieces += [takenPiece]
					self.view.addSubview(takenPiece)
				}
			}
				
		}
			
	}

		
		for var o = 0 ; o < pieceOptions.count ; o++ {
			for var t = 0; t < whitePieces.count; t++ {
				
				if touch.view == pieceOptions[o] && pieceOptions[o].frame.origin.x == whitePieces[t].frame.origin.x && pieceOptions[o].frame.origin.y == whitePieces[t].frame.origin.y  {
					whitePieces[t].removeFromSuperview()
					whitePieces.removeAtIndex(t)
				}
				
				
			}
		}
		
		for var i = 0; i < whiteKnights.count;i++ {
			if touch.view == whiteKnights[i] {
				selectedPiece = whiteKnight1
				whiteKnightSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		}
		
		for var i = 0; i < whiteBishops.count;i++ {
			if touch.view == whiteBishops[i] {
				selectedPiece = whiteBishop1
				whiteBishopSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		}
		
		for var i = 0; i < whiteRooks.count;i++ {
			if touch.view == whiteRooks[i] {
				selectedPiece = whiteRook1
				whiteRookSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		}
		
		if touch.view == whiteQueen {
			selectedPiece = whiteQueen
			whiteQueenSelected(event, _touch: touch)
			pieceMarked.hidden = false
			pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
		}

		if touch.view == whiteKing {
			selectedPiece = whiteKing
			whiteKingSelected(event, _touch: touch)
			pieceMarked.hidden = false
			pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
		}
		
		
		for var i = 0; i < blackPawns.count;i++ {
			if touch.view == blackPawns[i] {
				selectedPiece = blackPawns[i]
				blackPawnSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		}
		
		for var i = 0; i < blackBishops.count;i++ {
			if touch.view == blackBishops[i] {
				selectedPiece = blackBishops[i]
				blackBishopSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		}
		
		for var i = 0; i < blackKnights.count;i++ {
			if touch.view == blackKnights[i] {
				selectedPiece = blackKnights[i]
				blackKnightSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		}
		
		for var i = 0; i < blackRooks.count;i++ {
			if touch.view == blackRooks[i] {
				selectedPiece = blackRooks[i]
				blackRookSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		}
		
			if touch.view == blackQueen {
				selectedPiece = blackQueen
				blackQueenSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}
		
			if touch.view == blackKing {
				selectedPiece = blackKing
				blackKnightSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
			}

		
		//check pieceOptions
		for var o = 0 ; o < pieceOptions.count; o++ {
			pieceOptions[o].userInteractionEnabled = true
			pieceOptions[o].multipleTouchEnabled = true
			
			if touch.view == pieceOptions[o] {
				movePiece(pieceOptions[o].frame.origin.x - selectedPiece.frame.origin.x, _moveByAmounty: pieceOptions[o].frame.origin.y - selectedPiece.frame.origin.y)
			}
		}
	}
	
}