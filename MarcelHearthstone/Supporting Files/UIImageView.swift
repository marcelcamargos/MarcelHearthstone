//
//  UIImageView.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 22/04/22.
//

import Foundation
import UIKit

let imageCached = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImage(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil
        
        if let cachedImage = imageCached.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = CGPoint(x:self.frame.width/2,
                                           y: self.frame.height/2)
        DispatchQueue.main.async {
            activityIndicator.startAnimating()
            self.addSubview(activityIndicator)
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
            if let error = error {
                debugPrint(error)
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCached.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
        }).resume()
    }
}
