//
//  ViewController.swift
//  ChessNow
//
//  Created by Johannes Berge on 21/11/14.
//  Copyright (c) 2014 Johannes Berge & Alexander Panayotov. All rights reserved.
//

import UIKit
import SpriteKit

var a1x:CGFloat = 0
var a1y = screenHeight/2 + 3*pieceSize
var a2x:CGFloat = 0
var a2y = screenHeight/2 + 2*pieceSize
var a3x:CGFloat = 0

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
var piecePossibilities1 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))
var piecePossibilities2 = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))


//moveOption
var moveOption = UIImageView(frame: CGRectMake(0, 0, pieceSize, pieceSize))

//chesspieces:
var whitePawn1 = UIImageView(frame: CGRectMake(b, _2, pieceSize	, pieceSize))

//var state = 0
//var movementLegal: Bool = false
var moveByAmount: CGFloat = 0.0
var blackPawn1 = UIImageView(frame: CGRectMake(0, screenHeight/2 - 3*pieceSize, pieceSize, pieceSize))



class ViewController: UIViewController {
	
	let objc = Objective_C()

	@IBOutlet weak var chessBoard: UIImageView!

	
override func viewDidLoad() {
	super.viewDidLoad()

	
	println("a1y is \(a1y)")
	//tab-bar and navigation bar
		var tab = self.tabBarController?.tabBar
		tab?.barStyle = UIBarStyle.Black
		var nav = self.navigationController?.navigationBar
		nav?.barStyle = UIBarStyle.BlackTranslucent
	
	
	
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

	piecePossibilities1.userInteractionEnabled = true;
	piecePossibilities1.multipleTouchEnabled = true;
	piecePossibilities2.userInteractionEnabled = true;
	piecePossibilities2.multipleTouchEnabled = true;

	
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
//		var piece: UIImageView = timer.userInfo! as UIImageView
		timerNumber++
		if timerNumber > 10 {
			movementTimer.invalidate()
			
		}
			
		else {
		var positionx = whitePawn1.frame.origin.x
		var positiony = whitePawn1.frame.origin.y
		println("\(positiony)")
		positiony -= screenWidth  / 8 * moveByAmount
		whitePawn1.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
		
		}

}
	

	
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		let touch :UITouch = event.allTouches()?.anyObject() as UITouch
		
		var piece:UIImageView
		
		if touch.view == whitePawn1 {//nøkkelen til suksess

			piece = whitePawn1
			
			println("Hey")
			pieceMarked.hidden = false
					pieceMarked.frame = CGRectMake(whitePawn1.frame.origin.x, whitePawn1.frame.origin.y, pieceSize, pieceSize)

			
			if whitePawn1.frame.origin.y == _2 {
				
			piecePossibilities1.frame = CGRectMake(whitePawn1.frame.origin.x, whitePawn1.frame.origin.y - pieceSize, pieceSize, pieceSize)
			piecePossibilities2.frame = CGRectMake(whitePawn1.frame.origin.x, whitePawn1.frame.origin.y - 2*pieceSize, pieceSize, pieceSize)
				
			piecePossibilities1.hidden = false
			piecePossibilities2.hidden = false

			
			}
			else {
				
				piecePossibilities1.frame = CGRectMake(whitePawn1.frame.origin.x, whitePawn1.frame.origin.y - pieceSize, pieceSize, pieceSize)
				
				piecePossibilities1.hidden = false
			}
			
			
		}
		
		if touch.view == piecePossibilities1 {
			movementTimer.invalidate()
			timerNumber = 0
			piecePossibilities1.hidden = true;
			piecePossibilities2.hidden = true;
			pieceMarked.hidden  = true
			moveByAmount = 0.1;
			movementTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateMovementTimer"), userInfo: nil, repeats: true)
		}
		
		else if touch.view == piecePossibilities2 {
			movementTimer.invalidate()
			timerNumber = 0
			piecePossibilities2.hidden = true;
			piecePossibilities1.hidden = true;
			pieceMarked.hidden  = true
			moveByAmount = 0.2;
			movementTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateMovementTimer"), userInfo: nil, repeats: true)
			
		}
//		if movementLegal == true {
//			moveOption.hidden = false;
//		}

	}

	
}
