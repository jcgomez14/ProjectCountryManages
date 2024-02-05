import XCTest
@testable import CountryManages

final class LoginServiceTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {

    }

    func testCreateAccount() {
        let nombre: String = "Juan Cruz"
        let apellido: String = "Gomez"
        let identificacion: String = "38563077"
        let email: String = "jcgomez0014@gmail.com"
        let telefono: String = "2325413946"

        
        let createAccount =  UserDefautlModel(Nombre: nombre, Apellido: apellido, DNI: identificacion, Email: email, Telefono: telefono, Codigo: "C14", Admin: true)
        
        XCTAssertEqual(createAccount.Nombre, nombre)
        XCTAssertEqual(createAccount.Apellido, apellido)
        XCTAssertEqual(createAccount.DNI, identificacion)
        XCTAssertEqual(createAccount.Email, email)
    }
}
