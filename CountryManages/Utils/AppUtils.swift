import Foundation
import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

class AppUtils {
    static let shared = AppUtils()
    
    func generateQRCode(from string: String) -> CIImage? {
        let data = Data(string.utf8)
        let filter = CIFilter.qrCodeGenerator()
        
        filter.setValue(data, forKey: "inputMessage")
        
        return filter.outputImage
    }
    
    
    func compartirQRCode(_ ciImage: CIImage) {
        guard let cgImage = CIContext().createCGImage(ciImage, from: ciImage.extent) else {
            return
        }
        
        let uiImage = UIImage(cgImage: cgImage)
        let actividadViewController = UIActivityViewController(activityItems: [uiImage], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(actividadViewController, animated: true, completion: nil)
    }
    
    
    func shareQRCode(uiImage: UIImage) {
           let image = uiImage
           let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
       }
    
    
    func generateQR(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        filter .message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.cicle") ?? UIImage()
    }
}
