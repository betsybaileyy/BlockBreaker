
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    var scoreLabel: SKLabelNode!

    var score: Int  = 0
    
    override func didMove(to view: SKView) {
        scoreLabel()
        let wait = SKAction.wait(forDuration: 1.5)
        // This block will call the function below
        let makeABox = SKAction.run {
            self.makeBox()
        }
        
        let seq = SKAction.sequence([wait, makeABox])
        let rep = SKAction.repeatForever(seq)

        run(rep)
    }
    
    func scoreLabel() {
        let scoreText = SKLabelNode(text: "Score: \(score)")
        scoreText.name = "scoreText"
        scoreText.color = SKColor.blue
        scoreText.position = CGPoint(x: size.width-65, y: size.height-45)
        addChild(scoreText)
    }
    
    // This function makes boxes
    
    func makeBox() {
        let box = Box(screenSize: size)
        addChild(box)
    }
    
    // Handle touch events
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let node = atPoint(location)
            if node.name == "box" {
                node.removeFromParent()
                                score += 1
                let scoreText = childNode(withName: "scoreText") as! SKLabelNode
                scoreText.text = "Score: \(score)"

            }
        }
    }
    
    func outoforder(n: Int) {
        var start = 0
        var end = n
        for i in 0 ... n {
            if i % 2 == 0 {
                print(start)
                start += 1
            } else {
                print(end)
                end -= 1
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
