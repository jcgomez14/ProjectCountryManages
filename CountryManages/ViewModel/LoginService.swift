import Foundation

class LoginService: ObservableObject {
    
    static let shared = LoginService()
  
   @Published var isAccountLogin: Bool = false
    
    init() {
        self.isAccountLogin = isLogin()
    }
    
    
    func createAccount(nombre: String, identificacion: String, email: String, telefono: String, password: String, repeatPassword: String) -> Bool {
        
        if password == repeatPassword {
            savePasswordToKeychain(password: password)
        } else {
            print("Error create account password")
            return false
        }
        
        
        UserDefaultManager.shared.saveData(nombre, forKey: "userNombre")
        UserDefaultManager.shared.saveData(identificacion, forKey: "userIdentificacion")
        UserDefaultManager.shared.saveData(email, forKey: "userEmail")
        UserDefaultManager.shared.saveData(telefono, forKey: "userTelefono")
        
        print("Create Account Success")
        
        UserDefaults.standard.set(true, forKey: "userLogin")
        
        isAccountLogin = UserDefaults.standard.bool(forKey: "userLogin")
        return true
  
    }
    
    func loginAccount(identificacion: String, password: String) -> Bool {
        
        guard let keyPassword = retrievePasswordFromKeychain() else  { return false }
        guard let ident = UserDefaults.standard.string(forKey: "userIdentificacion") else { return false }
        
        if keyPassword == password && ident == identificacion {
            print("Password and Identificacion Valid")
            
            UserDefaults.standard.set(true, forKey: "userLogin")
            return true
        }
        
        return false
    }
    
    func logoutAccount() {
        UserDefaults.standard.set(false, forKey: "userLogin")
        isAccountLogin = UserDefaults.standard.bool(forKey: "userLogin")
    }
    
    private func isLogin() -> Bool {
        print("is Login Metodo", UserDefaults.standard.bool(forKey: "userLogin") )
        return UserDefaults.standard.bool(forKey: "userLogin")
    }

    private func savePasswordToKeychain(password: String) {
        let passwordData = Data(password.utf8)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "myPassword",
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecSuccess {
            print("Contraseña guardada exitosamente en el Keychain.")
        } else {
            print("Error al guardar la contraseña en el Keychain. Código de error: \(status)")
        }
    }
    
    
    private func retrievePasswordFromKeychain() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "myPassword",
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess, let retrievedData = dataTypeRef as? Data {
            let password = String(data: retrievedData, encoding: .utf8)
            print("Contraseña recuperada exitosamente del Keychain.")
            print("Password")
            return password
        } else {
            print("Error al recuperar la contraseña del Keychain. Código de error: \(status)")
            return nil
        }
    }
}
