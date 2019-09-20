import UIKit
enum EnumTaskPriority: Int {
    case none = 0
    case low = 1
    case medium = 2
    case high = 3
    var color: UIColor {
        switch self {
        case .none: return UIColor.rgba(218, green: 218, blue: 222)
        case .low: return UIColor.rgba(91, green: 89, blue: 147)
        case .medium: return UIColor.rgba(252, green: 211, blue: 160)
        case .high: return UIColor.rgba(221, green: 74, blue: 82)
        }
    }
    var description: String {
        switch self {
        case .none: return "Neutral".localized
        case .low: return "Normal".localized
        case .medium: return "Important".localized
        case .high: return "Urgently".localized
        }
    }
}
struct Task: TaskProtocol, Equatable {
    var priority: EnumTaskPriority
    var priorityRawValue: Int {
        return priority.rawValue
    }
    var title: String
    var detail: String
    var date: Date
    var reminderDate: Date?
    var id: String?
}
func ==(lhs: Task, rhs: Task) -> Bool {
    return lhs.priorityRawValue == rhs.priorityRawValue
        && lhs.title == rhs.title
        && lhs.detail == rhs.detail
        && lhs.date == rhs.date
        && lhs.id == rhs.id
}
