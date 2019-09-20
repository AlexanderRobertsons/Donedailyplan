import UIKit
extension Error {
    func showAlert(viewController: UIViewController) {
        let alertController = UIAlertController(title: LocalizedField.Error, message: self.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
