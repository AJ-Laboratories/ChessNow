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

//chesspieces:
var whitePawn1 = UIImageView(frame: CGRectMake(0, screenHeight/2 + 2*pieceSize, pieceSize	, pieceSize))



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
	
	
	//chesspieces loading
		whitePawn1.image = UIImage(named: "whitePawn.png")
		self.view.addSubview(whitePawn1)
	
        println("\(screenHeight) is the height and \(screenWidth) is the width. \(screenSize) is the screensize")
        
    }


    @IBAction func button(sender: AnyObject)
	{
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
		println("\(positiony)")
		positiony -= screenWidth  / 8 * 0.1
		whitePawn1.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
		
		}

}
	/*
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		let touch :UITouch = event.allTouches()?.anyObject() as UITouch
		
		if ( touch.view == whitePawn1) {
			println("Hey")
		}

	}
*/
	
}
