import UIKit

public protocol Presentable {
    @discardableResult
    func present(segue: NavigationSegue) -> NavigationSegue.RewindAction
}

extension Presentable {
    @inlinable
    @discardableResult
    public func push(onto navigationController: UINavigationController, animated: Bool) -> NavigationSegue.RewindAction {
        present(segue: .push(onto: navigationController, animated: animated))
    }

    @inlinable
    @discardableResult
    public func present(on viewController: UIViewController, animated: Bool) -> NavigationSegue.RewindAction {
        present(segue: .present(on: viewController, animated: animated))
    }
}

extension UIViewController: Presentable {
    @inlinable
    @discardableResult
    public func present(segue: NavigationSegue) -> NavigationSegue.RewindAction {
        segue.invoke(with: self)
    }
}

extension UIViewController {
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func present(_ presentable: Presentable, animated: Bool) -> NavigationSegue.RewindAction {
        presentable.present(on: self, animated: animated)
    }
}

extension UINavigationController {
    @inlinable
    @discardableResult
    public func push(_ presentable: Presentable, animated: Bool) -> NavigationSegue.RewindAction {
        presentable.push(onto: self, animated: animated)
    }
}
