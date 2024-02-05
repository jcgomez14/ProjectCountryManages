
import Foundation

class AlertsViewModel {
    static let shared = AlertsViewModel()
    var alertsSend: [AlertsSendModel] =  AlertsSendModel.getSendAlerts()
}
