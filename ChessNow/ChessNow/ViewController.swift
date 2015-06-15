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

var check = false
var checkBlack = false

var showDangerOpt : Bool = true

var dontRemove : Bool = false
var show : Bool = true

//Black
var moveAllowed: Bool = true
var moveAllowed2: Bool = true
var moveAllowed3: Bool = true
var moveAllowed4: Bool = true
var moveAllowed5: Bool = true

//White
var moveBAllowed: Bool = true
var moveBAllowed2: Bool = true
var moveBAllowed3: Bool = true
var moveBAllowed4: Bool = true
var moveBAllowed5: Bool = true

var canTake: Bool = true
var canTakeBlack: Bool = true

var int = 0
// Check logic for black pieces
var checkPiece = 0
var checkPiece2 = 0
var checkPiece3 = 0
var checkPiece4 = 0
var checkPiece5 = 0

// Check logic for white pieces
var checkPieceWhite = 0
var checkPieceWhite2 = 0
var checkPieceWhite3 = 0
var checkPieceWhite4 = 0
var checkPieceWhite5 = 0

var showDanger = [pawnShowDanger1,pawnShowDanger2, pawnShowDanger3, pawnShowDanger4, pawnShowDanger5, pawnShowDanger6, pawnShowDanger7, pawnShowDanger8, knightShowDanger, knightShowDanger2, bishopShowDanger, bishopShowDanger2,rookShowDanger, rookShowDanger2, queenShowDanger, kingShowDanger, pawnBShowDanger1,pawnBShowDanger2, pawnBShowDanger3, pawnBShowDanger4, pawnBShowDanger5, pawnBShowDanger6, pawnBShowDanger7, pawnBShowDanger8, knightBShowDanger, knightBShowDanger2, bishopBShowDanger, bishopBShowDanger2,rookBShowDanger, rookBShowDanger2, queenBShowDanger, kingBShowDanger]

var queenShowDanger : Bool = true
var kingShowDanger : Bool = true

var bishopShowDanger : Bool = true
var bishopShowDanger2 : Bool = true

var rookShowDanger : Bool = true
var rookShowDanger2 : Bool = true

var knightShowDanger : Bool = true
var knightShowDanger2 : Bool = true

var pawnShowDanger1 : Bool = true
var pawnShowDanger2 : Bool = true
var pawnShowDanger3 : Bool = true
var pawnShowDanger4 : Bool = true
var pawnShowDanger5 : Bool = true
var pawnShowDanger6 : Bool = true
var pawnShowDanger7 : Bool = true
var pawnShowDanger8 : Bool = true

var queenBShowDanger : Bool = true
var kingBShowDanger : Bool = true

var bishopBShowDanger : Bool = true
var bishopBShowDanger2 : Bool = true

var rookBShowDanger : Bool = true
var rookBShowDanger2 : Bool = true

var knightBShowDanger : Bool = true
var knightBShowDanger2 : Bool = true

var pawnBShowDanger1 : Bool = true
var pawnBShowDanger2 : Bool = true
var pawnBShowDanger3 : Bool = true
var pawnBShowDanger4 : Bool = true
var pawnBShowDanger5 : Bool = true
var pawnBShowDanger6 : Bool = true
var pawnBShowDanger7 : Bool = true
var pawnBShowDanger8 : Bool = true

var size : CGFloat = pieceSize

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

// Check-mate system
var dangerWhitePieces: Array<UIImageView> = []
var dangerBlackPieces: Array<UIImageView> = []

var dangerPieces: Array<UIImageView> = []
// This has something with check to do
var extraPieces: Array<UIImageView> = []
var extraPiecesBlack: Array<UIImageView> = []

// White extra pieces for check
var extraPiecesQueen = [extraPQ1, extraPQ2, extraPQ3, extraPQ4, extraPQ5, extraPQ6, extraPQ7, extraPQ8]

var extraPQ1: Array<UIImageView> = []
var extraPQ2: Array<UIImageView> = []
var extraPQ3: Array<UIImageView> = []
var extraPQ4: Array<UIImageView> = []
var extraPQ5: Array<UIImageView> = []
var extraPQ6: Array<UIImageView> = []
var extraPQ7: Array<UIImageView> = []
var extraPQ8: Array<UIImageView> = []

var extraWhiteBishop = [extraWB1, extraWB2, extraWB3, extraWB4]

var extraWB1: Array<UIImageView> = []
var extraWB2: Array<UIImageView> = []
var extraWB3: Array<UIImageView> = []
var extraWB4: Array<UIImageView> = []

var extraWhiteBishop2 = [extra2WB1, extra2WB2, extra2WB3, extra2WB4]

var extra2WB1: Array<UIImageView> = []
var extra2WB2: Array<UIImageView> = []
var extra2WB3: Array<UIImageView> = []
var extra2WB4: Array<UIImageView> = []

var extraWhiteRook = [extraWR1, extraWR2, extraWR3, extraWR4]

var extraWR1: Array<UIImageView> = []
var extraWR2: Array<UIImageView> = []
var extraWR3: Array<UIImageView> = []
var extraWR4: Array<UIImageView> = []

var extraWhiteRook2 = [extra2WR1, extra2WR2, extra2WR3, extra2WR4]

var extra2WR1: Array<UIImageView> = []
var extra2WR2: Array<UIImageView> = []
var extra2WR3: Array<UIImageView> = []
var extra2WR4: Array<UIImageView> = []

// Black extra pieces for check

var extraBlackPiecesQueen = [extraBPQ1, extraBPQ2, extraBPQ3, extraBPQ4, extraBPQ5, extraBPQ6, extraBPQ7, extraBPQ8]

var extraBPQ1: Array<UIImageView> = []
var extraBPQ2: Array<UIImageView> = []
var extraBPQ3: Array<UIImageView> = []
var extraBPQ4: Array<UIImageView> = []
var extraBPQ5: Array<UIImageView> = []
var extraBPQ6: Array<UIImageView> = []
var extraBPQ7: Array<UIImageView> = []
var extraBPQ8: Array<UIImageView> = []

var extraBlackBishop = [extraBB1, extraBB2, extraBB3, extraBB4]

var extraBB1: Array<UIImageView> = []
var extraBB2: Array<UIImageView> = []
var extraBB3: Array<UIImageView> = []
var extraBB4: Array<UIImageView> = []

var extraBlackBishop2 = [extra2BB1, extra2BB2, extra2BB3, extra2BB4]

var extra2BB1: Array<UIImageView> = []
var extra2BB2: Array<UIImageView> = []
var extra2BB3: Array<UIImageView> = []
var extra2BB4: Array<UIImageView> = []

var extraBlackRook = [extraBR1, extraBR2, extraBR3, extraBR4]

var extraBR1: Array<UIImageView> = []
var extraBR2: Array<UIImageView> = []
var extraBR3: Array<UIImageView> = []
var extraBR4: Array<UIImageView> = []

var extraBlackRook2 = [extra2BR1, extra2BR2, extra2BR3, extra2BR4]

var extra2BR1: Array<UIImageView> = []
var extra2BR2: Array<UIImageView> = []
var extra2BR3: Array<UIImageView> = []
var extra2BR4: Array<UIImageView> = []

// White danger
var dangerWhiteQueen = [dangerWQ1, dangerWQ2, dangerWQ3, dangerWQ4, dangerWQ5, dangerWQ6, dangerWQ7, dangerWQ8]

var dangerWQ1: Array<UIImageView> = []
var dangerWQ2: Array<UIImageView> = []
var dangerWQ3: Array<UIImageView> = []
var dangerWQ4: Array<UIImageView> = []
var dangerWQ5: Array<UIImageView> = []
var dangerWQ6: Array<UIImageView> = []
var dangerWQ7: Array<UIImageView> = []
var dangerWQ8: Array<UIImageView> = []

var dangerWhiteBishop = [dangerWB1, dangerWB2, dangerWB3, dangerWB4]

var dangerWB1: Array<UIImageView> = []
var dangerWB2: Array<UIImageView> = []
var dangerWB3: Array<UIImageView> = []
var dangerWB4: Array<UIImageView> = []

var dangerWhiteBishop2 = [danger2WB1, danger2WB2, danger2WB3, danger2WB4]

var danger2WB1: Array<UIImageView> = []
var danger2WB2: Array<UIImageView> = []
var danger2WB3: Array<UIImageView> = []
var danger2WB4: Array<UIImageView> = []

var dangerWhiteRook = [dangerWR1, dangerWR2, dangerWR3, dangerWR4]

var dangerWR1: Array<UIImageView> = []
var dangerWR2: Array<UIImageView> = []
var dangerWR3: Array<UIImageView> = []
var dangerWR4: Array<UIImageView> = []

var dangerWhiteRook2 = [danger2WR1, danger2WR2, danger2WR3, danger2WR4]

var danger2WR1: Array<UIImageView> = []
var danger2WR2: Array<UIImageView> = []
var danger2WR3: Array<UIImageView> = []
var danger2WR4: Array<UIImageView> = []


// Black danger
var dangerBlackQueen = [dangerBQ1, dangerBQ2, dangerBQ3, dangerBQ4, dangerBQ5, dangerBQ6, dangerBQ7, dangerBQ8]

var dangerBQ1: Array<UIImageView> = []
var dangerBQ2: Array<UIImageView> = []
var dangerBQ3: Array<UIImageView> = []
var dangerBQ4: Array<UIImageView> = []
var dangerBQ5: Array<UIImageView> = []
var dangerBQ6: Array<UIImageView> = []
var dangerBQ7: Array<UIImageView> = []
var dangerBQ8: Array<UIImageView> = []

var dangerBlackBishop = [dangerBB1, dangerBB2, dangerBB3, dangerBB4]

var dangerBB1: Array<UIImageView> = []
var dangerBB2: Array<UIImageView> = []
var dangerBB3: Array<UIImageView> = []
var dangerBB4: Array<UIImageView> = []

var dangerBlackBishop2 = [danger2BB1, danger2BB2, danger2BB3, danger2BB4]

var danger2BB1: Array<UIImageView> = []
var danger2BB2: Array<UIImageView> = []
var danger2BB3: Array<UIImageView> = []
var danger2BB4: Array<UIImageView> = []

var dangerBlackRook = [dangerBR1, dangerBR2, dangerBR3, dangerBR4]

var dangerBR1: Array<UIImageView> = []
var dangerBR2: Array<UIImageView> = []
var dangerBR3: Array<UIImageView> = []
var dangerBR4: Array<UIImageView> = []

var dangerBlackRook2 = [danger2BR1, danger2BR2, danger2BR3, danger2BR4]

var danger2BR1: Array<UIImageView> = []
var danger2BR2: Array<UIImageView> = []
var danger2BR3: Array<UIImageView> = []
var danger2BR4: Array<UIImageView> = []

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

var pieces = [whitePawn1,whitePawn2, whitePawn3, whitePawn4, whitePawn5, whitePawn6, whitePawn7, whitePawn8, whiteKnight1, whiteKnight2, whiteBishop1, whiteBishop2, whiteRook1, whiteRook2, whiteQueen, whiteKing,blackPawn1, blackPawn2, blackPawn3, blackPawn4, blackPawn5, blackPawn6, blackPawn7, blackPawn8, blackKnight1, blackKnight2, blackBishop1, blackBishop2, blackRook1, blackRook2, blackQueen, blackKing]


//bool to check if pieces are "alive"
var whitePawn1Alive = true
var whitePawn2Alive = true
var blackPawn1Alive = true

var moveByAmounty: CGFloat = 0.0
var moveByAmountx: CGFloat = 0.0

