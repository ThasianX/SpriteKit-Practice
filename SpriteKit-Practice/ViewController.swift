// Kevin Li - 8:47 PM - 7/20/20

import SpriteKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = PlanetScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true

        scene.scaleMode = .resizeFill
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        skView.presentScene(scene)
    }

}

fileprivate let circleCount: Int = 10
fileprivate let circleRadius: CGFloat = 25

class PlanetScene: SKScene {

    var planet: Planet!

    override func didMove(to view: SKView) {
        scene?.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        scene?.physicsWorld.gravity = CGVector(dx: 0, dy: 0)

        planet = Planet(circleOfRadius: circleRadius)
        planet.strokeColor = .white
        planet.fillColor = .green
        planet.physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)
        planet.physicsBody?.isDynamic = false
        planet.gravityRange = max(size.width, size.height)
        planet.gravityMultiplier = 0.005
        addChild(planet)

        showElements()
    }

    private func showElements() {
        for _ in 0..<circleCount {
            let elementNode = SKShapeNode(circleOfRadius: circleRadius)
            elementNode.strokeColor = .clear
            elementNode.fillColor = .random

            elementNode.physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)
            addChild(elementNode)

            elementNode.position = CGPoint(
                x: Int.random(in: -(Int(size.width) / 2)..<(Int(size.width) / 2 - Int(circleRadius))),
                y: Int.random(in: Int(frame.minY + circleRadius)..<(Int(size.height) / 2 - Int(circleRadius))))
        }
    }

    override func update(_ currentTime: TimeInterval) {
        planet.updateGravity(children: children)
    }

}

class Planet: SKShapeNode {

    var gravityRange: CGFloat!
    var gravityMultiplier: CGFloat!

    func updateGravity(children: [SKNode]) {
        for child in children {
            let xDelta = position.x - child.position.x
            let yDelta = position.y - child.position.y
            if ((child.physicsBody?.affectedByGravity ?? true) && sqrt(pow(xDelta, 2) + pow(yDelta, 2)) <= gravityRange) {
                child.physicsBody?.applyForce(CGVector(dx: xDelta * gravityMultiplier,
                                                       dy: yDelta * gravityMultiplier))
            }
        }
    }

}
