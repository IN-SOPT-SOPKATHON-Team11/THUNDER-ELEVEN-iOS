//
//  UITableView+.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import UIKit

protocol UITableViewRegisterable {
    
    static var isFromNib: Bool { get }
    static func register(target: UITableView)
}

extension UITableViewRegisterable where Self: UITableViewCell {
    
    static func register(target: UITableView) {
        if self.isFromNib {
            target.register(UINib(nibName: Self.className, bundle: nil), forCellReuseIdentifier: Self.className)
        } else {
            target.register(Self.self, forCellReuseIdentifier: Self.className)
        }
    }
}
