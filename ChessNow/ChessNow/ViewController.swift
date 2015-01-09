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
let a:CGFloat = 0
let b =  pieceSize
let c = 2 * pieceSize
let d = 3 * pieceSize
let e = 4 * pieceSize
let f = 5 * pieceSize
let g = 6 * pieceSize
let h = 7 * pieceSize


//y-Axis coordinates
let _1 = screenHeight/2 + 3 * pieceSize
let _2 = screenHeight/2 + 2 * pieceSize
let _3 = screenHeight/2 + 1 * pieceSize
let _4 = screenHeight/2
let _5 = screenHeight/2 - 1 * pieceSize
let _6 = screenHeight/2 - 2 * pieceSize
let _7 = screenHeight/2 - 3 * pieceSize
let _8 = screenHeight/2 - 4 * pieceSize



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

var blackPawn1 = UIImageView(frame: CGRectMake(f, _4, pieceSize, pieceSize))
var blackPawn2 = UIImageView(frame: CGRectMake(a, _7, pieceSize, pieceSize))
var blackPawn3 = UIImageView(frame: CGRectMake(c, _7, pieceSize, pieceSize))

var whiteKnight1 = UIImageView(frame: CGRectMake(b, _1, pieceSize, pieceSize))
var whiteBishop1 = UIImageView(frame: CGRectMake(c, _1, pieceSize, pieceSize))

var whitePawns  = [whitePawn1, whitePawn2]
var blackPawns = [blackPawn1, blackPawn2, blackPawn3]
var whiteKnights = [whiteKnight1]
var whiteBishops = [whiteBishop1]

var blackPieces = [blackPawn1, blackPawn2, blackPawn3]
var whitePieces = [whitePawn1,whitePawn2,whiteKnight1,whiteBishop1]
var pieces = [whitePawn1,whitePawn2,whiteKnight1,whiteBishop1,blackPawn1]

//bool to check if pieces are "alive"
var whitePawn1Alive = true
var whitePawn2Alive = true
var blackPawn1Alive = true

var moveByAmounty: CGFloat = 0.0
var moveByAmountx: CGFloat = 0.0

var selectedPiece: UIImageView = whitePawn1


//? why whitePawn1?  *Because it needs to be instantiated
var eatenPieces : UIImageView = whitePawn1
var pieceCanTake : UIImageView = whitePawn1
var pieceToTake : UIImageView = whitePawn1
var canTake : Bool = false

var pawnState = 0
var movementallowed: CGFloat = 2

class ViewController: UIViewController {
	
	let objc = Objective_C()
	
	@IBOutlet weak var chessBoard: UIImageView!
	
	
	override func viewDidLoad() {
		
		
		super.viewDidLoad()
		
		
		//tab-bar and navigation bar
		self.tabBarController?.tabBar.hidden = true
		var nav = self.navigationController?.navigationBar
		nav?.barStyle = UIBarStyle.BlackTranslucent
		
		
		//load marker
		pieceMarked.image = UIImage(named: "pieceMarked.png")
		self.view.addSubview(pieceMarked)
		pieceMarked.hidden = true
		
		
		//chesspieces loading
		
		for var wp = 0; wp < whitePawns.count; wp++ {
			whitePawns[wp].image = UIImage(named: "whitePawn.png")
			self.view.addSubview(whitePawns[wp])
			whitePawns[wp].contentMode = .ScaleAspectFit
			whitePawns[wp].userInteractionEnabled = true
			whitePawns[wp].multipleTouchEnabled = true
		}
		
		for var bp = 0; bp < blackPawns.count; bp++ {
			blackPawns[bp].image = UIImage(named: "blackPawn.png")
			self.view.addSubview(blackPawns[bp])
			blackPawns[bp].contentMode = .ScaleAspectFit
			blackPawns[bp].userInteractionEnabled = true
			blackPawns[bp].multipleTouchEnabled = true
		}
		
		for var wn = 0; wn < whiteKnights.count; wn++ {
			whiteKnights[wn].image = UIImage(named: "whiteKnight.png")
			self.view.addSubview(whiteKnights[wn])
			whiteKnights[wn].contentMode = .ScaleAspectFit
			whiteKnights[wn].userInteractionEnabled = true
			whiteKnights[wn].multipleTouchEnabled = true
		}
		
		
		for var wb = 0; wb < whiteBishops.count; wb++ {
			whiteBishops[wb].image = UIImage(named: "whiteBishop.png")
			self.view.addSubview(whiteBishops[wb])
			whiteBishops[wb].contentMode = .ScaleAspectFit
			whiteBishops[wb].userInteractionEnabled = true
			whiteBishops[wb].multipleTouchEnabled = true
		}
		
		
		println("\(screenHeight) is the height and \(screenWidth) is the width. \(screenSize) is the screensize")
		
	}
	
