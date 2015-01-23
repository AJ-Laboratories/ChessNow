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

let xAxisArrStr = ["a","b","c","d","e","f","g","h"]

let canShow : Bool = true

var num = 0

var blackPawnCount = 0
var blackBishopCount = 0
var blackKnightCount = 0
var blackRookCount = 0
var blackQueenCount = 0

var blackCuont : Array<Int> = [blackPawnCount,blackBishopCount,blackKnightCount,blackRookCount,blackQueenCount]

var whiteMoves : Array<UILabel> = [whiteMove1, whiteMove2, whiteMove3]
var whiteMove1 = UILabel(frame: CGRectMake(pieceSize * 6, screenHeight / 1.3 + CGFloat(0) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
var whiteMove2 = UILabel(frame: CGRectMake(pieceSize * 6, screenHeight / 1.3 + CGFloat(1) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
var whiteMove3 = UILabel(frame: CGRectMake(pieceSize * 6, screenHeight / 1.3 + CGFloat(2) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
var move = num + 1

var takenPiece = UILabel(frame: CGRectMake(CGFloat(takenBlackPieces.count - 1) * pieceSize * 0.50, screenHeight / 2 + 4.45 * pieceSize + pieceSize * 0.3, pieceSize * 0.65, pieceSize * 0.65))
var takenBishop = UILabel(frame: CGRectMake(CGFloat(takenBlackPieces.count - 1) * pieceSize * 0.50, screenHeight / 2 + 4.45 * pieceSize + pieceSize * 0.3, pieceSize * 0.65, pieceSize * 0.65))
var takenKnight = UILabel(frame: CGRectMake(CGFloat(takenBlackPieces.count - 1) * pieceSize * 0.50, screenHeight / 2 + 4.45 * pieceSize + pieceSize * 0.3, pieceSize * 0.65, pieceSize * 0.65))
var takenRook = UILabel(frame: CGRectMake(CGFloat(takenBlackPieces.count - 1) * pieceSize * 0.50, screenHeight / 2 + 4.45 * pieceSize + pieceSize * 0.3, pieceSize * 0.65, pieceSize * 0.65))
var takenQueen = UILabel(frame: CGRectMake(CGFloat(takenBlackPieces.count - 1) * pieceSize * 0.50, screenHeight / 2 + 4.45 * pieceSize + pieceSize * 0.3, pieceSize * 0.65, pieceSize * 0.65))
var takenPiecesLbl :Array<UILabel> = [takenPiece, takenBishop, takenKnight, takenRook, takenQueen]
var takenPiecesShow :Array<UILabel> = []

var blackPiecesTypes = ["blackPawn","blackBishop","blackKnight","blackRook", "blackQueen"]


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

let yAxisArrStr = ["1","2","3","4","5","6","7","8"]


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

var selectedPawn = 0
var pieceOpt = whitePawn1

// Check-mate piece possiblities
var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
var pieceOption2 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))

var pieceOption3 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
var pieceOption4 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))

var pieceOption5 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
var pieceOption6 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))

var pieceOption7 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
var pieceOption8 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))

var pieceOption9 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
var pieceOption10 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))

var pieceOption11 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
var pieceOption12 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))

var pieceOption13 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
var pieceOption14 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))

var pieceOption15 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
var pieceOption16 = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))

// Check-mate system
var dangerPos = [dangerPawn1, dangerPawn2, dangerPawn3, dangerPawn4, dangerPawn5, dangerPawn6, dangerPawn7, dangerPawn8]
var dangerPawn1: Array<UIImageView> = [pieceOption, pieceOption2]
var dangerPawn2: Array<UIImageView> = [pieceOption3, pieceOption4]
var dangerPawn3: Array<UIImageView> = [pieceOption5, pieceOption6]
var dangerPawn4: Array<UIImageView> = [pieceOption7, pieceOption8]
var dangerPawn5: Array<UIImageView> = [pieceOption9, pieceOption10]
var dangerPawn6: Array<UIImageView> = [pieceOption11, pieceOption12]
var dangerPawn7: Array<UIImageView> = [pieceOption13, pieceOption14]
var dangerPawn8: Array<UIImageView> = [pieceOption15, pieceOption16]

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
var blackPiecesString = ["blackPawn","blackPawn","blackPawn", "blackPawn", "blackPawn", "blackPawn",  "blackPawn", "blackPawn", "blackKnight", "blackKnight", "blackBishop",  "blackBishop", "blackRook", "blackRook", "blackQueen", "blackKing" ]
var whitePieces = [whitePawn1,whitePawn2, whitePawn3, whitePawn4, whitePawn5, whitePawn6, whitePawn7, whitePawn8, whiteKnight1, whiteKnight2 ,whiteBishop1, whiteBishop2, whiteRook1, whiteRook2 , whiteQueen, whiteKing]
var whitePiecesString = ["whitePawn","whitePawn","whitePawn","whitePawn","whitePawn","whitePawn","whitePawn","whitePawn","whiteKnight","whiteKnight","whiteBishop","whiteBishop","whiteRook", "whiteRook", "whiteQueen","whiteKing"]


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

