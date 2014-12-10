//
//  ViewController.swift
//  ChessNow
//
//  Created by Johannes Berge on 21/11/14.
//  Copyright (c) 2014 Johannes Berge & Alexander Panayotov. All rights reserved.
//

import UIKit
import SpriteKit

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
var piecePossibilities1 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilities2 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))


//moveOption
var moveOption = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))

//chesspieces:
var whitePawn1 = UIImageView(frame: CGRectMake(0, screenHeight/2 + 2*pieceSize, pieceSize	, pieceSize))

//var state = 0
//var movementLegal: Bool = false
//var moveByAmount: CGFloat = 0.0
var blackPawn1 = UIImageView(frame: CGRectMake(0, screenHeight/2 - 3*pieceSize, pieceSize, pieceSize))



class ViewController: UIViewController {
	
	let objc = Objective_C()

	@IBOutlet weak var chessBoard: UIImageView!

	
override func viewDidLoad() {
	super.viewDidLoad()

	//tab-bar and navigation bar
		var tab = self.tabBarController?.tabBar
		tab?.barStyle = UIBarStyle.Black
		var nav = self.navigationController?.navigationBar
		nav?.barStyle = UIBarStyle.BlackTranslucent
	
	
//	state = 0
	
	
	//load moveOption
	moveOption.image = UIImage(named: "moveOption.png")
	self.view.addSubview(moveOption)
	moveOption.hidden = true

	
	//load markers
	pieceMarked.image = UIImage(named: "pieceMarked.png")
	self.view.addSubview(pieceMarked)
	pieceMarked.hidden = true
	
	piecePossibilities1.image = UIImage(named: "piecePossibilities.png")
	self.view.addSubview(piecePossibilities1)
	piecePossibilities1.hidden = true
	
	piecePossibilities2.image = UIImage(named: "piecePossibilities.png")
	self.view.addSubview(piecePossibilities2)
	piecePossibilities2.hidden = true

	

	
	//chesspieces loading
		whitePawn1.image = UIImage(named: "whitePawn.png")
		self.view.addSubview(whitePawn1)
	whitePawn1.contentMode = .ScaleAspectFit
	
	blackPawn1.image = UIImage(named: "blackPawn.png")
	self.view.addSubview(blackPawn1)
	blackPawn1.contentMode = .ScaleAspectFit
	
        println("\(screenHeight) is the height and \(screenWidth) is the width. \(screenSize) is the screensize")
	whitePawn1.userInteractionEnabled = true;
	whitePawn1.multipleTouchEnabled = true;
	
    }


    @IBAction func button(sender: AnyObject)
	{
		pieceMarked.hidden = true
		movementTimer.invalidate()
		timerNumber = 0
		movementTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateMovementTimer"), userInfo: nil, repeats: true)
    }

	
	func updateMovementTimer() {
		timerNumber++
		if timerNumber > 10 {
			movementTimer.invalidate()
			
		}
			
		else {
		var positionx = whitePawn1.frame.origin.x
		var positiony = whitePawn1.frame.origin.y
//		println("\(positiony)")
//		positiony -= screenWidth  / 8 * moveByAmount
		whitePawn1.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
		
		}

}
	
//	func TestMovement() {
//		
//		if state == 0 {
//			moveByAmount = 0.2
//			movementLegal = true
//			moveOption.frame = CGRect(x: whitePawn1.frame.origin.x, y: whitePawn1.frame.origin.y - screenWidth  / 8 * 2, width: pieceSize, height: pieceSize)
//			
//		} else {
//			moveByAmount = 0.1
//			movementLegal = true
//			moveOption.frame = CGRect(x: whitePawn1.frame.origin.x, y: whitePawn1.frame.origin.y - screenWidth  / 8 * 1, width: pieceSize, height: pieceSize)
//		}
//	}
	
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		let touch :UITouch = event.allTouches()?.anyObject() as UITouch
		
		if touch.view == whitePawn1 {//nøkkelen til suksess

			println("Hey")
			pieceMarked.hidden = false
					pieceMarked.frame = CGRectMake(whitePawn1.frame.origin.x, whitePawn1.frame.origin.y, pieceSize, pieceSize)
//			TestMovement()
//			state = 1;
			
			if whitePawn1.frame.origin.x == 0 && whitePawn1.frame.origin.y == screenHeight/2 + 2 * pieceSize {
				
			piecePossibilities1.frame = CGRectMake(whitePawn1.frame.origin.x, whitePawn1.frame.origin.y - pieceSize, pieceSize, pieceSize)
			piecePossibilities2.frame = CGRectMake(whitePawn1.frame.origin.x, whitePawn1.frame.origin.y - 2*pieceSize, pieceSize, pieceSize)
				
			piecePossibilities1.hidden = false
			piecePossibilities2.hidden = false

			
			
			}
			
		}
		
//		if movementLegal == true {
//			moveOption.hidden = false;
//		}

	}

	
}