	override func prefersStatusBarHidden() -> Bool {
		return true
	}
	
	override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
		return UIStatusBarAnimation.Slide
	}
	
	func movePiece(var _moveByAmountx:CGFloat,var _moveByAmounty:CGFloat) {
		resetTimer()
		hidePieceOptions()
		moveByAmountx = _moveByAmountx
		moveByAmounty = _moveByAmounty
		movementTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateMovementTimer"), userInfo: nil, repeats: true)
	}
	
	func whiteBishopSelected(var _event:UIEvent, var _touch:UITouch) {
		
		println(pieceSize)
		
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
		}
		
		letThemAppear(1, 1, 1, 1)
		letThemAppear(1,-1,1,-1)
		letThemAppear(-1,1,-1,1)
		letThemAppear(-1,-1,-1,-1)
	}
	
	func whitePawnSelected(var _event:UIEvent, var _touch:UITouch) {
		
		func letThemAppear(var byAmountx:CGFloat, 	var byAmounty:CGFloat, var increaserx:CGFloat, var increasery:CGFloat) {
			var canThePieceGofurther: Bool = true
			
			for var t = 0; t < whitePawns.count; t++ {
				
				if whitePawns[t].frame.origin.x == selectedPiece.frame.origin.x && whitePawns[t].frame.origin.y == selectedPiece.frame.origin.y {
					
					for byAmounty;  byAmounty <= 2 ; byAmountx += increaserx, byAmounty += increasery {
						
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
							if blackPieces[r].frame.origin.x == selectedPiece.frame.origin.x - 1 * pieceSize && blackPieces[r].frame.origin.y == selectedPiece.frame.origin.y - 1 * pieceSize && canThePieceGofurther == true {
								
								println("working")
								var pieceOption = UIImageView(frame: CGRectMake(selectedPiece.frame.origin.x - 1 * pieceSize, selectedPiece.frame.origin.y - byAmounty * pieceSize, pieceSize, pieceSize))
								pieceOption.image = UIImage(named: "piecePossibilities.png")
								self.view.addSubview(pieceOption)
								pieceOptions += [pieceOption]
								canThePieceGofurther = false
								
							}
						}
						
					}
					
				}
			}
		println(pieceSize)

		}
		letThemAppear(1, 1, 1, 1)
		letThemAppear(-1, 1, 1, 1)
	}
	
	
	
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
			println("\(positiony)")
			positiony +=  moveByAmounty / 10
			positionx += moveByAmountx / 10
			selectedPiece.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
			
		}
	}
	
	func hidePieceOptions() {
		for var p = 0 ; p < pieceOptions.count; p++ {
			pieceOptions[p].hidden = true
			pieceMarked.hidden = true
		}
		pieceOptions = []
	}
	
	
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		
		let touch :UITouch = event.allTouches()?.anyObject() as UITouch
		
		for var i = 0; i < whitePawns.count;i++ {
			if touch.view == whitePawns[i] {
				selectedPiece = whitePawns[i]
				whitePawnSelected(event, _touch: touch)
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
				println(pieceSize)
			}
		}
		
		for var o = 0 ; o < pieceOptions.count ; o++ {
			for var t = 0; t < blackPieces.count; t++ {
				
				if touch.view == pieceOptions[o] && pieceOptions[o].frame.origin.x == blackPieces[t].frame.origin.x && pieceOptions[o].frame.origin.y == blackPieces[t].frame.origin.y  {
					blackPieces[t].removeFromSuperview()
					blackPieces.removeAtIndex(t)
				}
				
				
			}
		}
		
		for var i = 0; i < blackPawns.count;i++ {
			if touch.view == blackPawns[i] {

			}
		}
		
		for var i = 0; i < whiteKnights.count;i++ {
			if touch.view == whiteKnights[i] {
				
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