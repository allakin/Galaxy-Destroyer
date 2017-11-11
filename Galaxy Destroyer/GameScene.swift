//
//  GameScene.swift
//  Galaxy Destroyer
//
//  Created by Roman Bakhilov on 11.11.2017.
//  Copyright © 2017 GoiOS#4. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "playerShip")
    
    let bulletSound = SKAction.playSoundFileNamed("torpedo", waitForCompletion: false)

    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        player.setScale(1.5)
        player.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.1)
        player.zPosition = 2
        self.addChild(player)
    }
    
    func fireBullet() {
        
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.setScale(2)
        bullet.position = player.position
        bullet.zPosition = 1
        self.addChild(bullet)
        
        let moveBullet = SKAction.moveTo(y: self.size.height + bullet.size.height, duration: 1)
        let deleteBullet = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([bulletSound, moveBullet, deleteBullet])
        bullet.run(bulletSequence)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireBullet()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            player.position.x += amountDragged
        }
    }
    
}
