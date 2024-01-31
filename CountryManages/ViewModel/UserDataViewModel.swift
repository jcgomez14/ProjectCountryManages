import Foundation

class UserDataViewModel: ObservableObject {
    @Published var authRequest: [AuthModel] = []
    @Published var userDataMock: UserModel?
    @Published var groupData: [GroupModel] = []
    @Published var userData: UserDefautlModel?

    
    init() {
    //  fetchUserData()
        fetchDataUserDefaults()
    }
    
    func clearAccount() {
        userData =  UserDefautlModel.init(Nombre: "", Apellido: "", DNI: "", Email: "", Telefono: "", Codigo: "", Admin: false)
    }
    
    func fetchAuthRequest() {
        guard let url = Bundle.main.url(forResource: "AuthMock", withExtension: "json")
        else {
            print("Error localized AuthMock")
            return }
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let auth = try jsonDecoder.decode([AuthModel].self, from: data)
            
            self.authRequest = auth
            print("Auth", authRequest)
            
        } catch {
            print(error)
        }
    }
    
    // Mock
    func fetchUserData() {
        guard let url = Bundle.main.url(forResource: "UserMock", withExtension: "json")
        else {
            print("Error localized UserMock")
            return }
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let userData = try jsonDecoder.decode(UserModel.self, from: data)
            
            self.userDataMock = userData
            print("User Data", userData)
            
        } catch {
            print(error)
        }
    }
    
    
    // Fetch Data whit UserDefaults
    func fetchDataUserDefaults()  {
        
        guard let nombre =  UserDefaults.standard.string(forKey: "userNombre") else { return }
        guard let dni =  UserDefaults.standard.string(forKey: "userIdentificacion") else { return }
        guard let email =  UserDefaults.standard.string(forKey: "userEmail") else { return }
        guard let telefono =  UserDefaults.standard.string(forKey: "userEmail") else { return }
        
        userData =  UserDefautlModel.init(Nombre: nombre, Apellido: "", DNI: dni, Email: email, Telefono: telefono, Codigo: "C14", Admin: true)
    }
    
    
    func fetchUserGroup() {
        guard let url = Bundle.main.url(forResource: "GroupMock", withExtension: "json")
        else {
            print("Error localized GroupMock")
            return }
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let groupData = try jsonDecoder.decode([GroupModel].self, from: data)
            self.groupData  = groupData
            print("Group Data", groupData)
            
        } catch {
            print(error)
        }
    }
}
