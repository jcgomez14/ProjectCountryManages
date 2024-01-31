import Foundation

struct UserModel: Codable {
    var CuentaId: String
    var Id: String
    var Nombre: String
    var Apellido: String
    var DNI: String
    var Email: String
    var Telefono: String
    var Imei: String
    var Codigo: String
    var Admin: Bool
}







struct UserDefautlModel: Codable {
    var Nombre: String
    var Apellido: String
    var DNI: String
    var Email: String
    var Telefono: String
    var Codigo: String
    var Admin: Bool
}
