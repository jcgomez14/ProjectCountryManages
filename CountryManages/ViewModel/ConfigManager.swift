import Foundation

class ConfigManager {
    static let shared = ConfigManager()
    
    var alerts: [AlertsModel] =  AlertsModel.getAlerts()
}
