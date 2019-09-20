public protocol UserProtocol: class, Codable {
    var uid: String { get }
    var email: String { get }
    var pushToken: String? { get }
}
