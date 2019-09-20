import UIKit

class TaskPriorityButton: UIButton {
    @IBInspectable
    var priorityRawValue: Int = 0
    
    @IBInspectable
    var autoWidth: Bool = false
    
    var priority: EnumTaskPriority = .none {
        didSet {
            self.priorityIndicatorView.backgroundColor = priority.color
            self.nameLabel.text = priority.description
        }
    }
    var isChecked: Bool = false {
        didSet {
            guard oldValue != isChecked else {
                return
            }
            self.checkImageView.image = isChecked ? UIImage(named: "ic_tick") : nil
            self.updateWidth()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    fileprivate lazy var priorityIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = self.priority.color
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        let left = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 9)
        let height = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
        let width = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
        let centerY = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        self.addConstraints([left, height, width, centerY])
        return view
    }()
    
    fileprivate lazy var checkImageView: UIImageView = {
        let check = UIImageView()
        check.backgroundColor = UIColor.clear
        check.contentMode = .center
        check.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(check, aboveSubview: self.nameLabel)
        
        let width = NSLayoutConstraint(item: check, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 12)
        let top = NSLayoutConstraint(item: check, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 6)
        let bottom = NSLayoutConstraint(item: check, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -6)
        let right = NSLayoutConstraint(item: check, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -9)
        
        self.addConstraints([width, right, top, bottom])
        return check
    }()
    
    fileprivate lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.rgba(187, green: 187, blue: 199)
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        let left = NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: self.priorityIndicatorView, attribute: .right, multiplier: 1, constant: 14)
        let top = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 6)
        let bottom = NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -6)
        let right = NSLayoutConstraint(item: label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        
        self.addConstraints([left, top, bottom, right])
        return label
    }()
    
    func setup() {
        self.backgroundColor = UIColor.white
        self.clipsToBounds = false
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.rgba(100, green: 147, blue: 168).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.16
        
        _ = self.checkImageView // Init check image view
        self.nameLabel.text = self.titleLabel?.text
        self.setTitle(nil, for: UIControl.State.normal)
        self.priority = EnumTaskPriority(rawValue: self.priorityRawValue) ?? .none
        self.updateWidth()
    }
    
    func updateWidth() {
        guard self.autoWidth else {
            return
        }
        guard let widthConstraint = self.constraints.filter({ $0.identifier == "width" }).first else {
            return
        }
        var contentWidth = self.nameLabel.intrinsicContentSize.width
        contentWidth += 42 //Shift for priorityIndicatorView & right space
        if self.isChecked {
            contentWidth += 20 //
        }
        widthConstraint.constant = contentWidth
    }
}
