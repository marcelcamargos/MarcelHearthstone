//
//  Loading.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 22/04/22.
//

import Foundation
import UIKit

public class Loading {
    
    static var container: UIView = UIView()
    static var loadingCardView: UIView = UIView()
    static var cardActivityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    static func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        loadingCardView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingCardView.center = uiView.center
        loadingCardView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingCardView.clipsToBounds = true
        loadingCardView.layer.cornerRadius = 10
        
        cardActivityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        cardActivityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        cardActivityIndicator.center = CGPoint(x: loadingCardView.frame.size.width / 2, y: loadingCardView.frame.size.height / 2);
        
        loadingCardView.addSubview(cardActivityIndicator)
        container.addSubview(loadingCardView)
        uiView.addSubview(container)
        cardActivityIndicator.startAnimating()
    }
    
    static func hideActivityIndicator(uiView: UIView) {
        cardActivityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    static func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
