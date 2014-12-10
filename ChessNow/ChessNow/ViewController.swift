//
//  ViewController.swift
//  ChessNow
//
//  Created by Johannes Berge on 21/11/14.
//  Copyright (c) 2014 Johannes Berge & Alexander Panayotov. All rights reserved.
//

import UIKit
import SpriteKit

let screenSize: CGRect = UIScreen.mainScreen().bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let pieceSize = sqrt(screenWidth * screenWidth / 64)



class ViewController: UIViewController {
	
	let objc = Objective_C()

    
    @IBOutlet weak var image1: UIImageView!
	
	@IBOutlet weak var chessBoard: UIImageView!

    @IBAction func button(sender: AnyObject)
	{
        
        var positionx = image1.frame.origin.x
        var positiony = image1.frame.origin.y
		
        image1.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
        positiony -= screenWidth  / 8
		image1.frame = CGRect(x: positionx, y: positiony, width: pieceSize, height: pieceSize)
    }
    
	override func viewDidLoad() {

		var tab = self.tabBarController?.tabBar
		tab?.barStyle = UIBarStyle.Black
		var nav = self.navigationController?.navigationBar
		nav?.barStyle = UIBarStyle.BlackTranslucent
        
//		var startPositionx = chessBoard.frame.origin.x
//		var startPositiony = chessBoard.frame.origin.y
//		image1.frame = CGRect(x: startPositionx, y: startPositiony, width: pieceSize, height: pieceSize)

		
		
        println("\(screenHeight) is the height and \(screenWidth) is the width. \(screenSize) is the screensize")
        
    }
    
	class View: UIView {
	
	
	}
	
}
