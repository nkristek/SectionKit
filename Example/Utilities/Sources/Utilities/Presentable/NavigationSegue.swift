import UIKit

public enum NavigationSegue: Equatable {
    case push(onto: UINavigationController, animated: Bool)
    case present(on: UIViewController, animated: Bool)

    public enum RewindAction {
        case pop(navigationController: UINavigationController, to: UIViewController?, animated: Bool)
        case dismiss(viewController: UIViewController, animated: Bool)

        public func rewind() {
            switch self {
            case let .pop(navigationController: navigationController, to: viewController, animated: animated):
                if let viewController = viewController {
                    navigationController.popToViewController(viewController, animated: animated)
                } else {
                    navigationController.setViewControllers([], animated: animated)
                }

            case let .dismiss(viewController: viewController, animated: animated):
                viewController.dismiss(animated: animated)
            }
        }
    }

    @discardableResult
    public func invoke(with viewController: UIViewController) -> RewindAction {
        switch self {
        case let .push(onto: navigationController, animated: animated):
            let topViewController = navigationController.topViewController
            navigationController.pushViewController(viewController, animated: animated)
            return .pop(navigationController: navigationController, to: topViewController, animated: animated)

        case let .present(on: presentingViewController, animated: animated):
            presentingViewController.present(viewController, animated: animated)
            return .dismiss(viewController: viewController, animated: animated)
        }
    }
}
