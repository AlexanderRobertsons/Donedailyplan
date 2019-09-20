import UIKit
public protocol TaskProtocol: Equatable {
    var priorityRawValue: Int { get }
    var title: String { get }
    var detail: String { get }
    var date: Date { get }
    var id: String? { get }
}
