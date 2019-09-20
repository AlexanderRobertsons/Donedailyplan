import UIKit

@IBDesignable
class GradientButton: UIButton {
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.gradientLayer.cornerRadius = cornerRadius
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            self.gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            self.gradientLayer.borderColor = layer.borderColor
            self.gradientLayer.borderWidth = layer.borderWidth
            self.layer.insertSublayer(gradientLayer, at: 0)
        } else {
            self.gradientLayer.removeFromSuperlayer()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareAppearance()
        
        self.layer.shadowColor = UIColor.rgba(100, green: 147, blue: 168).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 0.16
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.gradientLayer.frame = self.bounds
    }
    
    func prepareAppearance() {
        self.backgroundColor = UIColor.clear
        self.gradientLayer.opacity = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = self.topGradientColor
        self.gradientLayer.opacity = 0
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        resetHighlight()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        resetHighlight()
    }
    
    func resetHighlight() {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.prepareAppearance()
        })
    }
    
}
