import UIKit

struct TextValidatorError: Error {
    let message: String
    let detail: String
    init(message: String, detail: String) {
        self.message = message
        self.detail = detail
    }
    
    func showAlert(viewController: UIViewController) {
        let alertController = UIAlertController(title: self.message, message: self.detail, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
protocol TextValidator {
    static func validate(_ string: String?) -> TextValidatorError?
}
