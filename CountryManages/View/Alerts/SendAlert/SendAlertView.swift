import SwiftUI
import MapKit

struct SendAlertView: View {
    
    @StateObject var location = LocationViewModel()
    
    
    @Environment (\.presentationMode) var presentationMode

    @State var hiddenTab: Bool = true
    
    var alert: AlertsModel?
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $location.region, showsUserLocation: true)
                .ignoresSafeArea()
                .overlay(alignment: .bottom) {
                    VStack {
                        Text(alert?.title ?? "Alerta")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(5)
                        Divider()
                        
                        Text("Recibieron tu alerta")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        HStack {
                            VStack {
                                Image(systemName: "person")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                
                                Text("Central de monitoreo")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                            }.frame(width: 80)
                            
                            VStack {
                                Image(systemName: "person")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                
                                Text("Grupo C14")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                            }.frame(width: 80)
                            
                        }.frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        
                        
                        Text("Incluye fotos, videos, audios o mensajes a tu aviso de emergencia. Seran recibidos por la central de monitoreo")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 14))
                            .padding(5)
                        
                        HStack(spacing: 20) {
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "text.bubble")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(alert?.color ?? Color.accent)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(50)
                                Text("Mensajes")
                                    .foregroundColor(.white)
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
                                    .foregroundColor(alert?.color ?? Color.accent)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(50)
                                Text("Galeria")
                                    .foregroundColor(.white)
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
                                    .foregroundColor(alert?.color ?? Color.accent)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(50)
                                Text("Audio")
                                    .foregroundColor(.white)
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
                                    .foregroundColor(alert?.color ?? Color.accent)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(50)
                                Text("Camara")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13))
                            }
                        })
                    }
                        
                        Divider()
                        Button {
                            hiddenTab = false
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Finalizar")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(12)
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(12)
                        }
                        .padding()

                        
                        
                    }.frame(maxWidth: .infinity)
                        .background(alert?.color ?? Color.accent)
                        .cornerRadius(12)
                        .padding(.horizontal)
                   
                   
                }
                .navigationBarHidden(true)
                .toolbar(hiddenTab ? .hidden : .visible, for: .tabBar)
        }
    }
}

#Preview {
    SendAlertView()
}
