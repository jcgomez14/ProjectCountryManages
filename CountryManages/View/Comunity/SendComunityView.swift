
import SwiftUI

struct SendComunityView: View {
    
    var alert: AlertsModel
    
    @State var text: String = ""
    
    @State private var opcionesSeleccionadas: [Bool] = [false, false, false, false]
    let opciones = ["No permitir comentarios", "Notificarme cuando la alerta caduque", "Solo visible para mis grupos", "Notificar a mis grupos"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: alert.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .padding()
                    .foregroundColor(.white)
                    .background(alert.color)
                    .cornerRadius(50)
                Text(alert.title)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Divider()
            
            Text("Escriba el contenido del aviso")
                .font(.system(size: 14))
                .italic()
            TextEditor(text: $text)
                .frame(height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
            
            Text("Incluye fotos, videos, audios o ubicacion en tu evento.")
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .font(.system(size: 14))
                .padding(.vertical)
            
            HStack(spacing: 20) {
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(alert.color)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(alert.color, lineWidth: 2)
                            )
                        Text("Ubicacion")
                            .foregroundColor(.primary)
                            .font(.system(size: 13))
                    }
                })
                
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(alert.color)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(alert.color, lineWidth: 2)
                            )
                        
                        
                        Text("Galeria")
                            .foregroundColor(.primary)
                            .font(.system(size: 13))
                    }
                })
                
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image(systemName: "phone.and.waveform")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(alert.color)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(alert.color, lineWidth: 2)
                            )
                        Text("Audio")
                            .foregroundColor(.primary)
                            .font(.system(size: 13))
                    }
                })
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(alert.color)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(alert.color, lineWidth: 2)
                            )
                        Text("Camara")
                            .foregroundColor(.primary)
                            .font(.system(size: 13))
                    }
                })
            }.frame(maxWidth: .infinity, alignment: .center)
            
          
            Text("Opciones de mi aviso")
                .font(.system(size: 15))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
            
            List(0..<opciones.count) { index in
                Toggle(opciones[index], isOn: $opcionesSeleccionadas[index])
                    .font(.system(size: 14))
            }
            .listStyle(.plain)
            
           
            
        }.padding()
        Spacer()
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                NavigationLink(destination: SegundaPantalla()){
            Text("Publicar")
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(8)
                .background(Color.accent)
                .cornerRadius(5)
            
        }.task {
           
        })
    }
}

#Preview {
    SendComunityView(alert: AlertsModel(title: "", image: "", color: .font, type: .animal))
}
