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
        configurePermanentRotation()
        configureRadialField()
    }

    private func showElements() {
        for _ in 0..<circleCount {
            let elementNode = SKShapeNode(circleOfRadius: circleRadius)
            elementNode.strokeColor = .clear
            elementNode.fillColor = .random

            elementNode.physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)
            elementNode.physicsBody?.density = 100
            planet.addChild(elementNode)

            elementNode.position = CGPoint(
                x: Int.random(in: -(Int(size.width) / 2)..<(Int(size.width) / 2 - Int(circleRadius))),
                y: Int.random(in: Int(frame.minY + circleRadius)..<(Int(size.height) / 2 - Int(circleRadius))))
        }
    }

    private func configurePermanentRotation() {
        let rotateAction = SKAction.rotate(byAngle: CGFloat(2 * Double.pi), duration: 40)
        planet.run(SKAction.repeatForever(rotateAction))
    }

    private func configureRadialField() {
        let strength = Float(max(size.width, size.height))
        let radius = strength.squareRoot() * 100

        let field = SKFieldNode.radialGravityField()
        addChild(field)
        field.region = SKRegion(radius: radius)
        field.minimumRadius = radius
        field.strength = 1
    }

    override func update(_ currentTime: TimeInterval) {
        planet.updateGravity()
    }

}

fileprivate let dt: CGFloat = 1.0/60.0 //Delta Time
fileprivate let period: CGFloat = 10 //Number of seconds it takes to complete 1 orbit.
fileprivate let orbitRadius = CGPoint(x: 25, y: 25) //Radius of orbit.

class Planet: SKShapeNode {

    var gravityRange: CGFloat!
    var gravityMultiplier: CGFloat!

    func updateGravity() {
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
