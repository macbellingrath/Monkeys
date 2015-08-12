//
//  GameViewController.swift
//  Monkeys
//
//  Created by Mac Bellingrath on 8/12/15.
//  Copyright (c) 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController{
    
    var currentGame: GameScene!

    @IBOutlet weak var angleSlider: UISlider!
    @IBAction func angleChanged(sender: AnyObject) {
        angleLabel.text = "Angle: \(Int(angleSlider.value))º"
    }
    @IBOutlet weak var angleLabel: UILabel!
    @IBOutlet weak var velocitySlider: UISlider!
    @IBAction func velocityChanged(sender: AnyObject) {
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))"
    }
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var launchButton: UIButton!
    @IBAction func launch(sender: AnyObject) {
        hideUI(true)
        currentGame.launch(angle: Int(angleSlider.value), velocity: Int(velocitySlider.value))
    }
    @IBOutlet weak var playerNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        angleChanged(false)
        velocityChanged(false)

       
        
        
        

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
            currentGame = scene
            scene.ViewController = self
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func hideUI(hide: Bool) {
        angleSlider.hidden = hide
        angleLabel.hidden = hide
        velocitySlider.hidden = hide
        velocityLabel.hidden = hide
        launchButton.hidden = hide

        
    }
    func activatePlayerNumber(number: Int){
        if number == 1{
            playerNumber.text = "<<< PLAYER ONE"
        } else {
            playerNumber.text = "PLAYER TWO >>>"
        }
        hideUI(false)
    }
}
