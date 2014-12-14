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
var a:CGFloat = 0
var b =  pieceSize
var c = 2 * pieceSize
var d = 3 * pieceSize
var e = 4 * pieceSize
var f = 5 * pieceSize
var g = 6 * pieceSize
var h = 7 * pieceSize
 
//y-Axis coordinates
var _1 = screenHeight/2 + 3 * pieceSize
var _2 = screenHeight/2 + 2 * pieceSize
var _3 = screenHeight/2 + 1 * pieceSize
var _4 = screenHeight/2
var _5 = screenHeight/2 - 1 * pieceSize
var _6 = screenHeight/2 - 2 * pieceSize
var _7 = screenHeight/2 - 3 * pieceSize
var _8 = screenHeight/2 - 4 * pieceSize
 
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

//piecePossibility
var piecePossibilityPawn1 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityPawn2 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityPawn3 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityPawn4 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityPawn5 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))

var piecePossibilityKnight1 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityKnight2 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityKnight3 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityKnight4 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityKnight5 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityKnight6 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityKnight7 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilityKnight8 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
 
var piecePossibilitiesPawn = [piecePossibilityPawn1,piecePossibilityPawn2,piecePossibilityPawn3,piecePossibilityPawn4,piecePossibilityPawn5]

var piecePossibilitiesKnight = [piecePossibilityKnight1,piecePossibilityKnight2,piecePossibilityKnight3]

var piecePossibilities = [piecePossibilitiesKnight,piecePossibilitiesPawn]
 
 
//moveOption
var moveOption = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var player1 = 0
var player2 = 0;
 
//chesspieces:
var whitePawn1 = UIImageView(frame: CGRectMake(a, _2, pieceSize , pieceSize))
var whitePawn2 = UIImageView(frame: CGRectMake(b, _2, pieceSize, pieceSize))
 
var blackPawn1 = UIImageView(frame: CGRectMake(0, screenHeight/2 - 3*pieceSize, pieceSize, pieceSize))

var whiteKnight1 = UIImageView(frame: CGRectMake(b, _1, pieceSize, pieceSize))

var whitePawns : [UIImageView] = [whitePawn1, whitePawn2]
var blackPawns : [UIImageView] = [blackPawn1]
var whiteKnights = [whiteKnight1]

//bool to check if pieces are "alive"
var whitePawn1Alive = true
var whitePawn2Alive = true
var blackPawn1Alive = true

var moveByAmounty: CGFloat = 0.0
var moveByAmountx: CGFloat = 0.0
 
 
var selectedPiece: UIImageView = whitePawn1

