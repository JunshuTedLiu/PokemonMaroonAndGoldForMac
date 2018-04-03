//
//  Title.swift
//  PokemonMaroonAndGold
//
//  Created by Junshu Liu on 12/4/17.
//  Copyright © 2017 Junshu Liu. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

class Title: SKScene {
    var contentsCreated = false
    var controller: ViewController!
    
    var player: AVPlayer? = nil
    var item: AVPlayerItem? = nil
    
    override func didMove(to view: SKView) {
        if contentsCreated == false {
            playVideo()
            
            contentsCreated = true
        }
    }
    
    func playVideo() {
        //        let sample = SKVideoNode(fileNamed: "Pokemon Opening Copyright.mov")
        let sample: SKVideoNode? = {
            guard let urlString = Bundle.main.path(forResource: "Pokemon Opening Title", ofType: "mov") else {
                return nil
            }
            let url = URL(fileURLWithPath: urlString)
            item = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: item)
            
            return SKVideoNode(avPlayer: player!)
        }()
        
        sample?.position = CGPoint(x: frame.midX,
                                   y: frame.midY)
        addChild(sample!)
        sample?.play()
        print("Playing title video.")
        
        finishPlayingTitleVideo(videoPlayer: player!)
        
        //        self.view?.presentScene(self.controller.animation, transition: nil)
    }
    
    //Inspired by the loopVideo function in these code from https://stackoverflow.com/questions/27808266/how-do-you-loop-avplayer-in-swift
    func finishPlayingTitleVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: item, queue: nil) { notification in
            print("Finished playing title video.")
            //for test use - looping the video.
            //            videoPlayer.seek(to: kCMTimeZero)
            //            videoPlayer.play()
            
            //jump to next scene - scene1
            let transition = SKTransition.fade(withDuration: 0.1)
            if let v = self.view {
                v.presentScene(self.controller.scene1, transition: transition)
            }
            
        }
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == 124 {
            let transition = SKTransition.fade(withDuration: 0.1)
            if let v = self.view {
                v.presentScene(self.controller.scene1, transition: transition)
                ViewController().stopWatch()
                print(ViewController().counter)
            }
        }
    }
}
