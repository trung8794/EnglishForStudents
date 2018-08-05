
import Foundation
import UIKit

extension UIView{
    func customBorderRadius(rad : CGFloat = 10.0) {
        self.layer.cornerRadius = rad
        self.clipsToBounds = true
    }
    func customBorderColor(color : CGColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color
    }
}
