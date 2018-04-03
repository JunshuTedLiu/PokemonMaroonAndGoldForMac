//
//  Scene1.swift
//  PokemonMaroonAndGold
//
//  Created by Junshu Liu on 12/4/17.
//  Copyright © 2017 Junshu Liu. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Scene1: SKScene, SKPhysicsContactDelegate {
    var contentsCreated = false
    var controller: ViewController!
    var randomSource = GKLinearCongruentialRandomSource.sharedRandom()
    
    override func didMove(to view: SKView) {
        if contentsCreated == false {
            backgroundColor = SKColor.white
            createSceneObjects()
            contentsCreated = true
            physicsWorld.contactDelegate = self
        }
    }
    
    func createSceneObjects() {
        physicsWorld.contactDelegate = self
        //        createEdgeBottom()
        //this is the scene1 background.
        let scene = SKTexture(imageNamed: "Scene1c.png")
        let sceneNode = SKSpriteNode(texture: scene)
        sceneNode.position = CGPoint(x: frame.midX, y: frame.midY)
        guard let v = view else { return }
        sceneNode.size = CGSize(width: v.frame.width, height: v.frame.height)
//        scene1scene.size = CGSize(width: 480, height: 432)
        
        addChild(sceneNode)
        //this is our character, ASH.
        let back = SKTexture(imageNamed: "ASHback.png")
        let front = SKTexture(imageNamed: "ASHfront.png")
        let left = SKTexture(imageNamed: "ASHleft.png")
        let right = SKTexture(imageNamed: "ASHright.png")
        let characterTextures = [back, front, left, right]
        
        //build our character.
        //        let character = SKSpriteNode(color: SKColor.green, size: CGSize(width: 64.0, height: 64.0))
        //        character.position = CGPoint(x: frame.midX, y: frame.midY)
        //        character.name = "Character"
        //        character.physicsBody = SKPhysicsBody(rectangleOf: character.size)
        //        character.physicsBody?.isDynamic = false
        //        character.zRotation = 0.75
        //        addChild(character)
        
        let character = SKSpriteNode(texture: back)
        character.position = CGPoint(x: frame.midX, y: frame.midY)
        character.size = CGSize(width: 28, height: 32)
        character.name = "Character"
        //        character.physicsBody = SKPhysicsBody(rectangleOf: character.size)
        character.physicsBody = SKPhysicsBody(texture: back, size: CGSize(width: 28, height: 32))
        character.physicsBody?.usesPreciseCollisionDetection = true
        character.physicsBody?.contactTestBitMask = 1
        character.physicsBody?.isDynamic = true
        character.physicsBody?.affectedByGravity = false
        
        addChild(character)
        
        createEdgeLeftSide()
        createEdgeBottom()
    }
    
    //make our character move.
    override func keyDown (with event: NSEvent) {
        print("keyCode is \(event.keyCode)")
        //keycode
        if let node = childNode(withName: "Character") {
                //right
            if event.keyCode == 124 {
                node.run(SKAction.moveBy(x: 20.0, y: 0, duration: 0.1))
            }
                //left
            else if event.keyCode == 123 {
                node.run(SKAction.moveBy(x: -20.0, y: 0, duration: 0.1))
            }
                //up
            else if event.keyCode == 126 {
                node.run(SKAction.moveBy(x: 0, y: 20.0, duration: 0.1))
            }
                //down
            else if event.keyCode == 125 {
                node.run(SKAction.moveBy(x: 0, y: -20.0, duration: 0.1))
            }
        }
    }
    
    func createEdgeLeftSide() {
        let leftside = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 30, height: frame.height))
        leftside.position = CGPoint(x: -30, y: frame.midY)
        leftside.physicsBody = SKPhysicsBody(rectangleOf: leftside.size)
        leftside.name = "left side"
        
        leftside.physicsBody?.usesPreciseCollisionDetection = true
        leftside.physicsBody?.contactTestBitMask = 1
        leftside.physicsBody?.isDynamic = false
        
        addChild(leftside)
    }
    
    func createEdgeBottom() {
        let bottom = SKSpriteNode(color: SKColor.blue, size: CGSize(width: frame.width, height: 30))
        bottom.position = CGPoint(x: frame.midX, y: -30)
        bottom.physicsBody = SKPhysicsBody(rectangleOf: bottom.size)
        bottom.name = "bottom"
        
        bottom.physicsBody?.usesPreciseCollisionDetection = true
        bottom.physicsBody?.contactTestBitMask = 1
        bottom.physicsBody?.isDynamic = false
        
        addChild(bottom)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact")
        if contact.bodyA.node?.name == "character" || contact.bodyB.node?.name == "left side" {
            let goToNextScene = SKTransition.fade(withDuration: 0.5)
            view?.presentScene(controller.scene1L, transition: goToNextScene)
        }
        if contact.bodyA.node?.name == "character" || contact.bodyB.node?.name == "bottom" {
            let goToNextScene = SKTransition.fade(withDuration: 0.5)
            view?.presentScene(controller.scene2, transition: goToNextScene)
        }
    }
}
