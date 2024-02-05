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
        let identificacion: String = "1234"
        let email: String = "juan@example.com"
        let telefono: String = "123456789"

        
        let createAccount =  UserDefautlModel(Nombre: nombre, Apellido: apellido, DNI: identificacion, Email: email, Telefono: telefono, Codigo: "C14", Admin: true)
        
        XCTAssertEqual(createAccount.Nombre, nombre)
        XCTAssertEqual(createAccount.Apellido, apellido)
        XCTAssertEqual(createAccount.DNI, identificacion)
        XCTAssertEqual(createAccount.Email, email)
    }
    
    func testLoginService() {
        let viewModel = LoginService()
        
        let result = viewModel.createAccount(nombre: "Juan Cruz", identificacion: "123456", email: "juan@example.com", telefono: "123456789", password: "password", repeatPassword: "password")
        
        XCTAssertTrue(result, "Cuenta creada correctamente")
        XCTAssertTrue(viewModel.isAccountLogin, "La cuenta se encuentra logeada")
        
        let logOut = viewModel.logoutAccount()
        
        XCTAssertFalse(viewModel.isAccountLogin, "La cuenta se encuentra deslogueada" )
        
    }  
}
