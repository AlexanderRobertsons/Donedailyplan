import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

public func localized(_ text: String) -> String {
    return text.localized
}

class LocalizedField {
    static let Error = NSLocalizedString("Error", comment: "")
    static let Exit = NSLocalizedString("Exit", comment: "")
    static let Loading = NSLocalizedString("Loading", comment: "")
    static let Cancel = NSLocalizedString("Cancel", comment: "")
    static let Saving = NSLocalizedString("Saving", comment: "")
    static let Sanding = NSLocalizedString("Sanding", comment: "")
    static let Preparation = NSLocalizedString("Preparation", comment: "")
}
