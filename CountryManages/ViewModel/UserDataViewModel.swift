import Foundation

class UserDataViewModel: ObservableObject {
    @Published var authRequest: [AuthModel] = []
    @Published var userDataMock: UserModel?
    @Published var groupData: [GroupModel] = []
    @Published var userData: UserDefautlModel?
    @Published var groupEvent: [GroupEventModel] = []
    @Published var comunityEvent: [ComunityEventModel] = []
    
    init() {
    //  fetchUserData()
        fetchDataUserDefaults()
    }
    
    func clearAccount() {
        userData =  UserDefautlModel.init(Nombre: "", Apellido: "", DNI: "", Email: "", Telefono: "", Codigo: "", Admin: false)
    }
    
    func fetchAuthRequest() {
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "AuthMock", withExtension: "json")
            else {
                print("Error localized AuthMock")
                return }
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let auth = try jsonDecoder.decode([AuthModel].self, from: data)
                DispatchQueue.main.async {
                    self.authRequest = auth
                    print("Auth", self.authRequest)
                }
            } catch {
                print(error)
            }
        }
    }
    
    // Mock
    func fetchUserData() {
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "UserMock", withExtension: "json")
            else {
                print("Error localized UserMock")
                return }
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let userData = try jsonDecoder.decode(UserModel.self, from: data)
                DispatchQueue.global().async {
                    self.userDataMock = userData
                    print("User Data", userData)
                }
            } catch {
                print(error)
            }
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
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "GroupMock", withExtension: "json")
            else {
                print("Error localized GroupMock")
                return }
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let groupData = try jsonDecoder.decode([GroupModel].self, from: data)
                DispatchQueue.main.async {
                    self.groupData  = groupData
                    print("Group Data", groupData)
                }
                
            } catch {
                print(error)
            }
        }
    }

    func fetchEventGroup() {
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "GroupEventMock", withExtension: "json") else {
                print("Error localized GroupEventMock")
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let eventData = try jsonDecoder.decode([GroupEventModel].self, from: data)
                DispatchQueue.main.async {
                    self.groupEvent = eventData
                    print("Group Event Data", self.groupEvent)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func fetchEventComunity() {
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "ComunityEventMock", withExtension: "json") else {
                print("Error localized ComunityEventMock")
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let eventData = try jsonDecoder.decode([ComunityEventModel].self, from: data)
                DispatchQueue.main.async {
                    self.comunityEvent = eventData
                    print("Group Event Data", self.comunityEvent)
                }
            } catch {
                print(error)
            }
        }
    }
}
