import UIKit

/// Handles Keyboard for scrollViews
class KeyboardObserver {
    
    weak var constraint: NSLayoutConstraint!
    weak var view: UIView!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    init(view: UIView, constraint: NSLayoutConstraint?) {
        self.constraint = constraint
        self.view = view
    }
    
    /// add notificaiton observer for keyboard changes
    func addNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
}

@objc extension KeyboardObserver {
    private func keyboardNotification(notification: NSNotification) {
        guard let keyboardRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        guard let animationRawValue = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {
            return
        }
        let animation = UIView.AnimationOptions(rawValue: animationRawValue)
        
        let endFrame = keyboardRect.cgRectValue
        if endFrame.origin.y >= UIScreen.main.bounds.size.height {
            self.constraint.constant = 0.0
        } else {
            self.constraint.constant = endFrame.size.height
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: animation, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
