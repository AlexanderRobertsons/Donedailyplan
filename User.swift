class User: UserProtocol, Codable {
    var uid: String = ""
    var email: String = ""
    var pushToken: String?
}
