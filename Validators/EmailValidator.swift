import Foundation

struct EmailValidator: TextValidator {
    static func validate(_ string: String?) -> TextValidatorError? {
        guard let email = string, email.count > 0 else {
            return TextValidatorError(message: "Enter email".localized, detail: "Just enter correct email and try again".localized)
        }
        
        if !validate(format: email) {
            return TextValidatorError(message: "Email is invalid".localized, detail: "Please, check entered email".localized)
        }
        
        return nil
    }
    
    private static func validate(format email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
