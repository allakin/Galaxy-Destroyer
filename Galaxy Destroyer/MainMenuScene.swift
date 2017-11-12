//
//  MainMenuScene.swift
//  Galaxy Destroyer
//
//  Created by Yaroslav Surovtsev on 12.11.2017.
//  Copyright © 2017 GoiOS#4. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

class MainMenuScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameName1 = SKLabelNode(fontNamed: "Star Jedi Outline")
        gameName1.text = "Galaxy"
        gameName1.fontSize = 160
        gameName1.fontColor = SKColor.white
        gameName1.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.7)
        gameName1.zPosition = 1
        self.addChild(gameName1)
        
        let gameName2 = SKLabelNode(fontNamed: "Star Jedi Outline")
        gameName2.text = "Destroyer"
        gameName2.fontSize = 160
        gameName2.fontColor = SKColor.white
        gameName2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.625)
        gameName2.zPosition = 1
        self.addChild(gameName2)
        
        let startGame = SKLabelNode(fontNamed: "Star Jedi Outline")
        startGame.text = "Start Game"
        startGame.fontSize = 100
        startGame.fontColor = SKColor.white
        startGame.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.4)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let arrayOfnodeITapped = nodes(at: pointOfTouch)
            
            for nodeITapped in arrayOfnodeITapped {
                if nodeITapped.name == "startButton" {
                    let sceneToMoveTo = GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                    
                    backingAudio.stop()
                    let filePath = Bundle.main.path(forResource: "gameSoundTrack", ofType: "mp3")
                    let audioURL = URL(fileURLWithPath: filePath!)
                    
                    do { backingAudio = try AVAudioPlayer(contentsOf: audioURL) }
                    catch { return print("Cannot find the audio") }
                    
                    backingAudio.numberOfLoops = -1
                    backingAudio.play()
                }
            }
        }
    }
}
