
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
    
    //--- custom Anchor For UIView ----
    func anchorToView(top : NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
    }
    func anchorSizeWidth(width : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if width != 0{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    func anchorSizeHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if height != 0{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func anchorSizeWithView(to view: UIView, multi :(CGFloat, CGFloat) = (1, 1), const : CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multi.0, constant: const.width).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multi.1, constant: const.height).isActive = true
    }
    
    func anchorCenter(to view: UIView, centerX : Bool , centerY : Bool , constant : (CGFloat, CGFloat) = (0, 0)) {
        translatesAutoresizingMaskIntoConstraints = false
        if centerX == true{
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        if centerY == true{
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
}
