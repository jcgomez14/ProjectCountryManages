import Foundation

struct AuthModel:Codable {
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
    var NombreEntry: String
    var ApellidoEntry: String
    var DateEntry: String
    var DNIEntry: String
    var Auth: Int
    
    func getAuthString() -> String {
        var auth_string = ""
        switch self.Auth {
        case 0:
            auth_string = "Pendiente"
        case 1:
            auth_string =  "Aceptado"
        case 2:
            auth_string =  "Denegado"
        default: break
        }
        return auth_string
    }
}
