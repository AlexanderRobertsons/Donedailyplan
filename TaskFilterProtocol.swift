import UIKit
protocol TaskFilterProtocol {
    var priorityRawValue: Int? { get }
    var dateFrom: Date? { get }
    var dateTo: Date? { get }
}
