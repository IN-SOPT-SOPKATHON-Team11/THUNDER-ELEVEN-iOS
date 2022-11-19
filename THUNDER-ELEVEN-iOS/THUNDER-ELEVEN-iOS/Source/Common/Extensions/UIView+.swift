//
//  UIView+.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 양정연 on 2022/11/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 3)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
    
}
