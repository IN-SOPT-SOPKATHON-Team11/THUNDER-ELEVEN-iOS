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
}
