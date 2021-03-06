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

fileprivate let circleCount: Int = 9
fileprivate let circleRadius: CGFloat = 25

class PlanetScene: SKScene {

    var planet: Planet!

    override func didMove(to view: SKView) {
        scene?.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        scene?.physicsWorld.gravity = CGVector(dx: 0, dy: 0)

        let field = SKFieldNode.noiseField(withSmoothness: 0, animationSpeed: 0.1)
        scene?.addChild(field)

        planet = Planet(circleOfRadius: circleRadius, gravityRange: max(size.width, size.height), gravityMultiplier: 0.005)
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

class Planet: SKShapeNode {

    var gravityRange: CGFloat!
    var gravityMultiplier: CGFloat!

    convenience init(circleOfRadius: CGFloat, gravityRange: CGFloat, gravityMultiplier: CGFloat) {
        self.init(circleOfRadius: circleOfRadius)
        fillColor = .green
        strokeColor = .clear
        physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)
        physicsBody?.isDynamic = false
        self.gravityRange = gravityRange
        self.gravityMultiplier = gravityMultiplier

        let borderNode = SKShapeNode(circleOfRadius: circleOfRadius + 3)
        borderNode.fillColor = .clear
        borderNode.strokeColor = .green
        borderNode.lineWidth = 1
        addChild(borderNode)
    }

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
