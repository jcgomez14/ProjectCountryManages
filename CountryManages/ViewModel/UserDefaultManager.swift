import Foundation

class UserDefaultManager {
    
    static let shared = UserDefaultManager()
    
    func saveData(_ data: String, forKey key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func retrieveData(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
}
