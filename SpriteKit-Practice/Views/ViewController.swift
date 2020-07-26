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
