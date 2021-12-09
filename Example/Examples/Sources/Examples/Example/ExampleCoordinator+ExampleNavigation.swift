import UIKit

extension ExampleCoordinator: ExampleNavigation {
    internal func showDetail() {
        navigationController.push(presentable(), animated: true)
    }
}
