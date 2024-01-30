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
    
    enum TypeAlert {
        case fire
        case sos
        case police
        case emergency
        case here
        case violence
    }
    
}