var takenWhitePieces : Array<UIImageView> = []
var takenBlackPieces : Array<UIImageView> = []


var increasey : CGFloat = 1;
var increasex : CGFloat = 1;
var piecePos : Array<UIImageView> = []

var isWhiteTurn = true

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
		removePieceOptions()
		moveByAmountx = _moveByAmountx
		moveByAmounty = _moveByAmounty
		movementTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateMovementTimer"), userInfo: nil, repeats: true)
		if isWhiteTurn == true {
			isWhiteTurn = false
		}
		else if isWhiteTurn == false {
		isWhiteTurn = true
		}
	}
	
	func showMarkedPiece() {
		pieceMarked.hidden = false
		pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
	}
	
	func removePieceOptions() {
		for var p = 0 ; p < pieceOptions.count; p++ {
			pieceOptions[p].hidden = true
			pieceMarked.hidden = true
			pieceOptions[p].removeFromSuperview()
		}
		pieceOptions = []
	}
	

	
	
	// MARK: - Pieces selected! 👾
	
	func whiteBishopSelected(var _event:UIEvent, var _touch:UITouch) {
		
			showMarkedPiece()
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
		
		showMarkedPiece()
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
		
		showMarkedPiece()

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
		
		showMarkedPiece()

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
						pieceOption.image = UIImage(named: "piecePossibilities")
						self.view.addSubview(pieceOption)
						pieceOptions += [pieceOption]
					}
					
					
					for var r = 0; r < blackPieces.count; r++ {
						if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities")
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
	
	func whitePawnDanger() {
		
		for var t = 0; t < whitePawns.count; t++ {
			
			if whitePawns[t].frame.origin.x == selectedPiece.frame.origin.x && whitePawns[t].frame.origin.y == selectedPiece.frame.origin.y {
				
				dangerPos[selectedPawn][0].frame = (frame: CGRectMake(selectedPiece.frame.origin.x + 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
				dangerPos[selectedPawn][0].image = UIImage(named: "")
				dangerPos[selectedPawn][1].frame = (frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
				dangerPos[selectedPawn][1].image = UIImage(named: "")
				self.view.addSubview(dangerPos[selectedPawn][0])
				self.view.addSubview(dangerPos[selectedPawn][1])
			}
		}
	}
	
	
	
	
	func whiteKingSelected(var _event:UIEvent, var _touch:UITouch) {
		
		showMarkedPiece()

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
		showMarkedPiece()

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
		showMarkedPiece()

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
		showMarkedPiece()

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
						for var r = 0; r < whitePieces.count; r++ {
							if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = whitePieces[r]
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
		
		showMarkedPiece()

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
						
						
						for var r = 0; r < whitePieces.count; r++ {
							if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true{
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = whitePieces[r]
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
		showMarkedPiece()

		
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
						
						
						for var r = 0; r < whitePieces.count; r++ {
							if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								pieceCanTake = pieceOption
								pieceToTake = whitePieces[r]
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
		showMarkedPiece()

		
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
					
					
					for var r = 0; r < whitePieces.count; r++ {
						if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
							
							var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
							pieceCanTake = pieceOption
							pieceToTake = whitePieces[r]
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
		
		showMarkedPiece()

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
					
					
					for var r = 0; r < whitePieces.count; r++ {
						if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize {
							
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
						pieceOpt = pieceOptions[o]
						if CGRectContainsPoint(boarderBoard.frame, pieceOptions[o].center) == false {
							[pieceOptions[o] .removeFromSuperview()]
							pieceOptions.removeAtIndex(o)
						}
						
					}
					for var o = 0 ; o < pieceOptions.count; o++ {
						for var i = 0 ; i < 8; i++ {
							if CGRectContainsPoint(pieceOptions[o].frame, dangerPos[i][0].center){
								pieceOptions[o].hidden = true
							} else if CGRectContainsPoint(pieceOptions[o].frame, dangerPos[i][1].center){
								pieceOptions[o].hidden = true
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
			whitePawnDanger()
		}
			
		else {
			var positionx = selectedPiece.frame.origin.x
			var positiony = selectedPiece.frame.origin.y
			positiony +=  moveByAmounty / 10
			positionx += moveByAmountx / 10
			//println("positiony: " + "\(positiony)")
			//println("positionx: " + "\(positionx)")
			selectedPiece.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
			
			
		}
		
	}
	func contains(var _imageArray:Array<UIImageView>, var _image: UIImageView) -> Bool {
		
		var bool = false
		for var i = 0; i < _imageArray.count; i++ {
			
			if (_imageArray[i].image == _image.image) {
				bool = true
			}
		}
		
		return bool
	}
	
	func containsLabel(var _labelArray:Array<UILabel>, var _label: UILabel) -> Bool {
		
		var bool = false
		for var i = 0; i < _labelArray.count; i++ {
			
			if (_labelArray[i] == _label) {
				bool = true
			}
		}
		
		return bool
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
			if touch.view == whitePawns[i] && isWhiteTurn == true {
				selectedPiece = whitePawns[i]
				removePieceOptions()
				whitePawnSelected(event, _touch: touch)
				selectedPawn = i
			}
			
		}
		
		
		for var o = 0 ; o < pieceOptions.count ; o++ {
			
			if touch.view == pieceOptions[o] {
				for var i = 0; i < whitePieces.count; i++ {
					if touch.view == pieceOptions[o] && pieceOptions[o].frame.origin.x == whitePieces[i].frame.origin.x && pieceOptions[o].frame.origin.y == whitePieces[i].frame.origin.y  {
						pieceToTake = whitePieces[i]
						whitePieces[i].removeFromSuperview()
						whitePieces.removeAtIndex(i)
						
						if (!contains(takenWhitePieces, _image: pieceToTake)) {
							var takenPiece = UIImageView(frame: CGRectMake(CGFloat(takenWhitePieces.count) * pieceSize * 0.50, screenHeight / 2 - 5 * pieceSize + pieceSize * 0.05, pieceSize * 0.65, pieceSize * 0.65))
							takenPiece.image = UIImage(named: whitePiecesString[i])
							takenWhitePieces += [takenPiece]
							self.view.addSubview(takenPiece)
						}
						whitePiecesString.removeAtIndex(i)
					}
					
					for var t = 0; t < 8; t++ {
						for var g = 0; g < 8; g++ {
							if (pieceOptions[o].frame.origin.x == xAxisArr[t] && pieceOptions[o].frame.origin.y == yAxisArr[g] && touch.view == pieceOptions[o] && selectedPiece == whitePieces[i]) {
								println(xAxisArrStr[t] + yAxisArrStr[g])
								if (num < 3) {
									move = num + 1
									whiteMoves[num].text = (move.description + ".  " ) + xAxisArrStr[t] + yAxisArrStr[g]
									whiteMoves[num].textColor = UIColor .whiteColor()
									self.view.addSubview(whiteMoves[num])
									num+=1
								} else {
									whiteMoves[0].text = whiteMoves[1].text
									whiteMoves[1].text = whiteMoves[2].text
									move += 1
									whiteMoves[2].text = (move.description + ".  " ) + xAxisArrStr[t] + yAxisArrStr[g]
									
								}
							}
						}
					}
				}
				
				for var t = 0; t < blackPieces.count; t++ {
					if touch.view == pieceOptions[o] && pieceOptions[o].frame.origin.x == blackPieces[t].frame.origin.x && pieceOptions[o].frame.origin.y == blackPieces[t].frame.origin.y  {
						pieceToTake = blackPieces[t]
						blackPieces[t].removeFromSuperview()
						blackPieces.removeAtIndex(t)
						
						if (!contains(takenBlackPieces, _image: pieceToTake)) {
							var takenPiece = UIImageView(frame: CGRectMake(CGFloat(takenBlackPieces.count) * pieceSize * 0.50, screenHeight / 2 + 4 * pieceSize + pieceSize * 0.3, pieceSize * 0.65, pieceSize * 0.65))
							takenPiece.image = UIImage(named: blackPiecesString[t])
							
							takenBlackPieces += [takenPiece]
							self.view.addSubview(takenPiece)
						}
						blackPiecesString.removeAtIndex(t)
						
						for var i = 0; i < takenPiecesLbl.count; i++ {
							if (pieceToTake.image == UIImage(named: blackPiecesTypes[i])) {
								blackCuont[i] += 1
								if (!containsLabel(takenPiecesShow, _label: takenPiecesLbl[i])) {
									takenPiecesLbl[i].frame = CGRectMake(CGFloat(takenBlackPieces.count - 1) * pieceSize * 0.50, screenHeight / 2 + 4.45 * pieceSize + pieceSize * 0.3, pieceSize * 0.65, pieceSize * 0.65)
									takenPiecesShow += [takenPiecesLbl[i]]
								}
								takenPiecesLbl[i].text = "x" + blackCuont[i].description
								takenPiecesLbl[i].textColor = UIColor.whiteColor()
								takenPiecesLbl[i].textAlignment = NSTextAlignment.Center
								self.view.addSubview(takenPiecesLbl[i])
								
							}
						}
						
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
			if touch.view == whiteKnights[i] && isWhiteTurn == true {
				selectedPiece = whiteKnights[i]
				removePieceOptions()
				whiteKnightSelected(event, _touch: touch)
			}
		}
		
		for var i = 0; i < whiteBishops.count; i++ {
			if touch.view == whiteBishops[i] && isWhiteTurn == true {
				selectedPiece = whiteBishops[i]
				removePieceOptions()
				whiteBishopSelected(event, _touch: touch)
			}
		}
		
		for var i = 0; i < whiteRooks.count;i++ {
			if touch.view == whiteRooks[i] && isWhiteTurn == true {
				removePieceOptions()
				selectedPiece = whiteRooks[i]
				whiteRookSelected(event, _touch: touch)
			}
		}
		
		if touch.view == whiteQueen && isWhiteTurn == true {
			selectedPiece = whiteQueen
			removePieceOptions()
			whiteQueenSelected(event, _touch: touch)
		}
		
		if touch.view == whiteKing && isWhiteTurn == true {
			selectedPiece = whiteKing
			removePieceOptions()
			whiteKingSelected(event, _touch: touch)
		}
		
		
		for var i = 0; i < blackPawns.count;i++ {
			if touch.view == blackPawns[i] && isWhiteTurn == false {
				selectedPiece = blackPawns[i]
				removePieceOptions()
				blackPawnSelected(event, _touch: touch)
			}
		}
		
		for var i = 0; i < blackBishops.count;i++ {
			if touch.view == blackBishops[i] && isWhiteTurn == false {
				selectedPiece = blackBishops[i]
				removePieceOptions()
				blackBishopSelected(event, _touch: touch)
			}
		}
		
		for var i = 0; i < blackKnights.count;i++ {
			if touch.view == blackKnights[i] && isWhiteTurn == false {
				selectedPiece = blackKnights[i]
				removePieceOptions()
				blackKnightSelected(event, _touch: touch)
			}
		}
		
		for var i = 0; i < blackRooks.count;i++ {
			if touch.view == blackRooks[i] && isWhiteTurn == false {
				selectedPiece = blackRooks[i]
				removePieceOptions()
				blackRookSelected(event, _touch: touch)
			}
		}
		
		if touch.view == blackQueen && isWhiteTurn == false {
			selectedPiece = blackQueen
			removePieceOptions()
			blackQueenSelected(event, _touch: touch)
		}
		
		if touch.view == blackKing && isWhiteTurn == false {
			selectedPiece = blackKing
			removePieceOptions()
			blackKingSelected(event, _touch: touch)
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