// Must be assigned to a UIImageView when created
var selectedPiece: UIImageView = whitePawn1
var eatenPieces = UIImageView(frame: CGRectMake(a, _2, pieceSize , pieceSize))
var pieceCanTake : UIImageView = whitePawn1
var pieceToTake : UIImageView = whitePawn1


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
				let pieceSqr = UIImageView(frame: CGRectMake(xAxisArr[t] , yAxisArr[i] , pieceSize, pieceSize))
				self.view.addSubview(pieceSqr)
				piecePos += [pieceSqr]
			}
		}
		
		// tab-bar and navigation bar
		self.tabBarController?.tabBar.hidden = true
		let nav = self.navigationController?.navigationBar
		nav?.barStyle = UIBarStyle.BlackTranslucent
		self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "CaviarDreams", size: 18)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
		
		self.tabBarController?.tabBar.tintColor = UIColor.whiteColor()
		self.tabBarController?.tabBar.barTintColor = UIColor.blackColor()
		
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
		
		print("\(screenHeight) is the height and \(screenWidth) is the width. \(screenSize) is the screensize. \(pieceSize) is the pieceSize")
		
	}
	
	// MARK: - Setup-functions 🔍
	override func prefersStatusBarHidden() -> Bool {
		return true
	}
	
	override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
		return UIStatusBarAnimation.Slide
	}
	
	
	// MARK: - Functions to make life easier 💕
	func movePiece(_moveByAmountx:CGFloat,_moveByAmounty:CGFloat) {
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
	
	func removeWhiteDangerOptions() {
		for var o = 0 ; o < dangerWhitePieces.count ; o++ {
			dangerWhitePieces[o].removeFromSuperview()
			dangerWhitePieces.removeAtIndex(o)
		}
	}
	
	func removeWhiteQueenDanger() {
		for var o = 0 ; o < dangerWhiteQueen.count ; o++ {
			for var i = 0 ; i < dangerWhiteQueen[o].count; i++ {
			dangerWhiteQueen[o][i].removeFromSuperview()
			dangerWhiteQueen[o].removeAtIndex(i)
		}
	}
	}
	func removeWhiteBishopDanger() {
		for var o = 0 ; o < dangerWhiteBishop.count ; o++ {
			for var i = 0 ; i < dangerWhiteBishop[o].count; i++ {
				dangerWhiteBishop[o][i].removeFromSuperview()
				dangerWhiteBishop[o].removeAtIndex(i)
			}
		}
	}
	
	func removeWhiteBishopDanger2() {
		for var o = 0 ; o < dangerWhiteBishop2.count ; o++ {
			for var i = 0 ; i < dangerWhiteBishop2[o].count; i++ {
				dangerWhiteBishop2[o][i].removeFromSuperview()
				dangerWhiteBishop2[o].removeAtIndex(i)
			}
		}
	}
	
	func removeWhiteRookDanger() {
		for var o = 0 ; o < dangerWhiteRook.count ; o++ {
			for var i = 0 ; i < dangerWhiteRook[o].count; i++ {
				dangerWhiteRook[o][i].removeFromSuperview()
				dangerWhiteRook[o].removeAtIndex(i)
			}
		}
	}
	
	func removeWhiteRookDanger2() {
		for var o = 0 ; o < dangerWhiteRook2.count ; o++ {
			for var i = 0 ; i < dangerWhiteRook2[o].count; i++ {
				dangerWhiteRook2[o][i].removeFromSuperview()
				dangerWhiteRook2[o].removeAtIndex(i)
			}
		}
	}
	
	
	func removeBlackDangerOptions() {
		for var o = 0 ; o < dangerBlackPieces.count ; o++ {
			dangerBlackPieces[o].removeFromSuperview()
			dangerBlackPieces.removeAtIndex(o)
		}
	}
	
	func removeBlackQueenDanger() {
		for var o = 0 ; o < dangerBlackQueen.count ; o++ {
			for var i = 0 ; i < dangerBlackQueen[o].count; i++ {
				dangerBlackQueen[o][i].removeFromSuperview()
				dangerBlackQueen[o].removeAtIndex(i)
			}
		}
	}
	
	func removeBlackBishopDanger() {
		for var o = 0 ; o < dangerBlackBishop.count ; o++ {
			for var i = 0 ; i < dangerBlackBishop[o].count; i++ {
				dangerBlackBishop[o][i].removeFromSuperview()
				dangerBlackBishop[o].removeAtIndex(i)
			}
		}
	}
	
	func removeBlackBishopDanger2() {
		for var o = 0 ; o < dangerBlackBishop2.count ; o++ {
			for var i = 0 ; i < dangerBlackBishop2[o].count; i++ {
				dangerBlackBishop2[o][i].removeFromSuperview()
				dangerBlackBishop2[o].removeAtIndex(i)
			}
		}
	}
	
	func removeBlackRookDanger() {
		for var o = 0 ; o < dangerBlackRook.count ; o++ {
			for var i = 0 ; i < dangerBlackRook[o].count; i++ {
				dangerBlackRook[o][i].removeFromSuperview()
				dangerBlackRook[o].removeAtIndex(i)
			}
		}
	}
	
	func removeBlackRookDanger2() {
		for var o = 0 ; o < dangerBlackRook2.count ; o++ {
			for var i = 0 ; i < dangerBlackRook2[o].count; i++ {
				dangerBlackRook2[o][i].removeFromSuperview()
				dangerBlackRook2[o].removeAtIndex(i)
			}
		}
	}
	
	func removeWhiteExtraQueenDanger() {
		for var o = 0 ; o < extraPiecesQueen.count ; o++ {
			for var i = 0 ; i < extraPiecesQueen[o].count; i++ {
				extraPiecesQueen[o][i].removeFromSuperview()
				extraPiecesQueen[o].removeAtIndex(i)
			}
		}
	}
	
	func removeBlackExtraQueenDanger() {
		for var o = 0 ; o < extraBlackPiecesQueen.count ; o++ {
			for var i = 0 ; i < extraBlackPiecesQueen[o].count; i++ {
				extraBlackPiecesQueen[o][i].removeFromSuperview()
				extraBlackPiecesQueen[o].removeAtIndex(i)
			}
		}
	}
	
	func removeWhiteExtraBishopDanger() {
		for var o = 0 ; o < extraWhiteBishop.count ; o++ {
			for var i = 0 ; i < extraWhiteBishop[o].count; i++ {
				extraWhiteBishop[o][i].removeFromSuperview()
				extraWhiteBishop[o].removeAtIndex(i)
			}
		}
	}
	
	func removeWhiteExtraBishopDanger2() {
		for var o = 0 ; o < extraWhiteBishop2.count ; o++ {
			for var i = 0 ; i < extraWhiteBishop2[o].count; i++ {
				extraWhiteBishop2[o][i].removeFromSuperview()
				extraWhiteBishop2[o].removeAtIndex(i)
			}
		}
	}
	
	func removeBlackExtraBishopDanger() {
		for var o = 0 ; o < extraBlackBishop.count ; o++ {
			for var i = 0 ; i < extraBlackBishop[o].count; i++ {
				extraBlackBishop[o][i].removeFromSuperview()
				extraBlackBishop[o].removeAtIndex(i)
			}
		}
	}
	
	func removeBlackExtraBishopDanger2() {
		for var o = 0 ; o < extraBlackBishop2.count ; o++ {
			for var i = 0 ; i < extraBlackBishop2[o].count; i++ {
				extraBlackBishop2[o][i].removeFromSuperview()
				extraBlackBishop2[o].removeAtIndex(i)
			}
		}
	}
	
	func removeExtraWhiteRook() {
		for var o = 0 ; o < extraWhiteRook.count ; o++ {
			for var i = 0 ; i < extraWhiteRook[o].count; i++ {
				extraWhiteRook[o][i].removeFromSuperview()
				extraWhiteRook[o].removeAtIndex(i)
			}
		}
	}
	
	func removeExtraWhiteRook2() {
		for var o = 0 ; o < extraWhiteRook2.count ; o++ {
			for var i = 0 ; i < extraWhiteRook2[o].count; i++ {
				extraWhiteRook2[o][i].removeFromSuperview()
				extraWhiteRook2[o].removeAtIndex(i)
			}
		}
	}
	
	func removeExtraBlackRook() {
		for var o = 0 ; o < extraBlackRook.count ; o++ {
			for var i = 0 ; i < extraBlackRook[o].count; i++ {
				extraBlackRook[o][i].removeFromSuperview()
				extraBlackRook[o].removeAtIndex(i)
			}
		}
	}
	
	func removeExtraBlackRook2() {
		for var o = 0 ; o < extraBlackRook2.count ; o++ {
			for var i = 0 ; i < extraBlackRook2[o].count; i++ {
				extraBlackRook2[o][i].removeFromSuperview()
				extraBlackRook2[o].removeAtIndex(i)
			}
		}
	}
	
	// MARK: - Pieces selected! 👾
	
	func whiteBishopSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var canGofurther: Bool = true
		var canGofurther2: Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
					
					for byAmountx; byAmountx >= -8 && byAmountx <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if checkBlack == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							pieceOptions += [pieceOption]
						}
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if checkBlack == true {
									for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
										}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
									}
								}
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
		for var q = 0; q < extraBlackPiecesQueen[checkPieceWhite].count; q++ {
			if moveBAllowed == false && CGRectContainsPoint(extraBlackPiecesQueen[checkPieceWhite][q].frame, selectedPiece.center)  {
				for var i = 0; i < 8; i++ {
					for var q = 0; q < extraBlackPiecesQueen[i].count; q++ {
						if CGRectContainsPoint(extraBlackPiecesQueen[i][q].frame, selectedPiece.center) {
							if (i == 4 || i == 5) {
								canGofurther = true
								canGofurther2 = false
							} else if (i == 6 || i == 7) {
								canGofurther = false
								canGofurther2 = true
							} else if (i == 0 || i == 1 || i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackBishop[checkPieceWhite2].count; q++ {
			if moveBAllowed2 == false && CGRectContainsPoint(extraBlackBishop[checkPieceWhite2][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackBishop[i].count; q++ {
						if CGRectContainsPoint(extraBlackBishop[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
							} else {
								canGofurther = false
								canGofurther2 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackBishop2[checkPieceWhite3].count; q++ {
			if moveBAllowed3 == false && CGRectContainsPoint(extraBlackBishop2[checkPieceWhite3][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackBishop2[i].count; q++ {
						if CGRectContainsPoint(extraBlackBishop2[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
							} else {
								canGofurther = false
								canGofurther2 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackRook[checkPieceWhite4].count; q++ {
			if moveBAllowed4 == false && CGRectContainsPoint(extraBlackRook[checkPieceWhite4][q].frame, selectedPiece.center)  {
				canGofurther = false
				canGofurther2 = false
			}
			
		}
		
		for var q = 0; q < extraBlackRook2[checkPieceWhite5].count; q++ {
			if moveBAllowed5 == false && CGRectContainsPoint(extraBlackRook2[checkPieceWhite5][q].frame, selectedPiece.center)  {
				canGofurther = false
				canGofurther2 = false
			}
			
		}
		
		if canGofurther == true {
			letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1)
			letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1)
		}
		if canGofurther2 == true {
			letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1)
			letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1)
		}
	}
	
	func whiteKnightSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var canMoveFurther: Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, var byAmountz:CGFloat, increaserz:CGFloat ) {
			var canThePieceGofurther: Bool = true
					
					for byAmountx; byAmountz < 2; byAmountx += increaserx, byAmounty += increasery, byAmountz += increaserz {
						
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if checkBlack == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
									}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
								}
							}
							pieceOptions += [pieceOption]
							
						}
						
						
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true{
								
								let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if checkBlack == true {
									for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
										}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
									}
								}
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
		for var q = 0; q < extraBlackPiecesQueen[checkPieceWhite].count; q++ {
			if moveBAllowed == false && CGRectContainsPoint(extraBlackPiecesQueen[checkPieceWhite][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
			
		}
		
		for var q = 0; q < extraBlackBishop[checkPieceWhite2].count; q++ {
			if moveBAllowed2 == false && CGRectContainsPoint(extraBlackBishop[checkPieceWhite2][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
			
		}
		
		for var q = 0; q < extraBlackBishop2[checkPieceWhite3].count; q++ {
			if moveBAllowed3 == false && CGRectContainsPoint(extraBlackBishop2[checkPieceWhite3][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
			
		}
		
		for var q = 0; q < extraBlackRook[checkPieceWhite4].count; q++ {
			if moveBAllowed4 == false && CGRectContainsPoint(extraBlackRook[checkPieceWhite4][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
			
		}
		
		for var q = 0; q < extraBlackRook2[checkPieceWhite5].count; q++ {
			if moveBAllowed5 == false && CGRectContainsPoint(extraBlackRook2[checkPieceWhite5][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
		}
		
		if canMoveFurther == true {
		letThemAppear(2, byAmounty: 1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-2, byAmounty: 1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(1, byAmounty: 2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(1, byAmounty: -2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-1, byAmounty: 2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-1, byAmounty: -2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(2, byAmounty: -1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-2, byAmounty: -1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		}
		
	}
	
	func whiteRookSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var letAppear: Bool = true
		var canThePieceGofurther: Bool = true
		var canGofurther: Bool = true
		var canGofurther2: Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
					
					for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						
						for var q = 0; q < whitePieces.count; q++ {
							if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if checkBlack == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							pieceOptions += [pieceOption]
						}
						
						
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if checkBlack == true {
									for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
										}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
									}
								}
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
		
		for var q = 0; q < extraBlackPiecesQueen[checkPieceWhite].count; q++ {
			if moveBAllowed == false && CGRectContainsPoint(extraBlackPiecesQueen[checkPieceWhite][q].frame, selectedPiece.center)  {
				for var i = 0; i < 8; i++ {
					for var q = 0; q < extraBlackPiecesQueen[i].count; q++ {
						if CGRectContainsPoint(extraBlackPiecesQueen[i][q].frame, selectedPiece.center) {
							if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
							} else if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
							} else if (i == 4 || i == 5 || i == 6 || i == 7) {
								canGofurther = false
								canGofurther2 = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackBishop[checkPieceWhite2].count; q++ {
			if moveBAllowed2 == false && CGRectContainsPoint(extraBlackBishop[checkPieceWhite2][q].frame, selectedPiece.center)  {
				canGofurther = false
				canGofurther2 = false
			}
			
		}
		
		for var q = 0; q < extraBlackBishop2[checkPieceWhite3].count; q++ {
			if moveBAllowed3 == false && CGRectContainsPoint(extraBlackBishop2[checkPieceWhite3][q].frame, selectedPiece.center)  {
				canGofurther = false
				canGofurther2 = false
			}
			
		}
		
		for var q = 0; q < extraBlackRook[checkPieceWhite4].count; q++ {
			if moveBAllowed4 == false && CGRectContainsPoint(extraBlackRook[checkPieceWhite4][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackRook[i].count; q++ {
						if CGRectContainsPoint(extraBlackRook[i][q].frame, selectedPiece.center) {
							if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
							} else {
								canGofurther = true
								canGofurther2 = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackRook2[checkPieceWhite5].count; q++ {
			if moveBAllowed5 == false && CGRectContainsPoint(extraBlackRook2[checkPieceWhite5][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackRook2[i].count; q++ {
						if CGRectContainsPoint(extraBlackRook2[i][q].frame, selectedPiece.center) {
							if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
							} else {
								canGofurther = true
								canGofurther2 = false
							}
						}
					}
				}
			}
			
		}
		
		if canGofurther == true {
			letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1)
			letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1)
		}
		if canGofurther2 == true {
			letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0)
			letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0)
		}
		
	}
	
	func whiteQueenSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var canGofurther: Bool = true
		var canGofurther2: Bool = true
		var canGofurther3: Bool = true
		var canGofurther4: Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
				
				for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
					
					
					for var q = 0; q < whitePieces.count; q++ {
						if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
							canThePieceGofurther = false
						}
					}
					
					if canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
						pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if checkBlack == true {
							for var i = 0 ; i < dangerPieces.count; i++ {
								if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
									[pieceOption .removeFromSuperview()]
								}
								if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
									let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
									pieceOption.image = UIImage(named: "piecePossibilities.png")
									self.view.addSubview(pieceOption)
									pieceOptions += [pieceOption]
								}
							}
						}
						pieceOptions += [pieceOption]
					}
					
					
					for var r = 0; r < blackPieces.count; r++ {
						if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if checkBlack == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
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
		
		for var q = 0; q < extraBlackPiecesQueen[checkPieceWhite].count; q++ {
			if moveBAllowed == false && CGRectContainsPoint(extraBlackPiecesQueen[checkPieceWhite][q].frame, selectedPiece.center)  {
				for var i = 0; i < 8; i++ {
					for var q = 0; q < dangerBlackQueen[i].count; q++ {
						if CGRectContainsPoint(dangerBlackQueen[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
								canGofurther3 = false
								canGofurther4 = false
							} else if (i == 4 || i == 5) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = true
								canGofurther4 = false
								
							} else if (i == 6 || i == 7) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackBishop[checkPieceWhite2].count; q++ {
			if moveBAllowed2 == false && CGRectContainsPoint(extraBlackBishop[checkPieceWhite2][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackBishop[i].count; q++ {
						if CGRectContainsPoint(extraBlackBishop[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = true
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackBishop2[checkPieceWhite3].count; q++ {
			if moveBAllowed3 == false && CGRectContainsPoint(extraBlackBishop2[checkPieceWhite3][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackBishop2[i].count; q++ {
						if CGRectContainsPoint(extraBlackBishop2[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = true
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackRook[checkPieceWhite4].count; q++ {
			if moveBAllowed4 == false && CGRectContainsPoint(extraBlackRook[checkPieceWhite4][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackRook[i].count; q++ {
						if CGRectContainsPoint(extraBlackRook[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
								canGofurther3 = false
								canGofurther4 = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackRook2[checkPieceWhite5].count; q++ {
			if moveBAllowed5 == false && CGRectContainsPoint(extraBlackRook2[checkPieceWhite5][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackRook2[i].count; q++ {
						if CGRectContainsPoint(extraBlackRook2[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
								canGofurther3 = false
								canGofurther4 = false
							}
						}
					}
				}
			}
		}
		
		if canGofurther == true {
			// Up and down
			letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1)
			letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1)
		}
		if canGofurther2 == true {
			// Left and Right
			letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0)
			letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0)
		}
		if canGofurther3 == true {
			// Up-right and down-left
			letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1)
			letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1)
			
		}
		if canGofurther4 == true {
			// Up-left and down-left
			letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1)
			letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1)
			
			
		}
		
	}
	
	func whitePawnDanger(var piece:UIImageView, var own: Array<UIImageView>, var byAmount:CGFloat) {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			let canThePieceGofurther: Bool = true
			
					for byAmounty; byAmounty < 2; byAmountx += increaserx, byAmounty += increasery {
						
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(piece.frame.origin.x - byAmountx * pieceSize, piece.frame.origin.y + byAmount * pieceSize, size, size ))
							///pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if containsDanger(dangerWhitePieces, image: pieceOption) {
								pieceOption.removeFromSuperview()
							}
							dangerWhitePieces += [pieceOption]
						}
						
						for var o = 0 ; o < dangerWhitePieces.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, dangerWhitePieces[o].center) == false {
								[dangerWhitePieces[o] .removeFromSuperview()]
								dangerWhitePieces.removeAtIndex(o)
							}
						}
						
						for var o = 0; o < dangerWhitePieces.count; o++ {
								if CGRectContainsPoint(blackKing.frame, dangerWhitePieces[o].center){
									print("Check!")
									check = true
								}
						}
					}
				}
		letThemAppear(1, byAmounty: 1, increaserx: 0, increasery: 1)
		letThemAppear(-1, byAmounty: 1, increaserx: 0, increasery: 1)
		
	}
	
	func blackPawnDanger(var piece:UIImageView, var own: Array<UIImageView>, var byAmount:CGFloat) {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			let canThePieceGofurther: Bool = true
					
					for byAmounty; byAmounty < 2; byAmountx += increaserx, byAmounty += increasery {
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(piece.frame.origin.x - byAmountx * pieceSize, piece.frame.origin.y + byAmount * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if containsDanger(dangerBlackPieces, image: pieceOption) {
								pieceOption.removeFromSuperview()
							}
							dangerBlackPieces += [pieceOption]
						}
						
						for var o = 0 ; o < dangerBlackPieces.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, dangerBlackPieces[o].center) == false {
								[dangerBlackPieces[o] .removeFromSuperview()]
								dangerBlackPieces.removeAtIndex(o)
							}
						}
						
						for var o = 0; o < dangerBlackPieces.count; o++ {
							if CGRectContainsPoint(whiteKing.frame, dangerBlackPieces[o].center){
								print("Check!")
								checkBlack = true
							}
						}
						
					}
				}

		letThemAppear(1, byAmounty: 1, increaserx: 0, increasery: 1)
		letThemAppear(-1, byAmounty: 1, increaserx: 0, increasery: 1)
		
	}
	
	func whiteQueenDanger() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option:Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
	
			for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
				
						for var r = 0 ; r < pieces.count; r++ {
							if pieces[r].frame.origin.x == whiteQueen.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteQueen.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(whiteQueen.frame.origin.x + byAmountx * pieceSize, whiteQueen.frame.origin.y - byAmounty * pieceSize, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								dangerWhiteQueen[option] += [pieceOption]
								canThePieceGofurther = false

							}
						}
				
				if canTheExtraPieceGofurther == true {
						let pieceOption = UIImageView(frame: CGRectMake(whiteQueen.frame.origin.x + byAmountx * pieceSize, whiteQueen.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
							[pieceOption .removeFromSuperview()]
						} else {
							extraPieces += [pieceOption]
						}
				}
			
				for var o = 0; o < dangerWhiteQueen.count; o++ {
					for var i = 0 ; i < dangerWhiteQueen[o].count; i++ {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteQueen[o][i].center){
							print("Check!")
							check = true
						}
					}
				}
				
				for var r = 0 ; r < extraPieces.count; r++ {
				if CGRectContainsPoint(extraPieces[r].frame, blackKing.center) {
					goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteQueen.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteQueen.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(whiteQueen.frame.origin.x + byAmountx * pieceSize, whiteQueen.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
								[pieceOption .removeFromSuperview()]
							} else {
							dangerWhiteQueen[option] += [pieceOption]
							}
							
						}
				
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteQueen.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteQueen.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(whiteQueen.frame.origin.x + byAmountx * pieceSize, whiteQueen.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPiecesQueen[option] += [pieceOption]
					}
						if CGRectContainsPoint(pieceOption.frame, blackKing.center) {
							canGofurther = false
							if extraPiecesQueen[option].count == 2 {
								moveAllowed = false
								checkPiece = option
							}
						}
						
					}
				}
				
			}
		}

		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1, option: 0)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1, option: 1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0, option: 2)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0, option: 3)
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1, option: 4)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1, option: 5)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1, option: 6)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1, option: 7)
		
	}
	
	func blackQueenDanger() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option:Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
				
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackQueen.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackQueen.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(blackQueen.frame.origin.x + byAmountx * pieceSize, blackQueen.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						dangerBlackQueen[option] += [pieceOption]
						canThePieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(blackQueen.frame.origin.x + byAmountx * pieceSize, blackQueen.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPiecesBlack += [pieceOption]
					}
				}
				
				for var o = 0; o < dangerBlackQueen.count; o++ {
					for var i = 0 ; i < dangerBlackQueen[o].count; i++ {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackQueen[o][i].center){
							print("Check!")
							checkBlack = true
						}
					}
				}
				
				for var r = 0 ; r < extraPiecesBlack.count; r++ {
					if CGRectContainsPoint(extraPiecesBlack[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackQueen.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackQueen.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				
				if canThePieceGofurther == true {
					
					let pieceOption = UIImageView(frame: CGRectMake(blackQueen.frame.origin.x + byAmountx * pieceSize, blackQueen.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						dangerBlackQueen[option] += [pieceOption]
					}
					
				}
					
					for var r = 0 ; r < pieces.count; r++ {
						if pieces[r].frame.origin.x == blackQueen.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackQueen.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
							let pieceOption = UIImageView(frame: CGRectMake(blackQueen.frame.origin.x + byAmountx * pieceSize, blackQueen.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
								[pieceOption .removeFromSuperview()]
							} else {
								extraBlackPiecesQueen[option] += [pieceOption]
								
							}
							if CGRectContainsPoint(pieceOption.frame, whiteKing.center) {
								canGofurther = false
								print("This is working")
								print(extraBlackPiecesQueen[option].count)
								if extraBlackPiecesQueen[option].count == 2 {
									moveBAllowed = false
									checkPieceWhite = option
								}
							}
							
						}
					}
				
			}
		}
		
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1, option: 0)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1, option: 1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0, option: 2)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0, option: 3)
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1, option: 4)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1, option: 5)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1, option: 6)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1, option: 7)
		
	}
	
	func whiteKnightDanger(var piece:UIImageView) {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, var byAmountz:CGFloat, increaserz:CGFloat ) {
			let canThePieceGofurther: Bool = true
			
			
			for byAmountx; byAmountz < 2; byAmountx += increaserx, byAmounty += increasery, byAmountz += increaserz {
				
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(piece.frame.origin.x + byAmountx * pieceSize, piece.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if containsDanger(dangerWhitePieces, image: pieceOption) {
								pieceOption.removeFromSuperview()
							}
							dangerWhitePieces += [pieceOption]
							
						}
						
						for var o = 0 ; o < dangerWhitePieces.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, dangerWhitePieces[o].center) == false {
								[dangerWhitePieces[o] .removeFromSuperview()]
								dangerWhitePieces.removeAtIndex(o)
							}
						}
				
						for var o = 0; o < dangerWhitePieces.count; o++ {
								if CGRectContainsPoint(blackKing.frame, dangerWhitePieces[o].center){
									print("Check!")
									check = true
							}
						}
				
					}
				}
		
		letThemAppear(2, byAmounty: 1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-2, byAmounty: 1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(1, byAmounty: 2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(1, byAmounty: -2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-1, byAmounty: 2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-1, byAmounty: -2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(2, byAmounty: -1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-2, byAmounty: -1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		
		
	}
	
	func blackKnightDanger(var piece:UIImageView) {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, var byAmountz:CGFloat, increaserz:CGFloat ) {
			let canThePieceGofurther: Bool = true
			
			
			for byAmountx; byAmountz < 2; byAmountx += increaserx, byAmounty += increasery, byAmountz += increaserz {
				
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(piece.frame.origin.x + byAmountx * pieceSize, piece.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if containsDanger(dangerBlackPieces, image: pieceOption) {
								pieceOption.removeFromSuperview()
							}
							dangerBlackPieces += [pieceOption]
							
						}
				
						for var o = 0 ; o < dangerBlackPieces.count; o++ {
							if CGRectContainsPoint(boarderBoard.frame, dangerBlackPieces[o].center) == false {
								[dangerBlackPieces[o] .removeFromSuperview()]
								dangerBlackPieces.removeAtIndex(o)
							}
						}
				
						for var o = 0; o < dangerBlackPieces.count; o++ {
							if CGRectContainsPoint(whiteKing.frame, dangerBlackPieces[o].center){
								print("Check!")
								checkBlack = true
							}
						}
				
					}
				}
		
		letThemAppear(2, byAmounty: 1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-2, byAmounty: 1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(1, byAmounty: 2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(1, byAmounty: -2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-1, byAmounty: 2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-1, byAmounty: -2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(2, byAmounty: -1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-2, byAmounty: -1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		
	}
	
	func whiteBishopDanger() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option: Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8; byAmountx += increaserx, byAmounty += increasery {
				
						for var r = 0; r < pieces.count; r++ {
							if pieces[r].frame.origin.x == whiteBishop1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteBishop1.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(whiteBishop1.frame.origin.x + byAmountx * pieceSize, whiteBishop1.frame.origin.y - byAmounty * pieceSize, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if containsDanger(dangerWhitePieces, image: pieceOption) && check == false {
									pieceOption.removeFromSuperview()
								}
								dangerWhiteBishop[option] += [pieceOption]
								canThePieceGofurther = false

								
							}
						}
				
				
				for var o = 0; o < dangerWhiteBishop.count; o++ {
					for var i = 0 ; i < dangerWhiteBishop[o].count; i++ {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteBishop[o][i].center){
							print("Check by bishop")
							check = true
						}
					}
				}
				
				for var r = 0 ; r < extraPieces.count; r++ {
					if CGRectContainsPoint(extraPieces[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteBishop1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteBishop1.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(whiteBishop1.frame.origin.x + byAmountx * pieceSize, whiteBishop1.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPieces += [pieceOption]
					}
				}
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(whiteBishop1.frame.origin.x + byAmountx * pieceSize, whiteBishop1.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
								[pieceOption .removeFromSuperview()]
							} else {
								dangerWhiteBishop[option] += [pieceOption]
							}
						}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteBishop1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteBishop1.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
						let pieceOption = UIImageView(frame: CGRectMake(whiteBishop1.frame.origin.x + byAmountx * pieceSize, whiteBishop1.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
							[pieceOption .removeFromSuperview()]
						} else {
							extraWhiteBishop[option] += [pieceOption]
						}
						if CGRectContainsPoint(pieceOption.frame, blackKing.center) {
							canGofurther = false
							
							if extraWhiteBishop[option].count == 2 {
								moveAllowed2 = false
								checkPiece2 = option
							}
						}
						
					}
				}
				}
			}
		
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1, option: 0)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1, option: 1)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1, option: 2)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1, option: 3)
		
		
	}
	
	func whiteBishopDanger2() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option: Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8; byAmountx += increaserx, byAmounty += increasery {
				
				
					for var r = 0; r < pieces.count; r++ {
						if pieces[r].frame.origin.x == whiteBishop2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteBishop2.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(whiteBishop2.frame.origin.x + byAmountx * pieceSize, whiteBishop2.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if containsDanger(dangerWhitePieces, image: pieceOption) && check == false {
								pieceOption.removeFromSuperview()
							}
							dangerWhiteBishop2[option] += [pieceOption]
							canThePieceGofurther = false
							
						}
					}
				
				for var o = 0; o < dangerWhiteBishop2.count; o++ {
					for var i = 0 ; i < dangerWhiteBishop2[o].count; i++ {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteBishop2[o][i].center){
							print("Check by bishop")
							check = true
						}
					}
				}
				
				for var r = 0 ; r < extraPieces.count; r++ {
					if CGRectContainsPoint(extraPieces[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteBishop2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteBishop2.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(whiteBishop2.frame.origin.x + byAmountx * pieceSize, whiteBishop2.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPieces += [pieceOption]
					}
				}
					
					if canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(whiteBishop2.frame.origin.x + byAmountx * pieceSize, whiteBishop2.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
							[pieceOption .removeFromSuperview()]
						} else {
							dangerWhiteBishop2[option] += [pieceOption]
						}
					}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteBishop2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteBishop2.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
						let pieceOption = UIImageView(frame: CGRectMake(whiteBishop2.frame.origin.x + byAmountx * pieceSize, whiteBishop2.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
							[pieceOption .removeFromSuperview()]
						} else {
							extraWhiteBishop2[option] += [pieceOption]
						}
						if CGRectContainsPoint(pieceOption.frame, blackKing.center) {
							canGofurther = false
							if extraWhiteBishop2[option].count == 2 {
								moveAllowed3 = false
								checkPiece3 = option
							}

						}
					}
				}
				}
			}
		
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1, option: 0)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1, option: 1)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1, option: 2)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1, option: 3)
	}
	
	func blackBishopDanger() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option: Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8; byAmountx += increaserx, byAmounty += increasery {
				
				for var r = 0; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackBishop1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackBishop1.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(blackBishop1.frame.origin.x + byAmountx * pieceSize, blackBishop1.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if containsDanger(dangerBlackPieces, image: pieceOption) && check == false {
							pieceOption.removeFromSuperview()
						}
						dangerBlackBishop[option] += [pieceOption]
						canThePieceGofurther = false
						
					}
				}
				
				for var o = 0; o < dangerBlackBishop.count; o++ {
					for var i = 0 ; i < dangerBlackBishop[o].count; i++ {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackBishop[o][i].center){
							print("Check by bishop")
							checkBlack = true
						}
					}
				}
				
				for var r = 0 ; r < extraPiecesBlack.count; r++ {
					if CGRectContainsPoint(extraPiecesBlack[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackBishop1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackBishop1.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(blackBishop1.frame.origin.x + byAmountx * pieceSize, blackBishop1.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPiecesBlack += [pieceOption]
					}
				}
				
				if canThePieceGofurther == true {
					
					let pieceOption = UIImageView(frame: CGRectMake(blackBishop1.frame.origin.x + byAmountx * pieceSize, blackBishop1.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						dangerBlackBishop[option] += [pieceOption]
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackBishop1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackBishop1.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
						let pieceOption = UIImageView(frame: CGRectMake(blackBishop1.frame.origin.x + byAmountx * pieceSize, blackBishop1.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
							[pieceOption .removeFromSuperview()]
						} else {
							extraBlackBishop[option] += [pieceOption]
						}
						if CGRectContainsPoint(pieceOption.frame, whiteKing.center) {
							canGofurther = false
							if extraBlackBishop[option].count == 2 {
								moveBAllowed2 = false
								checkPieceWhite2 = option
							}
						}
						
					}
				}
			
			}
		}
		
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1, option: 0)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1, option: 1)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1, option: 2)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1, option: 3)
	}
	
	func blackBishopDanger2() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option: Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8; byAmountx += increaserx, byAmounty += increasery {
				
				for var r = 0; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackBishop2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackBishop2.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(blackBishop2.frame.origin.x + byAmountx * pieceSize, blackBishop2.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if containsDanger(dangerBlackPieces, image: pieceOption) && check == false {
							pieceOption.removeFromSuperview()
						}
						dangerBlackBishop2[option] += [pieceOption]
						canThePieceGofurther = false
						
					}
				}
				
				for var o = 0; o < dangerBlackBishop2.count; o++ {
					for var i = 0 ; i < dangerBlackBishop2[o].count; i++ {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackBishop2[o][i].center){
							print("Check by bishop")
							checkBlack = true
						}
					}
				}
				
				for var r = 0 ; r < extraPiecesBlack.count; r++ {
					if CGRectContainsPoint(extraPiecesBlack[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackBishop2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackBishop2.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(blackBishop2.frame.origin.x + byAmountx * pieceSize, blackBishop2.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPiecesBlack += [pieceOption]
					}
				}
				
				if canThePieceGofurther == true {
					
					let pieceOption = UIImageView(frame: CGRectMake(blackBishop2.frame.origin.x + byAmountx * pieceSize, blackBishop2.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						dangerBlackBishop2[option] += [pieceOption]
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackBishop2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackBishop2.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
						let pieceOption = UIImageView(frame: CGRectMake(blackBishop2.frame.origin.x + byAmountx * pieceSize, blackBishop2.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
							[pieceOption .removeFromSuperview()]
						} else {
							extraBlackBishop2[option] += [pieceOption]
						}
						if CGRectContainsPoint(pieceOption.frame, whiteKing.center) {
							canGofurther = false
							if extraBlackBishop2[option].count == 2 {
								moveBAllowed3 = false
								checkPieceWhite3 = option
							}
							
						}
					}
				}
			}
		}
		
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1, option: 0)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1, option: 1)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1, option: 2)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1, option: 3)
	}
	
 
	func whiteRookDanger() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option: Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var goFurther: Bool = true
			var canGofurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
				
						for var r = 0; r < pieces.count; r++ {
							if pieces[r].frame.origin.x == whiteRook1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteRook1.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(whiteRook1.frame.origin.x + byAmountx * pieceSize, whiteRook1.frame.origin.y - byAmounty * pieceSize, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if containsDanger(dangerWhitePieces, image: pieceOption) && check == false {
									pieceOption.removeFromSuperview()
								}
								dangerWhiteRook[option] += [pieceOption]
								canThePieceGofurther = false
							}
						}
				
				for var o = 0; o < dangerWhiteRook.count; o++ {
					for var i = 0 ; i < dangerWhiteRook[o].count; i++ {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteRook[o][i].center){
							check = true
						}
					}
				}
				
				for var r = 0 ; r < extraPieces.count; r++ {
					if CGRectContainsPoint(extraPieces[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteRook1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteRook1.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(whiteRook1.frame.origin.x + byAmountx * pieceSize, whiteRook1.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPieces += [pieceOption]
					}
				}
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(whiteRook1.frame.origin.x + byAmountx * pieceSize, whiteRook1.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
								[pieceOption .removeFromSuperview()]
							} else {
								dangerWhiteRook[option] += [pieceOption]
							}
						}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteRook1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteRook1.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
						let pieceOption = UIImageView(frame: CGRectMake(whiteRook1.frame.origin.x + byAmountx * pieceSize, whiteRook1.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
							[pieceOption .removeFromSuperview()]
						} else {
							extraWhiteRook[option] += [pieceOption]
						}
						if CGRectContainsPoint(pieceOption.frame, blackKing.center) {
							canGofurther = false
							if extraWhiteRook[option].count == 2 {
								moveAllowed4 = false
								checkPiece4 = option
							}
						}
						
					}
				}
			
					}
				}
		
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1, option: 0)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1, option: 1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0, option: 2)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0, option: 3)
		
	}
	
	func whiteRookDanger2() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option: Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
				
						for var r = 0; r < pieces.count; r++ {
							if pieces[r].frame.origin.x == whiteRook2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteRook2.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(whiteRook2.frame.origin.x + byAmountx * pieceSize, whiteRook2.frame.origin.y - byAmounty * pieceSize, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if containsDanger(dangerWhitePieces, image: pieceOption) && check == false {
									pieceOption.removeFromSuperview()
								}
								dangerWhiteRook2[option] += [pieceOption]
								canThePieceGofurther = false
							}
						}
				for var o = 0; o < dangerWhiteRook2.count; o++ {
					for var i = 0 ; i < dangerWhiteRook2[o].count; i++ {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteRook2[o][i].center){
							check = true
						}
					}
				}
				
				for var r = 0 ; r < extraPieces.count; r++ {
					if CGRectContainsPoint(extraPieces[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteRook2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteRook2.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(whiteRook2.frame.origin.x + byAmountx * pieceSize, whiteRook2.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPieces += [pieceOption]
					}
				}
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(whiteRook2.frame.origin.x + byAmountx * pieceSize, whiteRook2.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
								[pieceOption .removeFromSuperview()]
							} else {
								dangerWhiteRook2[option] += [pieceOption]
							}
						}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == whiteRook2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == whiteRook2.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
						let pieceOption = UIImageView(frame: CGRectMake(whiteRook2.frame.origin.x + byAmountx * pieceSize, whiteRook2.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
							[pieceOption .removeFromSuperview()]
						} else {
							extraWhiteRook2[option] += [pieceOption]
						}
						if CGRectContainsPoint(pieceOption.frame, blackKing.center) {
							canGofurther = false
							
							if extraWhiteRook2[option].count == 2 {
								moveAllowed5 = false
								checkPiece5 = option
							}
						}
						
					}
				}
				
					}
				}
		
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1, option: 0)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1, option: 1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0, option: 2)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0, option: 3)
		
	}
	
	func blackRookDanger() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option: Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
				
				for var r = 0; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackRook1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackRook1.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(blackRook1.frame.origin.x + byAmountx * pieceSize, blackRook1.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if containsDanger(dangerBlackPieces, image: pieceOption) && check == false {
							pieceOption.removeFromSuperview()
						}
						dangerBlackRook[option] += [pieceOption]
						canThePieceGofurther = false
						
					}
				}
				
				for var o = 0; o < dangerBlackRook.count; o++ {
					for var i = 0 ; i < dangerBlackRook[o].count; i++ {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackRook[o][i].center){
							checkBlack = true
						}
					}
				}
				
				for var r = 0 ; r < extraPiecesBlack.count; r++ {
					if CGRectContainsPoint(extraPiecesBlack[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackRook1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackRook1.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(blackRook1.frame.origin.x + byAmountx * pieceSize, blackRook1.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPiecesBlack += [pieceOption]
					}
				}
				
				if canThePieceGofurther == true {
					
					let pieceOption = UIImageView(frame: CGRectMake(blackRook1.frame.origin.x + byAmountx * pieceSize, blackRook1.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						dangerBlackRook[option] += [pieceOption]
					}
				}
					
					for var r = 0 ; r < pieces.count; r++ {
						if pieces[r].frame.origin.x == blackRook1.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackRook1.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
							let pieceOption = UIImageView(frame: CGRectMake(blackRook1.frame.origin.x + byAmountx * pieceSize, blackRook1.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
								[pieceOption .removeFromSuperview()]
							} else {
								extraBlackRook[option] += [pieceOption]
							}
							if CGRectContainsPoint(pieceOption.frame, whiteKing.center) {
								canGofurther = false
								
								if extraBlackRook[option].count == 2 {
									moveBAllowed4 = false
									checkPieceWhite4 = option
								}
							}
							
						}
					}
			}
		}
		
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1, option: 0)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1, option: 1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0, option: 2)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0, option: 3)
		
	}
	
	func blackRookDanger2() {
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, option: Int) {
			var canThePieceGofurther: Bool = true
			var canTheExtraPieceGofurther: Bool = true
			var canGofurther: Bool = true
			var goFurther: Bool = true
			
			for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
				
				for var r = 0; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackRook2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackRook2.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(blackRook2.frame.origin.x + byAmountx * pieceSize, blackRook2.frame.origin.y - byAmounty * pieceSize, size, size))
						//pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if containsDanger(dangerBlackPieces, image: pieceOption) && check == false {
							pieceOption.removeFromSuperview()
						}
						dangerBlackRook2[option] += [pieceOption]
						canThePieceGofurther = false
						
					}
				}
				
				for var o = 0; o < dangerBlackRook2.count; o++ {
					for var i = 0 ; i < dangerBlackRook2[o].count; i++ {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackRook2[o][i].center){
							checkBlack = true
						}
					}
				}
				
				for var r = 0 ; r < extraPiecesBlack.count; r++ {
					if CGRectContainsPoint(extraPiecesBlack[r].frame, blackKing.center) {
						goFurther = false
					}
				}
				
				for var r = 0 ; r < pieces.count; r++ {
					if pieces[r].frame.origin.x == blackRook2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackRook2.frame.origin.y - byAmounty * pieceSize && canTheExtraPieceGofurther == true && goFurther == true {
						canTheExtraPieceGofurther = false
						
					}
				}
				
				if canTheExtraPieceGofurther == true {
					let pieceOption = UIImageView(frame: CGRectMake(blackRook2.frame.origin.x + byAmountx * pieceSize, blackRook2.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						extraPiecesBlack += [pieceOption]
					}
				}
				
				if canThePieceGofurther == true {
					
					let pieceOption = UIImageView(frame: CGRectMake(blackRook2.frame.origin.x + byAmountx * pieceSize, blackRook2.frame.origin.y - byAmounty * pieceSize, size, size))
					//pieceOption.image = UIImage(named: "piecePossibilities.png")
					self.view.addSubview(pieceOption)
					if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
						[pieceOption .removeFromSuperview()]
					} else {
						dangerBlackRook2[option] += [pieceOption]
					}
				}
					
					for var r = 0 ; r < pieces.count; r++ {
						if pieces[r].frame.origin.x == blackRook2.frame.origin.x + byAmountx * pieceSize && pieces[r].frame.origin.y == blackRook2.frame.origin.y - byAmounty * pieceSize && canGofurther == true {
							let pieceOption = UIImageView(frame: CGRectMake(blackRook2.frame.origin.x + byAmountx * pieceSize, blackRook2.frame.origin.y - byAmounty * pieceSize, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if CGRectContainsPoint(boarderBoard.frame, pieceOption.center) == false {
								[pieceOption .removeFromSuperview()]
							} else {
								extraBlackRook2[option] += [pieceOption]
							}
							if CGRectContainsPoint(pieceOption.frame, whiteKing.center) {
								canGofurther = false
								
								if extraBlackRook2[option].count == 2 {
									moveBAllowed5 = false
									checkPieceWhite5 = option
								}
							}
							
						}
					}
				
			}
		}
		
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1, option: 0)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1, option: 1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0, option: 2)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0, option: 3)
		
	}
	
	func whiteKingDanger(var piece:UIImageView) {
		
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			let canThePieceGofurther: Bool = true
				
				for byAmountx; byAmountx >= -1 && byAmountx <= 1 && byAmounty >= -1 && byAmounty <= 1; byAmountx += increaserx, byAmounty += increasery {
					
				
							
							if canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(piece.frame.origin.x + byAmountx * pieceSize, piece.frame.origin.y - byAmounty * pieceSize, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if containsDanger(dangerWhitePieces, image: pieceOption) {
									pieceOption.removeFromSuperview()
								}
								dangerWhitePieces += [pieceOption]
							}
							
							for var o = 0 ; o < dangerWhitePieces.count; o++ {
								if CGRectContainsPoint(boarderBoard.frame, dangerWhitePieces[o].center) == false {
									[dangerWhitePieces[o] .removeFromSuperview()]
									dangerWhitePieces.removeAtIndex(o)
								}
							}
							
						}
					}
		
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0)
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1)
		
	}
	
	func blackKingDanger(var piece:UIImageView) {
		
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			let canThePieceGofurther: Bool = true
				
				for byAmountx; byAmountx >= -1 && byAmountx <= 1 && byAmounty >= -1 && byAmounty <= 1; byAmountx += increaserx, byAmounty += increasery {
					
							if canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(piece.frame.origin.x + byAmountx * pieceSize, piece.frame.origin.y - byAmounty * pieceSize, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if containsDanger(dangerBlackPieces, image: pieceOption) {
									pieceOption.removeFromSuperview()
								}
								dangerBlackPieces += [pieceOption]
							}
							
							
							for var o = 0 ; o < dangerBlackPieces.count; o++ {
								if CGRectContainsPoint(boarderBoard.frame, dangerBlackPieces[o].center) == false {
									[dangerBlackPieces[o] .removeFromSuperview()]
									dangerBlackPieces.removeAtIndex(o)
								}
							}
							
						}
					}
		
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0)
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1)
		
	}
	
	func whiteKingSelected(var _event:UIEvent, var _touch:UITouch) {
		
		showMarkedPiece()
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			
			if selectedPiece == whiteKing {
				
				for byAmountx; byAmountx >= -1 && byAmountx <= 1 && byAmounty >= -1 && byAmounty <= 1; byAmountx += increaserx, byAmounty += increasery {
					
					
					for var q = 0; q < whitePieces.count; q++ {
						if whitePieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
							canThePieceGofurther = false
						}
					}
					
					
					if canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
						pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						pieceOptions += [pieceOption]
					}
					
					
					for var r = 0; r < blackPieces.count; r++ {
						if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
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
					
					for var o = 0 ; o < pieceOptions.count; o++ {
						for var i = 0; i < dangerBlackPieces.count; i++ {
							if CGRectContainsPoint(pieceOptions[o].frame, dangerBlackPieces[i].center){
								pieceOptions[o].hidden = true
							}
						}
					}
					
					for var o = 0 ; o < dangerBlackQueen.count; o++ {
						for var i = 0; i < dangerBlackQueen[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerBlackQueen[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < dangerBlackBishop.count; o++ {
						for var i = 0; i < dangerBlackBishop[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerBlackBishop[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < dangerBlackBishop2.count; o++ {
						for var i = 0; i < dangerBlackBishop2[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerBlackBishop2[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < dangerBlackRook.count; o++ {
						for var i = 0; i < dangerBlackRook[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerBlackRook[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < dangerBlackRook2.count; o++ {
						for var i = 0; i < dangerBlackRook2[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerBlackRook2[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < extraPiecesBlack.count; o++ {
						for var p = 0 ; p < pieceOptions.count; p++ {
							if CGRectContainsPoint(pieceOptions[p].frame, extraPiecesBlack[o].center){
								pieceOptions[p].hidden = true
							}
						}
					}
					
				}
			}
		}
		
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0)
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1)
		
	}
	
	func whitePawnSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var canContForward: Bool = true
		var canTakeLeft: Bool = true
		var canTakeRight: Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
					for byAmounty; byAmounty <= 2; byAmountx += increaserx, byAmounty += increasery {
						
						//canTakeBlack = true
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
						
						
						if canThePieceGofurther == true && selectedPiece.frame.origin.y == _2 && canContForward == true  {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if checkBlack == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							pieceOptions += [pieceOption]
						} else if canThePieceGofurther == true && canContForward == true  {
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if checkBlack == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							pieceOptions += [pieceOption]
							
						}
						
						
						for var r = 0; r < blackPieces.count; r++ {
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x - byAmountx * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - 1 * pieceSize  && canTakeBlack == true{
								
								print("working")
								let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - byAmountx * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if checkBlack == true {
									for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
										}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - byAmountx * pieceSize, selectedPiece.frame.origin.y - 1 * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
									}
								}
								if containsDanger(pieceOptions, image: pieceOption) {
									pieceOption.removeFromSuperview()
								}
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
						
						for var q = 0; q < pieces.count; q++ {
							for var p = 0; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieces[q].frame, pieceOptions[p].center) && selectedPiece.frame.origin.y == _2 && pieceOptions[p].frame.origin.y == _4  {
									[pieceOptions[p] .removeFromSuperview()]
									
								}
							}
						}
					}
				}
		
		for var q = 0; q < extraBlackPiecesQueen[checkPieceWhite].count; q++ {
			if moveBAllowed == false && CGRectContainsPoint(extraBlackPiecesQueen[checkPieceWhite][q].frame, selectedPiece.center)  {
				//canThePieceGofurther = false
				for var i = 0; i < 8; i++ {
					for var q = 0; q < dangerBlackQueen[i].count; q++ {
						if CGRectContainsPoint(dangerBlackQueen[i][q].frame, selectedPiece.center) {
							if (i == 1) {
								canTakeBlack = false
								canContForward = true
								print("forward")
							} else if (i == 5) {
								canTakeBlack = true
								canContForward = false
								canTakeLeft = false
							} else if (i == 6) {
								canTakeBlack = true
								canContForward = false
								canTakeRight = false
							} else {
								canTakeBlack = false
								canContForward = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackBishop[checkPieceWhite2].count; q++ {
			if moveBAllowed2 == false && CGRectContainsPoint(extraBlackBishop[checkPieceWhite2][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackBishop[i].count; q++ {
						if CGRectContainsPoint(extraBlackBishop[i][q].frame, selectedPiece.center) {
							if (i == 1) {
								canTakeBlack = true
								canContForward = false
								canTakeLeft = false
								print("left")
							}
							else if (i == 2) {
								canTakeBlack = true
								canContForward = false
								canTakeRight = false
								print("right")
							} else {
								canTakeBlack = false
								canContForward = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackBishop2[checkPieceWhite3].count; q++ {
			if moveBAllowed3 == false && CGRectContainsPoint(extraBlackBishop2[checkPieceWhite3][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraBlackBishop2[i].count; q++ {
						if CGRectContainsPoint(extraBlackBishop2[i][q].frame, selectedPiece.center) {
							if (i == 1) {
								canTakeBlack = true
								canContForward = false
								canTakeLeft = false
							}
							else if (i == 2) {
								canTakeBlack = true
								canContForward = false
								canTakeRight = false
								print("right")
							} else {
								canTakeBlack = false
								canContForward = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraBlackRook[checkPieceWhite4].count; q++ {
			if moveBAllowed4 == false && CGRectContainsPoint(extraBlackRook[checkPieceWhite4][q].frame, selectedPiece.center)  {
				canTakeBlack = false
			}
			
		}
		
		for var q = 0; q < extraBlackRook2[checkPieceWhite5].count; q++ {
			if moveBAllowed5 == false && CGRectContainsPoint(extraBlackRook2[checkPieceWhite5][q].frame, selectedPiece.center)  {
				canTakeBlack = false
			}
			
		}
		
		if canTakeLeft == true {
			letThemAppear(1, byAmounty: 1, increaserx: 0, increasery: 1)
		}
		if canTakeRight == true {
			letThemAppear(-1, byAmounty: 1, increaserx: 0, increasery: 1)
		}
	}
	
	func blackPawnSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var canContForward: Bool = true
		var canTakeLeft: Bool = true
		var canTakeRight: Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
					
					for byAmounty;  byAmounty <= 2 ; byAmountx += increaserx, byAmounty += increasery {
						//canTake = true
//						canTakeRight = true
//						canTakeLeft = true
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
						
						
						if canThePieceGofurther == true && selectedPiece.frame.origin.y == _7 && canContForward == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + byAmounty * pieceSize, size, size))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if check == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							if containsDanger(pieceOptions, image: pieceOption) {
								pieceOption.removeFromSuperview()
							}
							
							pieceOptions += [pieceOption]
						} else if canThePieceGofurther == true && canContForward == true {
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + 1 * pieceSize, size, size))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if check == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + 1 * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							if containsDanger(pieceOptions, image: pieceOption) {
								pieceOption.removeFromSuperview()
							}
					
							pieceOptions += [pieceOption]
						}
						for var r = 0; r < whitePieces.count; r++ {
							if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x - byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y + 1 * pieceSize && canTake == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - byAmountx * pieceSize, selectedPiece.frame.origin.y + 1 * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if check == true {
									for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
										}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - byAmountx * pieceSize, selectedPiece.frame.origin.y + 1 * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
									}
								}
								if containsDanger(pieceOptions, image: pieceOption) {
									pieceOption.removeFromSuperview()
								}
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
						
						for var q = 0; q < pieces.count; q++ {
							for var p = 0; p < pieceOptions.count; p++ {
							if CGRectContainsPoint(pieces[q].frame, pieceOptions[p].center) && selectedPiece.frame.origin.y == _7 && pieceOptions[p].frame.origin.y == _5 {
								[pieceOptions[p] .removeFromSuperview()]
							}
						}
					}
				
				}
			}
		
		for var q = 0; q < extraPiecesQueen[checkPiece].count; q++ {
			if moveAllowed == false && CGRectContainsPoint(extraPiecesQueen[checkPiece][q].frame, selectedPiece.center)  {
				//canThePieceGofurther = false
				for var i = 0; i < 8; i++ {
					for var q = 0; q < dangerWhiteQueen[i].count; q++ {
						if CGRectContainsPoint(dangerWhiteQueen[i][q].frame, selectedPiece.center) {
							if (i == 0) {
								canTake = false
								canContForward = true
							}
							else if (i == 4) {
								canTake = true
								canContForward = false
								canTakeLeft = false
								print("right")
							} else if (i == 7) {
								canTake = true
								canContForward = false
								canTakeRight = false
								print("left")
							} else {
								canTake = false
								canContForward = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop[checkPiece2].count; q++ {
			if moveAllowed2 == false && CGRectContainsPoint(extraWhiteBishop[checkPiece2][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < dangerWhiteBishop[i].count; q++ {
						if CGRectContainsPoint(dangerWhiteBishop[i][q].frame, selectedPiece.center) {
							if (i == 0) {
								canTake = true
								canContForward = false
								canTakeLeft = false
							}
							else if (i == 3) {
								canTake = true
								canContForward = false
								canTakeRight = false
								print("right")
							} else {
								canTake = false
								canContForward = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop2[checkPiece3].count; q++ {
			if moveAllowed3 == false && CGRectContainsPoint(extraWhiteBishop2[checkPiece3][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < dangerWhiteBishop2[i].count; q++ {
						if CGRectContainsPoint(dangerWhiteBishop2[i][q].frame, selectedPiece.center) {
							if (i == 0) {
								canTake = true
								canContForward = false
								canTakeLeft = false
							}
							else if (i == 3) {
								canTake = true
								canContForward = false
								canTakeRight = false
								print("right")
							} else {
								canTake = false
								canContForward = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteRook[checkPiece4].count; q++ {
			if moveAllowed4 == false && CGRectContainsPoint(extraWhiteRook[checkPiece4][q].frame, selectedPiece.center)  {
				//canThePieceGofurther = false
				
				canTake = false
			}
			
		}
		
		for var q = 0; q < extraWhiteRook2[checkPiece5].count; q++ {
			if moveAllowed5 == false && CGRectContainsPoint(extraWhiteRook2[checkPiece5][q].frame, selectedPiece.center)  {
				//canThePieceGofurther = false
				
				canTake = false
			}
			
		}
		if canTakeRight == true {
		letThemAppear(1, byAmounty: 1, increaserx: 0, increasery: 1)
		}
		if canTakeLeft == true {
		letThemAppear(-1, byAmounty: 1, increaserx: 0, increasery: 1)
		}
	}
	
	func blackBishopSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var canGofurther: Bool = true
		var canGofurther2: Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
					
					for byAmountx; byAmountx >= -8 && byAmountx <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						
						for var q = 0; q < blackPieces.count; q++ {
							if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if check == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							pieceOptions += [pieceOption]
						}
						for var r = 0; r < whitePieces.count; r++ {
							if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if check == true {
									for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
										}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
									}
								}
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
		
		for var q = 0; q < extraPiecesQueen[checkPiece].count; q++ {
			if moveAllowed == false && CGRectContainsPoint(extraPiecesQueen[checkPiece][q].frame, selectedPiece.center)  {
				for var i = 0; i < 8; i++ {
					for var q = 0; q < dangerWhiteQueen[i].count; q++ {
						if CGRectContainsPoint(dangerWhiteQueen[i][q].frame, selectedPiece.center) {
							if (i == 4 || i == 5) {
								canGofurther = true
								canGofurther2 = false
							} else if (i == 6 || i == 7) {
								canGofurther = false
								canGofurther2 = true
							} else if (i == 0 || i == 1 || i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop[checkPiece2].count; q++ {
			if moveAllowed2 == false && CGRectContainsPoint(extraWhiteBishop[checkPiece2][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraWhiteBishop[i].count; q++ {
						if CGRectContainsPoint(extraWhiteBishop[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
							} else {
								canGofurther = false
								canGofurther2 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop2[checkPiece3].count; q++ {
			if moveAllowed3 == false && CGRectContainsPoint(extraWhiteBishop2[checkPiece3][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraWhiteBishop2[i].count; q++ {
						if CGRectContainsPoint(extraWhiteBishop2[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
							} else {
								canGofurther = false
								canGofurther2 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteRook[checkPiece4].count; q++ {
			if moveAllowed4 == false && CGRectContainsPoint(extraWhiteRook[checkPiece4][q].frame, selectedPiece.center)  {
				canGofurther = false
				canGofurther2 = false
			}
			
		}
		
		for var q = 0; q < extraWhiteRook2[checkPiece5].count; q++ {
			if moveAllowed5 == false && CGRectContainsPoint(extraWhiteRook2[checkPiece5][q].frame, selectedPiece.center)  {
				canGofurther = false
				canGofurther2 = false
			}
			
		}
		
		if canGofurther == true {
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1)
		}
		if canGofurther2 == true {
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1)
		}
	}
	
	func blackKnightSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var canMoveFurther : Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat, var byAmountz:CGFloat, increaserz:CGFloat ) {
			var canThePieceGofurther: Bool = true
					
					for byAmountx; byAmountz <= 2; byAmountx += increaserx, byAmounty += increasery, byAmountz += increaserz {
						
						
						for var q = 0; q < blackPieces.count; q++ {
							if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
						
						
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if check == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							pieceOptions += [pieceOption]
							
						}
						
						
						for var r = 0; r < whitePieces.count; r++ {
							if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true{
								
								let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if check == true {
									for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
										}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
									}
								}
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
		for var q = 0; q < extraPiecesQueen[checkPiece].count; q++ {
			if moveAllowed == false && CGRectContainsPoint(extraPiecesQueen[checkPiece][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop[checkPiece2].count; q++ {
			if moveAllowed2 == false && CGRectContainsPoint(extraWhiteBishop[checkPiece2][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop2[checkPiece3].count; q++ {
			if moveAllowed3 == false && CGRectContainsPoint(extraWhiteBishop2[checkPiece3][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
			
		}
		
		for var q = 0; q < extraWhiteRook[checkPiece4].count; q++ {
			if moveAllowed4 == false && CGRectContainsPoint(extraWhiteRook[checkPiece4][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
			
		}
		
		for var q = 0; q < extraWhiteRook2[checkPiece5].count; q++ {
			if moveAllowed5 == false && CGRectContainsPoint(extraWhiteRook2[checkPiece5][q].frame, selectedPiece.center)  {
				canMoveFurther = false
			}
		}
			
			if canMoveFurther == true {
		letThemAppear(2, byAmounty: 1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-2, byAmounty: 1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(1, byAmounty: 2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(1, byAmounty: -2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-1, byAmounty: 2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-1, byAmounty: -2, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(2, byAmounty: -1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		letThemAppear(-2, byAmounty: -1, increaserx: 0, increasery: 0, byAmountz: 1 ,increaserz: 1)
		
			
		}
	}
	
	func blackRookSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var letAppear: Bool = true
		var canThePieceGofurther: Bool = true
		var canGofurther: Bool = true
		var canGofurther2: Bool = true
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
				canThePieceGofurther = true
					for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
						
						
						for var q = 0; q < blackPieces.count; q++ {
							if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
								canThePieceGofurther = false
							}
						}
					
						if canThePieceGofurther == true {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if check == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
							pieceOptions += [pieceOption]
						}
						
						
						for var r = 0; r < whitePieces.count; r++ {
							if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true {
								
								let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								if check == true {
									for var i = 0 ; i < dangerPieces.count; i++ {
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
											[pieceOption .removeFromSuperview()]
										}
										if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
											let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
											pieceOption.image = UIImage(named: "piecePossibilities.png")
											self.view.addSubview(pieceOption)
											pieceOptions += [pieceOption]
										}
									}
								}
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
		
		for var q = 0; q < extraPiecesQueen[checkPiece].count; q++ {
			if moveAllowed == false && CGRectContainsPoint(extraPiecesQueen[checkPiece][q].frame, selectedPiece.center)  {
				for var i = 0; i < 8; i++ {
					for var q = 0; q < dangerWhiteQueen[i].count; q++ {
							if CGRectContainsPoint(dangerWhiteQueen[i][q].frame, selectedPiece.center) {
								if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
								} else if (i == 0 || i == 1) {
									canGofurther = true
									canGofurther2 = false
								} else if (i == 4 || i == 5 || i == 6 || i == 7) {
									canGofurther = false
									canGofurther2 = false
								}
							}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop[checkPiece2].count; q++ {
			if moveAllowed2 == false && CGRectContainsPoint(extraWhiteBishop[checkPiece2][q].frame, selectedPiece.center)  {
				canGofurther = false
				canGofurther2 = false
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop2[checkPiece3].count; q++ {
			if moveAllowed3 == false && CGRectContainsPoint(extraWhiteBishop2[checkPiece3][q].frame, selectedPiece.center)  {
				canGofurther = false
				canGofurther2 = false
			}
			
		}
		
		for var q = 0; q < extraWhiteRook[checkPiece4].count; q++ {
			if moveAllowed4 == false && CGRectContainsPoint(extraWhiteRook[checkPiece4][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraWhiteRook[i].count; q++ {
						if CGRectContainsPoint(extraWhiteRook[i][q].frame, selectedPiece.center) {
						if (i == 2 || i == 3) {
							canGofurther = false
							canGofurther2 = true
						} else {
							canGofurther = true
							canGofurther2 = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteRook2[checkPiece5].count; q++ {
			if moveAllowed5 == false && CGRectContainsPoint(extraWhiteRook2[checkPiece5][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraWhiteRook2[i].count; q++ {
						if CGRectContainsPoint(extraWhiteRook2[i][q].frame, selectedPiece.center) {
							if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
							} else {
								canGofurther = true
								canGofurther2 = false
							}
						}
					}
				}
			}
			
		}
		if canGofurther == true {
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1)
		}
		if canGofurther2 == true {
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0)
		}
	}
	
	func blackQueenSelected(var _event:UIEvent, var _touch:UITouch) {
		showMarkedPiece()
		var canGofurther: Bool = true
		var canGofurther2: Bool = true
		var canGofurther3: Bool = true
		var canGofurther4: Bool = true
		
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
				var canThePieceGofurther: Bool = true
				
				for byAmountx; byAmountx >= -8 && byAmountx <= 8 && byAmounty >= -8 && byAmounty <= 8; byAmountx += increaserx, byAmounty += increasery {
					
					
					for var q = 0; q < blackPieces.count; q++ {
						if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
							canThePieceGofurther = false
						}
					}
					
					
					if canThePieceGofurther == true{
						
						let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
						pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						if check == true {
							for var i = 0 ; i < dangerPieces.count; i++ {
								if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
									[pieceOption .removeFromSuperview()]
								}
								if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
									let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
									pieceOption.image = UIImage(named: "piecePossibilities.png")
									self.view.addSubview(pieceOption)
									pieceOptions += [pieceOption]
								}
							}
						}
						pieceOptions += [pieceOption]
					}
					
					
					for var r = 0; r < whitePieces.count; r++ {
						if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize && canThePieceGofurther == true  {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							if check == true {
								for var i = 0 ; i < dangerPieces.count; i++ {
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) == false {
										[pieceOption .removeFromSuperview()]
									}
									if CGRectContainsPoint(dangerPieces[i].frame, pieceOption.center) {
										let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
										pieceOption.image = UIImage(named: "piecePossibilities.png")
										self.view.addSubview(pieceOption)
										pieceOptions += [pieceOption]
									}
								}
							}
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
		
		for var q = 0; q < extraPiecesQueen[checkPiece].count; q++ {
			if moveAllowed == false && CGRectContainsPoint(extraPiecesQueen[checkPiece][q].frame, selectedPiece.center)  {
				for var i = 0; i < 8; i++ {
					for var q = 0; q < dangerWhiteQueen[i].count; q++ {
						if CGRectContainsPoint(dangerWhiteQueen[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
								canGofurther3 = false
								canGofurther4 = false
							} else if (i == 4 || i == 5) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = true
								canGofurther4 = false
								
							} else if (i == 6 || i == 7) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop[checkPiece2].count; q++ {
			if moveAllowed2 == false && CGRectContainsPoint(extraWhiteBishop[checkPiece2][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraWhiteBishop[i].count; q++ {
						if CGRectContainsPoint(extraWhiteBishop[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = true
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteBishop2[checkPiece3].count; q++ {
			if moveAllowed3 == false && CGRectContainsPoint(extraWhiteBishop2[checkPiece3][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraWhiteBishop2[i].count; q++ {
						if CGRectContainsPoint(extraWhiteBishop2[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = true
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = true
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteRook[checkPiece4].count; q++ {
			if moveAllowed4 == false && CGRectContainsPoint(extraWhiteRook[checkPiece4][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraWhiteRook[i].count; q++ {
						if CGRectContainsPoint(extraWhiteRook[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
								canGofurther3 = false
								canGofurther4 = false
							}
						}
					}
				}
			}
			
		}
		
		for var q = 0; q < extraWhiteRook2[checkPiece5].count; q++ {
			if moveAllowed5 == false && CGRectContainsPoint(extraWhiteRook2[checkPiece5][q].frame, selectedPiece.center)  {
				for var i = 0; i < 4; i++ {
					for var q = 0; q < extraWhiteRook2[i].count; q++ {
						if CGRectContainsPoint(extraWhiteRook2[i][q].frame, selectedPiece.center) {
							if (i == 0 || i == 1) {
								canGofurther = true
								canGofurther2 = false
								canGofurther3 = false
								canGofurther4 = false
							} else if (i == 2 || i == 3) {
								canGofurther = false
								canGofurther2 = true
								canGofurther3 = false
								canGofurther4 = false
							}
						}
					}
				}
			}
		}
		
			if canGofurther == true {
		// Up and down
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1)
			}
			if canGofurther2 == true {
		// Left and Right
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0)
			}
			if canGofurther3 == true {
		// Up-right and down-left
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1)
		
			}
			if canGofurther4 == true {
		// Up-left and down-left
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1)
				
		
			}
	}
	
	func blackKingSelected(var _event:UIEvent, var _touch:UITouch) {
		
		showMarkedPiece()
		
		func letThemAppear(var byAmountx:CGFloat, var byAmounty:CGFloat, increaserx:CGFloat, increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			
			if selectedPiece == blackKing {
				
				for byAmountx; byAmountx >= -1 && byAmountx <= 1 && byAmounty >= -1 && byAmounty <= 1; byAmountx += increaserx, byAmounty += increasery {
					
					
					for var q = 0; q < blackPieces.count; q++ {
						if blackPieces[q].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && blackPieces[q].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize{
							canThePieceGofurther = false
						}
						
					}
					
					if canThePieceGofurther == true {
						
						let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
						pieceOption.image = UIImage(named: "piecePossibilities.png")
						self.view.addSubview(pieceOption)
						pieceOptions += [pieceOption]
					}
					
					
					for var r = 0; r < whitePieces.count; r++ {
						if whitePieces[r].frame.origin.x == selectedPiece.frame.origin.x + byAmountx * pieceSize && whitePieces[r].frame.origin.y == selectedPiece.frame.origin.y - byAmounty * pieceSize {
							
							let pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x + byAmountx * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
							pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							pieceOptions += [pieceOption]
							pieceCanTake = pieceOption
							pieceToTake = whitePieces[r]
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
						for var i = 0; i < dangerWhitePieces.count; i++ {
							if CGRectContainsPoint(pieceOptions[o].frame, dangerWhitePieces[i].center){
								pieceOptions[o].hidden = true
							}
						}
					}
					
					for var o = 0 ; o < dangerWhiteQueen.count; o++ {
						for var i = 0; i < dangerWhiteQueen[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
							if CGRectContainsPoint(pieceOptions[p].frame, dangerWhiteQueen[o][i].center){
								pieceOptions[p].hidden = true
							}
						}
					}
					}
					for var o = 0 ; o < dangerWhiteBishop.count; o++ {
						for var i = 0; i < dangerWhiteBishop[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerWhiteBishop[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < dangerWhiteBishop2.count; o++ {
						for var i = 0; i < dangerWhiteBishop2[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerWhiteBishop2[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < dangerWhiteRook.count; o++ {
						for var i = 0; i < dangerWhiteRook[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerWhiteRook[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < dangerWhiteRook2.count; o++ {
						for var i = 0; i < dangerWhiteRook2[o].count; i++ {
							for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, dangerWhiteRook2[o][i].center){
									pieceOptions[p].hidden = true
								}
							}
						}
					}
					for var o = 0 ; o < extraPieces.count; o++ {
						for var p = 0 ; p < pieceOptions.count; p++ {
								if CGRectContainsPoint(pieceOptions[p].frame, extraPieces[o].center){
									pieceOptions[p].hidden = true
								}
						}
					}
				}
			}
		}
		letThemAppear(0, byAmounty: 1, increaserx: 0, increasery: 1)
		letThemAppear(0, byAmounty: -1, increaserx: 0, increasery: -1)
		letThemAppear(1, byAmounty: 0, increaserx: 1, increasery: 0)
		letThemAppear(-1, byAmounty: 0, increaserx: -1, increasery: 0)
		letThemAppear(1, byAmounty: 1, increaserx: 1, increasery: 1)
		letThemAppear(1,byAmounty: -1,increaserx: 1,increasery: -1)
		letThemAppear(-1,byAmounty: 1,increaserx: -1,increasery: 1)
		letThemAppear(-1,byAmounty: -1,increaserx: -1,increasery: -1)
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
			
			for var i = 0 ; i < pieces.count; i++ {
				for var o = 0 ; o < piecePos.count; o++ {
					if CGRectContainsPoint(pieces[i].frame, piecePos[o].center) {
						pieces[i].frame.origin = piecePos[o].frame.origin
					}
				}
			}
			
			if pawnShowDanger1 == true {
				whitePawnDanger(whitePawn1, own: blackPawns, byAmount: -1)
			}
			if pawnShowDanger2 == true {
			whitePawnDanger(whitePawn2, own: blackPawns, byAmount: -1)
			}
			if pawnShowDanger3 == true {
			whitePawnDanger(whitePawn3, own: blackPawns, byAmount: -1)
			}
			if pawnShowDanger4 == true {
			whitePawnDanger(whitePawn4, own: blackPawns, byAmount: -1)
			}
			if pawnShowDanger5 == true {
			whitePawnDanger(whitePawn5, own: blackPawns, byAmount: -1)
			}
			if pawnShowDanger6 == true {
			whitePawnDanger(whitePawn6, own: blackPawns, byAmount: -1)
			}
			if pawnShowDanger7 == true {
			whitePawnDanger(whitePawn7, own: blackPawns, byAmount: -1)
			}
			if pawnShowDanger8 == true {
			whitePawnDanger(whitePawn8, own: blackPawns, byAmount: -1)
			}
			if knightShowDanger == true {
			whiteKnightDanger(whiteKnight1)
			}
			if knightShowDanger2 == true {
			whiteKnightDanger(whiteKnight2)
			}
			
			if kingShowDanger == true {
				whiteKingDanger(whiteKing)
			}
			
			if queenShowDanger == true {
				
				whiteQueenDanger()
			}
			
			if bishopShowDanger == true {
				whiteBishopDanger()
			}
			if bishopShowDanger2 == true {
				whiteBishopDanger2()
			}
			if rookShowDanger == true {
				whiteRookDanger()
			}
			if rookShowDanger2 == true {
				whiteRookDanger2()
			}
			
			if pawnBShowDanger1 == true {
				blackPawnDanger(blackPawn1, own: whitePawns, byAmount: 1)
			}
			if pawnBShowDanger2 == true {
				blackPawnDanger(blackPawn2, own: whitePawns, byAmount: 1)
			}
			if pawnBShowDanger3 == true {
				blackPawnDanger(blackPawn3, own: whitePawns, byAmount: 1)
			}
			if pawnBShowDanger4 == true {
				blackPawnDanger(blackPawn4, own: whitePawns, byAmount: 1)
			}
			if pawnBShowDanger5 == true {
				blackPawnDanger(blackPawn5, own: whitePawns, byAmount: 1)
			}
			if pawnBShowDanger6 == true {
				blackPawnDanger(blackPawn6, own: whitePawns, byAmount: 1)
			}
			if pawnBShowDanger7 == true {
				blackPawnDanger(blackPawn7, own: whitePawns, byAmount: 1)
			}
			if pawnBShowDanger8 == true {
				blackPawnDanger(blackPawn8, own: whitePawns, byAmount: 1)
			}
			
			if queenBShowDanger == true {
				blackQueenDanger()
			}
			if knightBShowDanger == true {
			blackKnightDanger(blackKnight1)
			}
			if knightBShowDanger2 == true {
			blackKnightDanger(blackKnight2)
			}
			
			if bishopBShowDanger == true {
				blackBishopDanger()
			}
			if bishopBShowDanger2 == true {
				blackBishopDanger2()
			}
			if rookBShowDanger == true {
				blackRookDanger()
			}
			if rookBShowDanger2 == true {
				blackRookDanger2()
			}

			if kingBShowDanger == true {
			blackKingDanger(blackKing)
			}
			
			if check == true {
				
				for var i = 0; i < dangerWhiteQueen.count; i++ {
					if dangerWhiteQueen[i].count != 0 {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteQueen[i][dangerWhiteQueen[i].count-1].center) == false{
							for var w = 0; w < dangerWhiteQueen[i].count; w++ {
								[dangerWhiteQueen[i][w] .removeFromSuperview()]
								//dangerWhiteBishop[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(blackKing.frame, dangerWhiteQueen[i][dangerWhiteQueen[i].count-1].center)  {
							for var w = 0; w < dangerWhiteQueen[i].count; w++ {
								dangerPieces += [dangerWhiteQueen[i][w]]
							}
						}
						
						if show == true && selectedPiece == whiteQueen {
							let pieceOption = UIImageView(frame: CGRectMake(whiteQueen.frame.origin.x, whiteQueen.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
						
					}
					
				}
				
				
				for var i = 0; i < dangerWhitePieces.count; i++ {
					if dangerWhitePieces.count != 0 {
						if CGRectContainsPoint(blackKing.frame, dangerWhitePieces[i].center) == false{
							for var w = 0; w < dangerWhitePieces.count; w++ {
								[dangerWhitePieces[i] .removeFromSuperview()]
								//dangerWhiteBishop[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(blackKing.frame, dangerWhitePieces[i].center)  {
							dangerPieces += [dangerWhitePieces[i]]
						}
					
							for var w = 0; w < whiteKnights.count; w++ {
						if show == true && selectedPiece == whiteKnights[w] {
							let pieceOption = UIImageView(frame: CGRectMake(whiteKnights[w].frame.origin.x, whiteKnights[w].frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
								}
						}
						for var p = 0; p < whitePawns.count; p++ {
							if show == true && selectedPiece == whitePawns[p] {
								let pieceOption = UIImageView(frame: CGRectMake(whitePawns[p].frame.origin.x, whitePawns[p].frame.origin.y, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								dangerPieces += [pieceOption]
								show = false
							}
						}
					}
				}
				
				for var i = 0; i < dangerWhiteBishop.count; i++ {
					if dangerWhiteBishop[i].count != 0 {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteBishop[i][dangerWhiteBishop[i].count-1].center) == false{
							for var w = 0; w < dangerWhiteBishop[i].count; w++ {
								[dangerWhiteBishop[i][w] .removeFromSuperview()]
								//dangerWhiteBishop[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(blackKing.frame, dangerWhiteBishop[i][dangerWhiteBishop[i].count-1].center)  {
							for var w = 0; w < dangerWhiteBishop[i].count; w++ {
								dangerPieces += [dangerWhiteBishop[i][w]]
							}
						}
						
						if show == true && selectedPiece == whiteBishop1 {
							let pieceOption = UIImageView(frame: CGRectMake(whiteBishop1.frame.origin.x, whiteBishop1.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
					}
				}
				
				for var i = 0; i < dangerWhiteBishop2.count; i++ {
					if dangerWhiteBishop2[i].count != 0 {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteBishop2[i][dangerWhiteBishop2[i].count-1].center) == false{
							for var w = 0; w < dangerWhiteBishop2[i].count; w++ {
								[dangerWhiteBishop2[i][w] .removeFromSuperview()]
								//dangerWhiteBishop2[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(blackKing.frame, dangerWhiteBishop2[i][dangerWhiteBishop2[i].count-1].center)  {
							for var w = 0; w < dangerWhiteBishop2[i].count; w++ {
								dangerPieces += [dangerWhiteBishop2[i][w]]
							}
						}
						
						if show == true && selectedPiece == whiteBishop2 {
							let pieceOption = UIImageView(frame: CGRectMake(whiteBishop2.frame.origin.x, whiteBishop2.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
					}
				}
				
				for var i = 0; i < dangerWhiteRook.count; i++ {
					if dangerWhiteRook[i].count != 0 {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteRook[i][dangerWhiteRook[i].count-1].center) == false{
							for var w = 0; w < dangerWhiteRook[i].count; w++ {
								[dangerWhiteRook[i][w] .removeFromSuperview()]
								//dangerWhiteRook[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(blackKing.frame, dangerWhiteRook[i][dangerWhiteRook[i].count-1].center)  {
							for var w = 0; w < dangerWhiteRook[i].count; w++ {
								dangerPieces += [dangerWhiteRook[i][w]]
							}
						}
						
						if show == true && selectedPiece == whiteRook1 {
							let pieceOption = UIImageView(frame: CGRectMake(whiteRook1.frame.origin.x, whiteRook1.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
					}
				}
				
				for var i = 0; i < dangerWhiteRook2.count; i++ {
					if dangerWhiteRook2[i].count != 0 {
						if CGRectContainsPoint(blackKing.frame, dangerWhiteRook2[i][dangerWhiteRook2[i].count-1].center) == false{
							for var w = 0; w < dangerWhiteRook2[i].count; w++ {
								[dangerWhiteRook2[i][w] .removeFromSuperview()]
								//dangerWhiteRook2[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(blackKing.frame, dangerWhiteRook2[i][dangerWhiteRook2[i].count-1].center)  {
							for var w = 0; w < dangerWhiteRook2[i].count; w++ {
								dangerPieces += [dangerWhiteRook2[i][w]]
							}
						}
						
						if show == true && selectedPiece == whiteRook2 {
							let pieceOption = UIImageView(frame: CGRectMake(whiteRook2.frame.origin.x, whiteRook2.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}

					}
				}
				
				}
			
			if checkBlack == true {
				
				for var i = 0; i < dangerBlackBishop.count; i++ {
					if dangerBlackBishop[i].count != 0 {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackBishop[i][dangerBlackBishop[i].count-1].center) == false{
							for var w = 0; w < dangerBlackBishop[i].count; w++ {
								[dangerBlackBishop[i][w] .removeFromSuperview()]
								//dangerWhiteBishop[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(whiteKing.frame, dangerBlackBishop[i][dangerBlackBishop[i].count-1].center)  {
							for var w = 0; w < dangerBlackBishop[i].count; w++ {
								dangerPieces += [dangerBlackBishop[i][w]]
							}
						}
						
						if show == true && selectedPiece == blackBishop1 {
							let pieceOption = UIImageView(frame: CGRectMake(blackBishop1.frame.origin.x, blackBishop1.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
						
					}
				}
				
				for var i = 0; i < dangerBlackPieces.count; i++ {
					if dangerBlackPieces.count != 0 {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackPieces[i].center) == false{
							for var w = 0; w < dangerBlackPieces.count; w++ {
								[dangerBlackPieces[i] .removeFromSuperview()]
								//dangerWhiteBishop[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(whiteKing.frame, dangerBlackPieces[i].center)  {
							dangerPieces += [dangerBlackPieces[i]]
						}
						
						for var w = 0; w < blackKnights.count; w++ {
							if show == true && selectedPiece == blackKnights[w] {
								let pieceOption = UIImageView(frame: CGRectMake(blackKnights[w].frame.origin.x, blackKnights[w].frame.origin.y, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								dangerPieces += [pieceOption]
								show = false
							}
						}
						for var p = 0; p < blackPawns.count; p++ {
							if show == true && selectedPiece == blackPawns[p] {
								let pieceOption = UIImageView(frame: CGRectMake(blackPawns[p].frame.origin.x, blackPawns[p].frame.origin.y, size, size))
								//pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								dangerPieces += [pieceOption]
								show = false
							}
						}
					}
				}
				
				for var i = 0; i < dangerBlackBishop2.count; i++ {
					if dangerBlackBishop2[i].count != 0 {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackBishop2[i][dangerBlackBishop2[i].count-1].center) == false{
							for var w = 0; w < dangerBlackBishop2[i].count; w++ {
								[dangerBlackBishop2[i][w] .removeFromSuperview()]
							}
						}
						if CGRectContainsPoint(whiteKing.frame, dangerBlackBishop2[i][dangerBlackBishop2[i].count-1].center)  {
							for var w = 0; w < dangerBlackBishop2[i].count; w++ {
								dangerPieces += [dangerBlackBishop2[i][w]]
							}
						}
						
						if show == true && selectedPiece == blackBishop2 {
							let pieceOption = UIImageView(frame: CGRectMake(blackBishop2.frame.origin.x, blackBishop2.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
					}
				}
				
				for var i = 0; i < dangerBlackRook.count; i++ {
					if dangerBlackRook[i].count != 0 {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackRook[i][dangerBlackRook[i].count-1].center) == false{
							for var w = 0; w < dangerBlackRook[i].count; w++ {
								[dangerBlackRook[i][w] .removeFromSuperview()]
								//dangerWhiteRook[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(whiteKing.frame, dangerBlackRook[i][dangerBlackRook[i].count-1].center)  {
							for var w = 0; w < dangerBlackRook[i].count; w++ {
								dangerPieces += [dangerBlackRook[i][w]]
							}
						}
						
						if show == true && selectedPiece == blackRook1 {
							let pieceOption = UIImageView(frame: CGRectMake(blackRook1.frame.origin.x, blackRook1.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
					}
				}
				
				for var i = 0; i < dangerBlackRook2.count; i++ {
					if dangerBlackRook2[i].count != 0 {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackRook2[i][dangerBlackRook2[i].count-1].center) == false{
							for var w = 0; w < dangerBlackRook2[i].count; w++ {
								[dangerBlackRook2[i][w] .removeFromSuperview()]
								//dangerWhiteRook2[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(whiteKing.frame, dangerBlackRook2[i][dangerBlackRook2[i].count-1].center)  {
							for var w = 0; w < dangerBlackRook2[i].count; w++ {
								dangerPieces += [dangerBlackRook2[i][w]]
							}
						}
						if show == true && selectedPiece == blackRook2 {
							let pieceOption = UIImageView(frame: CGRectMake(blackRook2.frame.origin.x, blackRook2.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
					}
				}
				
				for var i = 0; i < dangerBlackQueen.count; i++ {
					if dangerBlackQueen[i].count != 0 {
						if CGRectContainsPoint(whiteKing.frame, dangerBlackQueen[i][dangerBlackQueen[i].count-1].center) == false{
							for var w = 0; w < dangerBlackQueen[i].count; w++ {
								[dangerBlackQueen[i][w] .removeFromSuperview()]
								//dangerWhiteRook2[i].removeAtIndex(w)
							}
						}
						if CGRectContainsPoint(whiteKing.frame, dangerBlackQueen[i][dangerBlackQueen[i].count-1].center)  {
							for var w = 0; w < dangerBlackQueen[i].count; w++ {
								dangerPieces += [dangerBlackQueen[i][w]]
							}
						}
						if show == true && selectedPiece == blackQueen {
							let pieceOption = UIImageView(frame: CGRectMake(blackQueen.frame.origin.x, blackQueen.frame.origin.y, size, size))
							//pieceOption.image = UIImage(named: "piecePossibilities.png")
							self.view.addSubview(pieceOption)
							dangerPieces += [pieceOption]
							show = false
						}
					}
				}
			}
			for var i = 0; i < extraPiecesQueen.count; i++ {
				if extraPiecesQueen[i].count != 0 {
					if CGRectContainsPoint(blackKing.frame, extraPiecesQueen[i][extraPiecesQueen[i].count-1].center) == false{
						for var w = 0; w < extraPiecesQueen[i].count; w++ {
							[extraPiecesQueen[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraBlackPiecesQueen.count; i++ {
				if extraBlackPiecesQueen[i].count != 0 {
					if CGRectContainsPoint(whiteKing.frame, extraBlackPiecesQueen[i][extraBlackPiecesQueen[i].count-1].center) == false{
						for var w = 0; w < extraBlackPiecesQueen[i].count; w++ {
							[extraBlackPiecesQueen[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraBlackBishop.count; i++ {
				if extraBlackBishop[i].count != 0 {
					if CGRectContainsPoint(whiteKing.frame, extraBlackBishop[i][extraBlackBishop[i].count-1].center) == false{
						for var w = 0; w < extraBlackBishop[i].count; w++ {
							[extraBlackBishop[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraBlackBishop2.count; i++ {
				if extraBlackBishop2[i].count != 0 {
					if CGRectContainsPoint(whiteKing.frame, extraBlackBishop2[i][extraBlackBishop2[i].count-1].center) == false{
						for var w = 0; w < extraBlackBishop2[i].count; w++ {
							[extraBlackBishop2[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraWhiteBishop.count; i++ {
				if extraWhiteBishop[i].count != 0 {
					if CGRectContainsPoint(blackKing.frame, extraWhiteBishop[i][extraWhiteBishop[i].count-1].center) == false{
						for var w = 0; w < extraWhiteBishop[i].count; w++ {
							[extraWhiteBishop[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraWhiteBishop2.count; i++ {
				if extraWhiteBishop2[i].count != 0 {
					if CGRectContainsPoint(blackKing.frame, extraWhiteBishop2[i][extraWhiteBishop2[i].count-1].center) == false{
						for var w = 0; w < extraWhiteBishop2[i].count; w++ {
							[extraWhiteBishop2[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraWhiteRook.count; i++ {
				if extraWhiteRook[i].count != 0 {
					if CGRectContainsPoint(blackKing.frame, extraWhiteRook[i][extraWhiteRook[i].count-1].center) == false{
						for var w = 0; w < extraWhiteRook[i].count; w++ {
							[extraWhiteRook[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraWhiteRook2.count; i++ {
				if extraWhiteRook2[i].count != 0 {
					if CGRectContainsPoint(blackKing.frame, extraWhiteRook2[i][extraWhiteRook2[i].count-1].center) == false{
						for var w = 0; w < extraWhiteRook2[i].count; w++ {
							[extraWhiteRook2[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraBlackRook.count; i++ {
				if extraBlackRook[i].count != 0 {
					if CGRectContainsPoint(whiteKing.frame, extraBlackRook[i][extraBlackRook[i].count-1].center) == false{
						for var w = 0; w < extraBlackRook[i].count; w++ {
							[extraBlackRook[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			for var i = 0; i < extraBlackRook2.count; i++ {
				if extraBlackRook2[i].count != 0 {
					if CGRectContainsPoint(whiteKing.frame, extraBlackRook2[i][extraBlackRook2[i].count-1].center) == false{
						for var w = 0; w < extraBlackRook2[i].count; w++ {
							[extraBlackRook2[i][w] .removeFromSuperview()]
							
						}
					}
				}
			}
			
			
		}
			
		else {
			var positionx = selectedPiece.frame.origin.x
			var positiony = selectedPiece.frame.origin.y
			positiony +=  moveByAmounty / 10
			positionx += moveByAmountx / 10
			selectedPiece.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
			removeWhiteDangerOptions()
			removeWhiteQueenDanger()
			removeWhiteBishopDanger()
			removeWhiteBishopDanger2()
			removeWhiteRookDanger()
			removeWhiteRookDanger2()
			removeBlackDangerOptions()
			removeBlackQueenDanger()
			removeBlackBishopDanger()
			removeBlackBishopDanger2()
			removeBlackRookDanger()
			removeBlackRookDanger2()
			removeBlackExtraQueenDanger()
			removeWhiteExtraQueenDanger()
			removeWhiteExtraBishopDanger()
			removeWhiteExtraBishopDanger2()
			removeBlackExtraBishopDanger()
			removeBlackExtraBishopDanger2()
			removeExtraWhiteRook()
			removeExtraWhiteRook2()
			removeExtraBlackRook()
			removeExtraBlackRook2()
			moveAllowed = true
			moveAllowed2 = true
			moveAllowed3 = true
			moveAllowed4 = true
			moveAllowed5 = true
			check = false
			checkBlack = false
			int = 0
			show = true
			canTake = true
			canTakeBlack = true
			for var i = 0; i < dangerPieces.count; i++ {
				dangerPieces[i].removeFromSuperview()
				dangerPieces.removeAtIndex(i)
			}
			for var i = 0; i < extraPieces.count; i++ {
				extraPieces[i].removeFromSuperview()
				extraPieces.removeAtIndex(i)
			}
			for var i = 0; i < extraPiecesBlack.count; i++ {
				extraPiecesBlack[i].removeFromSuperview()
				extraPiecesBlack.removeAtIndex(i)
			}
		}
		
	}
	func contains(var _imageArray:Array<UIImageView>, _image: UIImageView) -> Bool {
		
		var bool = false
		for var i = 0; i < _imageArray.count; i++ {
			
			if (_imageArray[i].image == _image.image) {
				bool = true
			}
		}
		
		return bool
	}
	
	func containsDanger(var array: Array<UIImageView>, image: UIImageView) -> Bool {
		
		var bool = false
		for var o = 0 ; o < array.count; o++ {
			if CGRectContainsPoint(array[o].frame, image.center) {
				bool = true
			}
		}
		
		return bool
	}
	
	func containsLabel(var _labelArray:Array<UILabel>, _label: UILabel) -> Bool {
		
		var bool = false
		for var i = 0; i < _labelArray.count; i++ {
			
			if (_labelArray[i] == _label) {
				bool = true
			}
		}
		
		return bool
	}
	
	// MARK: - Touches began! 👆
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		let touch =  touches.first as UITouch!
		
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
				whitePawnSelected(event!, _touch: touch)
				selectedPawn = i
				
			}
			
		}
		// Promote white pawn if it reaches _8 row
		for var p = 0 ; p < pieceOptions.count ; p++ {
			if touch.view == pieceOptions[p] {
				for var i = 0; i < whitePawns.count-1; i++ {
					if selectedPiece == whitePawns[i] && selectedPiece.frame.origin.y == _7 {
						whitePawns.removeAtIndex(i)
						print(i)
						let actionSheet = UIAlertController(title: nil, message: "Promote pawn to:", preferredStyle: UIAlertControllerStyle.ActionSheet)
					
						let promoteToQueen = UIAlertAction(title: "Queen", style: .Default, handler: {
							(alert: UIAlertAction!) -> Void in
							selectedPiece.image = UIImage(named:"whiteQueen")
							whiteQueens += [selectedPiece]
						})
						let promoteToRook = UIAlertAction(title: "Rook", style: .Default, handler: {
							(alert: UIAlertAction!) -> Void in
							selectedPiece.image = UIImage(named:"whiteRook")
							whiteRooks += [selectedPiece]
						})
						let promoteToBishop = UIAlertAction(title: "Bishop", style: .Default, handler: {
							(alert: UIAlertAction!) -> Void in
							selectedPiece.image = UIImage(named:"whiteBishop")
							whiteBishops += [selectedPiece]
						})
						let promoteToKnight = UIAlertAction(title: "Knight", style: .Default, handler: {
							(alert: UIAlertAction!) -> Void in
							selectedPiece.image = UIImage(named:"whiteKnight")
							whiteKnights += [selectedPiece]
						})
						
						actionSheet.addAction(promoteToQueen)
						actionSheet.addAction(promoteToRook)
						actionSheet.addAction(promoteToBishop)
						actionSheet.addAction(promoteToKnight)
						self.presentViewController(actionSheet, animated: true, completion: nil)
					}
				}
			}
			// Promote black pawn if it reaches _1 row
			if touch.view == pieceOptions[p] {
				for var i = 0; i < blackPawns.count-1; i++ {
					if selectedPiece == blackPawns[i] && selectedPiece.frame.origin.y == _2 {
						blackPawns.removeAtIndex(i)
						let actionSheet = UIAlertController(title: nil, message: "Promote pawn to:", preferredStyle: UIAlertControllerStyle.ActionSheet)
						
						let promoteToQueen = UIAlertAction(title: "Queen", style: .Default, handler: {
							(alert: UIAlertAction!) -> Void in
							selectedPiece.image = UIImage(named:"blackQueen")
							blackQueens += [selectedPiece]
						})
						let promoteToRook = UIAlertAction(title: "Rook", style: .Default, handler: {
							(alert: UIAlertAction!) -> Void in
							selectedPiece.image = UIImage(named:"blackRook")
							blackRooks += [selectedPiece]
						})
						let promoteToBishop = UIAlertAction(title: "Bishop", style: .Default, handler: {
							(alert: UIAlertAction!) -> Void in
							selectedPiece.image = UIImage(named:"blackBishop")
							blackBishops += [selectedPiece]
						})
						let promoteToKnight = UIAlertAction(title: "Knight", style: .Default, handler: {
							(alert: UIAlertAction!) -> Void in
							selectedPiece.image = UIImage(named:"blackKnight")
							blackKnights += [selectedPiece]
						})
						
						actionSheet.addAction(promoteToQueen)
						actionSheet.addAction(promoteToRook)
						actionSheet.addAction(promoteToBishop)
						actionSheet.addAction(promoteToKnight)
						self.presentViewController(actionSheet, animated: true, completion: nil)
					}
				}
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
							if (pieceOptions[o].frame.origin.x == xAxisArr[t] && pieceOptions[o].frame.origin.y == yAxisArr[g] && touch.view == pieceOptions[o] && selectedPiece == pieces[i]) {
								print(xAxisArrStr[t] + yAxisArrStr[g])
								if (num < 3) {
									move = num + 1
									whiteMoves[num].text = (move.description + ".   " ) + xAxisArrStr[t] + yAxisArrStr[g]
									whiteMoves[num].textColor = UIColor .whiteColor()
									whiteMoves[num].font = UIFont(name: "CaviarDreams", size: 20)
									self.view.addSubview(whiteMoves[num])
									num+=1
								} else {
									whiteMoves[0].text = whiteMoves[1].text
									whiteMoves[1].text = whiteMoves[2].text
									move += 1
									whiteMoves[2].text = (move.description + ".   " ) + xAxisArrStr[t] + yAxisArrStr[g]
									if (move > 9) {
										whiteMoves[2].frame = (frame: CGRectMake(pieceSize * 5.8, screenHeight / 1.3 + CGFloat(2) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
										print("working")
									}
									if (move > 10) {
										whiteMoves[1].frame = (frame: CGRectMake(pieceSize * 5.8, screenHeight / 1.3 + CGFloat(1) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
										whiteMoves[2].frame = (frame: CGRectMake(pieceSize * 5.8, screenHeight / 1.3 + CGFloat(2) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
									}
									if (move > 11) {
										whiteMoves[0].frame = (frame: CGRectMake(pieceSize * 5.8, screenHeight / 1.3 + CGFloat(0) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
										whiteMoves[1].frame = (frame: CGRectMake(pieceSize * 5.8, screenHeight / 1.3 + CGFloat(1) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
										whiteMoves[2].frame = (frame: CGRectMake(pieceSize * 5.8, screenHeight / 1.3 + CGFloat(2) * pieceSize * 0.4, pieceSize * 2, pieceSize * 2))
									}
								}
								
							}
						}
					}
				}
				
				for var i = 0; i < pieces.count; i++ {
					if touch.view == pieceOptions[o] && pieceOptions[o].frame.origin.x == pieces[i].frame.origin.x && pieceOptions[o].frame.origin.y == pieces[i].frame.origin.y  {
						pieceToTake = pieces[i]
						pieces[i].removeFromSuperview()
						pieces.removeAtIndex(i)
						
						if (pieceToTake == whiteBishop1) {
							bishopShowDanger = false
						}
						if (pieceToTake == whiteBishop2) {
							bishopShowDanger2 = false
						}
						if (pieceToTake == whiteQueen) {
							queenShowDanger = false
						}
						if (pieceToTake == whiteRook1) {
							rookShowDanger = false
						}
						if (pieceToTake == whiteRook2) {
							rookShowDanger2 = false
						}
						if (pieceToTake == whiteKnight1) {
							knightShowDanger = false
						}
						if (pieceToTake == whiteKnight2) {
							knightShowDanger2 = false
						}
						if pieceToTake == whitePawn1 {
							pawnShowDanger1 = false
						}
						if pieceToTake == whitePawn2 {
							pawnShowDanger2 = false
						}
						if pieceToTake == whitePawn3 {
							pawnShowDanger3 = false
						}
						if pieceToTake == whitePawn4 {
							pawnShowDanger4 = false
						}
						if pieceToTake == whitePawn5 {
							pawnShowDanger5 = false
						}
						if pieceToTake == whitePawn6 {
							pawnShowDanger6 = false
						}
						if pieceToTake == whitePawn7 {
							pawnShowDanger7 = false
						}
						if pieceToTake == whitePawn8 {
							pawnShowDanger8 = false
						}
						
						if pieceToTake == blackPawn1 {
							pawnShowDanger1 = false
						}
						if pieceToTake == blackPawn2 {
							pawnBShowDanger2 = false
						}
						if pieceToTake == blackPawn3 {
							pawnBShowDanger3 = false
						}
						if pieceToTake == blackPawn4 {
							pawnBShowDanger4 = false
						}
						if pieceToTake == blackPawn5 {
							pawnBShowDanger5 = false
						}
						if pieceToTake == blackPawn6 {
							pawnBShowDanger6 = false
						}
						if pieceToTake == blackPawn7 {
							pawnBShowDanger7 = false
						}
						if pieceToTake == blackPawn8 {
							pawnBShowDanger8 = false
						}
						if pieceToTake == blackBishop1 {
							bishopBShowDanger = false
						}
						if pieceToTake == blackBishop2 {
							bishopBShowDanger2 = false
						}
						if pieceToTake == blackRook1 {
							rookBShowDanger = false
						}
						if pieceToTake == blackRook2 {
							rookBShowDanger2 = false
						}
						if pieceToTake == blackKnight1 {
							knightBShowDanger = false
						}
						if pieceToTake == blackKnight2 {
							knightBShowDanger2 = false
						}
						if pieceToTake == blackQueen {
							queenBShowDanger = false
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
								takenPiecesLbl[i].font = UIFont(name: "CaviarDreams", size: 18)
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
				whiteKnightSelected(event!, _touch: touch)
			}
		}
		
		for var i = 0; i < whiteBishops.count; i++ {
			if touch.view == whiteBishops[i] && isWhiteTurn == true {
				selectedPiece = whiteBishops[i]
				removePieceOptions()
				whiteBishopSelected(event!, _touch: touch)
			}
		}
		
		for var i = 0; i < whiteRooks.count;i++ {
			if touch.view == whiteRooks[i] && isWhiteTurn == true {
				removePieceOptions()
				selectedPiece = whiteRooks[i]
				whiteRookSelected(event!, _touch: touch)
			}
		}
	for var i = 0; i < whiteQueens.count;i++ {
		if touch.view == whiteQueens[i] && isWhiteTurn == true {
			selectedPiece = whiteQueens[i]
			removePieceOptions()
			whiteQueenSelected(event!, _touch: touch)
		}
		}
		
		if touch.view == whiteKing && isWhiteTurn == true {
			selectedPiece = whiteKing
			removePieceOptions()
			whiteKingSelected(event!, _touch: touch)
		}
		
		
		for var i = 0; i < blackPawns.count;i++ {
			if touch.view == blackPawns[i] && isWhiteTurn == false {
				selectedPiece = blackPawns[i]
				removePieceOptions()
				blackPawnSelected(event!, _touch: touch)
			}
		}
		
		for var i = 0; i < blackBishops.count;i++ {
			if touch.view == blackBishops[i] && isWhiteTurn == false {
				selectedPiece = blackBishops[i]
				removePieceOptions()
				blackBishopSelected(event!, _touch: touch)
			}
		}
		
		for var i = 0; i < blackKnights.count;i++ {
			if touch.view == blackKnights[i] && isWhiteTurn == false {
				selectedPiece = blackKnights[i]
				removePieceOptions()
				blackKnightSelected(event!, _touch: touch)
			}
		}
		
		for var i = 0; i < blackRooks.count;i++ {
			if touch.view == blackRooks[i] && isWhiteTurn == false {
				selectedPiece = blackRooks[i]
				removePieceOptions()
				blackRookSelected(event!, _touch: touch)
			}
		}
		
		if touch.view == blackQueen && isWhiteTurn == false {
			selectedPiece = blackQueen
			removePieceOptions()
			blackQueenSelected(event!, _touch: touch)
		}
		
		if touch.view == blackKing && isWhiteTurn == false {
			selectedPiece = blackKing
			removePieceOptions()
			blackKingSelected(event!, _touch: touch)
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