import Foundation

class UserDataViewModel: ObservableObject {
    @Published var authRequest: [AuthModel] = []
    @Published var userData: UserModel?
    @Published var groupData: [GroupModel] = []
    
    init() {
      fetchUserData()
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
    
    
    func fetchUserData() {
        guard let url = Bundle.main.url(forResource: "UserMock", withExtension: "json")
        else {
            print("Error localized UserMock")
            return }
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let userData = try jsonDecoder.decode(UserModel.self, from: data)
            
            self.userData = userData
            print("User Data", userData)
            
        } catch {
            print(error)
        }
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
