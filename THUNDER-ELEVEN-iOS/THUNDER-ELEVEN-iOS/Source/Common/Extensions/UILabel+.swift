//
//  UILabel+.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 양정연 on 2022/11/18.
//

import UIKit.UILabel

extension UILabel {
    
    /// 라인 행간 설정
    /// - Parameters:
    ///   - lineSpacing: 라인간격
    func setLineSpacing(lineSpacing: CGFloat) {
        if let text = self.text {
            let attributedStr = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineSpacing
            style.alignment = .center
            attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, attributedStr.length))
            self.attributedText = attributedStr
        }
    }
}