var eatenPieces : UIImageView = whitePawn1

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
			
			// load piecePossibilities
			for var pPP = 0; pPP < piecePossibilitiesPawn.count; pPP++ {
				
				piecePossibilitiesPawn[pPP].userInteractionEnabled = true
				piecePossibilitiesPawn[pPP].multipleTouchEnabled = true
				
				piecePossibilitiesPawn[pPP].image = UIImage(named: "piecePossibilities.png")
				self.view.addSubview(piecePossibilitiesPawn[pPP])
				piecePossibilitiesPawn[pPP].hidden = true
				
			}
			
			for var pPN = 0; pPN < piecePossibilitiesKnight.count; pPN++ {
				
				piecePossibilitiesKnight[pPN].userInteractionEnabled = true
				piecePossibilitiesKnight[pPN].multipleTouchEnabled = true
				
				piecePossibilitiesKnight[pPN].image = UIImage(named: "piecePossibilities.png")
				self.view.addSubview(piecePossibilitiesKnight[pPN])
				piecePossibilitiesKnight[pPN].hidden = true
				
			}
			

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
			
				eatenPieces.hidden = true
			
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
		hideAllPiecepossibilities()
		moveByAmountx = _moveByAmountx
		moveByAmounty = _moveByAmounty
		movementTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateMovementTimer"), userInfo: nil, repeats: true)
	}
	
	func hideAllPiecepossibilities() {
		
		for var pPP = 0; pPP < piecePossibilitiesPawn.count; pPP++ {
		piecePossibilitiesPawn[pPP].hidden = true
		}
		
		for var pPN = 0; pPN < piecePossibilitiesKnight.count; pPN++ {
			piecePossibilitiesKnight[pPN].hidden = true
		}
		pieceMarked.hidden = true
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
                        positiony -= screenWidth  / 8 * moveByAmounty
                        positionx += screenWidth / 8 * moveByAmountx
                        selectedPiece.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
                       
                }
        }
       
        override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
               
                let touch :UITouch = event.allTouches()?.anyObject() as UITouch
               
               
                for var i = 0; i < whitePawns.count;i++ {
                       
                       
                        if touch.view == whitePawns[i] {//nøkkelen til suksess
                               
                                selectedPiece = whitePawns[i]
                                player1 = 1
                                player2 = 0
                                pieceMarked.hidden = false
                                pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
                               
                                for var t = 0; t < blackPawns.count; t++ {
                                       
                                        switch blackPawns[t].frame {
                                               
                                        case  (CGRectMake(pieceMarked.frame.origin.x + pieceSize, pieceMarked.frame.origin.y - pieceSize, pieceSize, pieceSize)):
                                               
                                                piecePossibilityPawn3.frame = CGRectMake(selectedPiece.frame.origin.x + pieceSize, selectedPiece.frame.origin.y - pieceSize, pieceSize, pieceSize)
                                                piecePossibilityPawn3.hidden = false
                                               
                                               
                                        case (CGRectMake(pieceMarked.frame.origin.x - pieceSize, pieceMarked.frame.origin.y - pieceSize , pieceSize, pieceSize)):
                                               
                                                piecePossibilityPawn4.frame = CGRectMake(selectedPiece.frame.origin.x - pieceSize, selectedPiece.frame.origin.y - pieceSize, pieceSize, pieceSize)
                                                piecePossibilityPawn4.hidden = false
                                        default :
                                                ""
                                        }
                                }
                               
                                if selectedPiece.frame.origin.y == _2 {
                                        piecePossibilityPawn1.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - pieceSize, pieceSize, pieceSize)
                                        piecePossibilityPawn2.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - 2*pieceSize, pieceSize, pieceSize)
                                       
                                        piecePossibilityPawn1.hidden = false
                                        piecePossibilityPawn2.hidden = false
                                       
                                }
                                       
								else {
                                        piecePossibilityPawn1.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y - pieceSize, pieceSize, pieceSize)

                                        piecePossibilityPawn1.hidden = false
                                       
                                }
                        }
                }
               
                for var i = 0; i < blackPawns.count;i++ {
                       
                       
                        if touch.view == blackPawns[i] {//nøkkelen til suksess
                               
                                selectedPiece = blackPawns[i]
                               
                               
                                player2 = 1
                                player1 = 0
                                pieceMarked.hidden = false
                                pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
                               
                                if selectedPiece.frame.origin.y == _7 {
                                        piecePossibilityPawn1.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + pieceSize, pieceSize, pieceSize)
                                        piecePossibilityPawn2.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + 2*pieceSize, pieceSize, pieceSize)
                                        piecePossibilityPawn1.hidden = false
                                        piecePossibilityPawn2.hidden = false
                                       
                                }
                                       
                                else {
                                        piecePossibilityPawn1.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y + pieceSize, pieceSize, pieceSize)
                                       
                                        piecePossibilityPawn1.hidden = false
                                       
                                }
                        }
                }
               
                if touch.view == piecePossibilityPawn1  && player1 == 1 {
						movePiece(0, _moveByAmounty: 0.1)
                }
                else if touch.view == piecePossibilityPawn1  && player2 == 1 {
						movePiece(0, _moveByAmounty: -0.1)
                }

                if touch.view == piecePossibilityPawn2 && player1 == 1 {
						movePiece(0, _moveByAmounty: 0.2)
                }
				else if touch.view == piecePossibilityPawn2 && player2 == 1 {
						movePiece(0, _moveByAmounty: -0.2)
					
                }
                if touch.view == piecePossibilityPawn4  && player1 == 1 {
						resetTimer()
						for var i = 0; i < piecePossibilitiesPawn.count; i++ {
						piecePossibilitiesPawn[i].hidden = true
						}
						blackPawn1.hidden = true
                        pieceMarked.hidden = true
                        moveByAmounty = 0.1
                        moveByAmountx = -0.1
                        movementTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateMovementTimer"), userInfo: nil, repeats: true)
					
					eatenPieces.image = UIImage(named: "blackPawn.png")
					eatenPieces.frame = CGRectMake(a+5 , screenHeight/2 + 4.4 * pieceSize, pieceSize/1.4, pieceSize/1.4)
					eatenPieces.hidden = false
                }

	if touch.view == whiteKnight1 {
				player1 = 2
				selectedPiece = whiteKnight1
				println("hello")
				pieceMarked.hidden = false
				pieceMarked.frame = CGRectMake(selectedPiece.frame.origin.x, selectedPiece.frame.origin.y, pieceSize, pieceSize)
				
				if selectedPiece.frame.origin.y == _1 {
					piecePossibilityKnight1.frame = CGRectMake(selectedPiece.frame.origin.x + pieceSize, selectedPiece.frame.origin.y - 2*pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight2.frame = CGRectMake(selectedPiece.frame.origin.x - pieceSize, selectedPiece.frame.origin.y - 2*pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight1.hidden = false
					piecePossibilityKnight2.hidden = false
					
				} else {
					
					piecePossibilityKnight1.frame = CGRectMake(selectedPiece.frame.origin.x + pieceSize, selectedPiece.frame.origin.y - 2*pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight2.frame = CGRectMake(selectedPiece.frame.origin.x - pieceSize, selectedPiece.frame.origin.y - 2*pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight3.frame = CGRectMake(selectedPiece.frame.origin.x + 2*pieceSize, selectedPiece.frame.origin.y - pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight4.frame = CGRectMake(selectedPiece.frame.origin.x + 2*pieceSize, selectedPiece.frame.origin.y + pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight5.frame = CGRectMake(selectedPiece.frame.origin.x - 2*pieceSize, selectedPiece.frame.origin.y - pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight6.frame = CGRectMake(selectedPiece.frame.origin.x - 2*pieceSize, selectedPiece.frame.origin.y + pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight7.frame = CGRectMake(selectedPiece.frame.origin.x - pieceSize, selectedPiece.frame.origin.y + 2*pieceSize, pieceSize, pieceSize)
					piecePossibilityKnight8.frame = CGRectMake(selectedPiece.frame.origin.x + pieceSize, selectedPiece.frame.origin.y + 2*pieceSize, pieceSize, pieceSize)
					
					for var i = 0; i < piecePossibilitiesKnight.count; i++ {
					piecePossibilitiesKnight[i].hidden = false
					}
					
				}
				if selectedPiece.frame.origin.y == _2 {
					piecePossibilityKnight7.hidden = true
					piecePossibilityKnight8.hidden = true
				}
				if selectedPiece.frame.origin.y == _7 {
					piecePossibilityKnight1.hidden = true
					piecePossibilityKnight2.hidden = true
				}
				if selectedPiece.frame.origin.y == _8 {
					piecePossibilityKnight1.hidden = true
					piecePossibilityKnight2.hidden = true
					piecePossibilityKnight3.hidden = true
					piecePossibilityKnight5.hidden = true
				}
				
			}
			
			if touch.view == piecePossibilityKnight1 && player1 == 2 {
				movePiece(0.1, _moveByAmounty: 0.2)
			}
			
			if touch.view == piecePossibilityKnight2 && player1 == 2 {
				movePiece(-0.1, _moveByAmounty: 0.2)
			}

			if touch.view == piecePossibilityKnight3 && player1 == 2 {
				movePiece(0.2, _moveByAmounty: 0.1)
			}
			
			if touch.view == piecePossibilityKnight4 && player1 == 2 {
				movePiece(0.2, _moveByAmounty: -0.1)
			}
	
			if touch.view == piecePossibilityKnight5 && player1 == 2 {
				movePiece(-0.2, _moveByAmounty: 0.1)
			}
			
			if touch.view == piecePossibilityKnight6 && player1 == 2 {
				movePiece(-0.2, _moveByAmounty: -0.1)
			}
			if touch.view == piecePossibilityKnight7 && player1 == 2 {
				movePiece(-0.1,_moveByAmounty: -0.2)
			}
			if touch.view == piecePossibilityKnight8 && player1 == 2 {
				movePiece(0.1, _moveByAmounty: -0.2)
			}
			
        }

}