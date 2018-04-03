//
//  ViewController.swift
//  PokemonMaroonAndGold
//
//  Created by Junshu Liu on 12/3/17.
//  Copyright © 2017 Junshu Liu. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {
    @IBOutlet var spriteView: SKView!
    var copyright: Copyright!
    var animation: Animation!
    var titleScreen: Title!
    var scene1: Scene1!
    var scene1L: Scene1L!
    var scene2: Scene2!
    var scene2R: Scene2R!
    var scene3: Scene3!
    var scene3R: Scene3R!
    
    //timer
    var timerForcatcher: Timer? = nil

    var counter = 0
    
    func stopWatch() {
        timerForcatcher = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(timer) in
            self.counter = self.counter + 1
        }
    }
    
    
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window?.title = "Pokemon Maroon & Gold Version"
        let spriteView = view as! SKView
        
        if let visibleFrame = view.window?.screen?.visibleFrame {
            let newFrame = NSRect(x: visibleFrame.origin.x, y: visibleFrame.origin.y, width: 480, height: 452)
            
            view.window?.setFrame(newFrame, display: true)
        }
        
        copyright = Copyright(size: CGSize(width: view.frame.width, height: view.frame.height))
        animation = Animation(size: CGSize(width: view.frame.width, height: view.frame.height))
        titleScreen = Title(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1 = Scene1(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1L = Scene1L(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene2 = Scene2(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene2R = Scene2R(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene3 = Scene3(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene3R = Scene3R(size: CGSize(width: view.frame.width, height: view.frame.height))
        copyright.controller = self
        animation.controller = self
        titleScreen.controller = self
        scene1.controller = self
        scene1L.controller = self
        scene2.controller = self
        scene2R.controller = self
        scene3.controller = self
        scene3R.controller = self
        
        spriteView.presentScene(copyright)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

