import Foundation
import SwiftUI

struct AlertsModel: Hashable {
    var title: String
    var image: String
    var color: Color
    var type: TypeAlert
    
    static func getAlerts() -> [AlertsModel] {
        return [.init(title: "SOS", image: "sos", color: Color.orange, type: .sos),
                .init(title: "Fuego", image: "flame", color: Color.red, type: .fire),
                .init(title: "Polica", image: "light.beacon.max", color: Color.blue, type: .police),
                .init(title: "Emergencia Salud", image: "cross.case", color: Color.green, type: .emergency),
                .init(title: "Violencia", image: "hand.raised", color: Color.mint, type: .violence),
                .init(title: "Estoy aqui", image: "mappin", color: Color.indigo, type: .here)]
    }
    
    static func getAlertsComunity() -> [AlertsModel] {
        return [.init(title: "Animal perdido", image: "tortoise", color: Color.teal, type: .animal),
                .init(title: "Objecto perdido", image: "magnifyingglass", color: Color.pink, type: .object),
                .init(title: "Otro", image: "plus", color: Color.purple, type: .other),]
    }

    

}

enum TypeAlert {
    case fire
    case sos
    case police
    case emergency
    case here
    case violence
    case animal
    case object
    case other
}


struct AlertsSendModel: Hashable {
    var title: String
    var image: String
    var color: Color
    var type: TypeAlert
    var person: String
    var latitude: Float
    var longitude: Float
    var date: String

    
    static func getSendAlerts() -> [AlertsSendModel] {
        return [
                .init(title: "SOS", image: "sos", color: Color.orange, type: .sos, person: "Luisa Rodriguez", latitude: 0.0, longitude: 0.0, date: "3/2/2024"),
                .init(title: "Fuego", image: "flame", color: Color.red, type: .fire, person: "Julian Rodriguez", latitude: 0.0, longitude: 0.0, date: "30/1/2024"),
                .init(title: "Polica", image: "light.beacon.max", color: Color.blue, type: .police, person: "Roxana Gonzalez", latitude: 0.0, longitude: 0.0, date: "17/1/2024"),
                .init(title: "Emergencia Salud", image: "cross.case", color: Color.green, type: .emergency, person: "Luisa Rodriguez", latitude: 0.0, longitude: 0.0, date: "3/1/2024"),
                .init(title: "Violencia", image: "hand.raised", color: Color.mint, type: .violence, person: "Julian Rodriguez", latitude: 0.0, longitude: 0.0, date: "27/12/2023"),
                .init(title: "Estoy aqui", image: "mappin", color: Color.indigo, type: .here, person: "Roxana Gonzalez", latitude: 0.0, longitude: 0.0, date: "25/12/2023"),
        ]
    }
}
