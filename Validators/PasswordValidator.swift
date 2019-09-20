import Foundation

struct PasswordValidator: TextValidator {
    static func validate(_ string: String?) -> TextValidatorError? {
        guard let password = string, password.count > 0 else {
            return TextValidatorError(message: "Enter password".localized, detail: "Please, check entered email".localized)
        }
        
        if password.count < 8 {
            return TextValidatorError(message: "Password is too short".localized, detail: "Your password had to have at least eight characters".localized)
        }
        
        if !validate(format: password) {
            return TextValidatorError(message: "Password is too simple".localized, detail: "Minimum of 8 characters in length.\nNot less than one spec. character (!, @, etc),\nnot less than two uppercase character,\nnot less than one number".localized)
        }
        
        return nil
    }
    
    static func validate(_ string: String?, _ confirm: String?) -> TextValidatorError? {
        if let error = self.validate(string) {
            return error
        }
        if let error = self.validate(confirm) {
            return error
        }
        if string != confirm {
            return TextValidatorError(message: "Passwords do not match".localized, detail: "Try enter again".localized)
        }
        return nil
    }
    
    static func validate(format password: String) -> Bool {
        let passRegEx = "^(?=.*[A-Z].*[A-Z])(?=.*[*!\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~])(?=.*[0-9])([A-Za-z0-9!\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]){8,}$"
        /*
         Пароль обязательно должен соответствовать следующим правилам:
         (?=.*[A-Z].*[A-Z])          не менее 2х заглавных букв
         (?=.*[*!\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~])  не менее 1 спец. символа (!, @, etc)
         (?=.*[0-9])                 не менее 1 цифры
         ([A-Za-z0-9!\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]) ограничение по допустимым символам (пробелы и символы переноса строки должны отсутствовать)
         {8,}                        не менее 8 символов
         */
        let passTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        return passTest.evaluate(with: password)
    }
    
}
