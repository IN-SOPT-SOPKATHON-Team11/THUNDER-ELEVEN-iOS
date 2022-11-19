//
//  ReviewWriteViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 김담인 on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class ReviewWriteViewController: UIViewController {
    
    private let writeScrollView = UIScrollView()
    
    private let headTitle = UILabel().then {
        $0.text = "이러쿵님의 인상기록을 위해 4가지만 답변해주세요!"
        $0.setColor(to: "4가지", with: .mainOrange)
    }
    
    private let firstQuestion = UILabel().then {
        $0.text = "1 어떤 인상인가요?"
        $0.setColor(to: "1", with: .mainOrange)
    }
    
    private let firstButton = UIButton().then {
        $0.setTitle("첫인상", for: .normal)
        $0.setBackgroundColor(.mainOrange, for: .selected)
        $0.setBackgroundColor(.white, for: .normal)
        $0.setBackgroundColor(.white, for: .disabled)
        $0.setTitleColor(.white, for: .selected)
        $0.setTitleColor(.black, for: .normal)
        $0.makeRounded(cornerRadius: 18)
    }
    
    private let secondButton = UIButton().then {
        $0.setTitle("현인상", for: .normal)
        $0.setBackgroundColor(.mainOrange, for: .selected)
        $0.setBackgroundColor(.white, for: .normal)
        $0.setBackgroundColor(.white, for: .disabled)
        $0.setTitleColor(.white, for: .selected)
        $0.setTitleColor(.black, for: .normal)
        $0.makeRounded(cornerRadius: 18)
    }
    
    private let secondQuestion = UILabel().then {
        $0.text = "2 어떤 동물과 비슷한가요?"
        $0.setColor(to: "2", with: .mainOrange)
    }
    
    private let animalStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }
    
    private let firstAnimal = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "img_bear_default"), for: .normal)
    }
    
    private let secondAnimal = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "img_lion_default"), for: .normal)
    }
    
    private let thirdAnimal = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "img_rabbit_default"), for: .normal)
    }
    
    private let thirdQuestion = UILabel().then {
        $0.text = "3 성격 키워드를 모두 선택해주세요."
        $0.setColor(to: "3", with: .mainOrange)
    }
    
    private let tagCollectionView = UICollectionView()
    
    private let fourthQuestion = UILabel().then {
        $0.text = "4 코멘트를 남겨주세요."
        $0.setColor(to: "4", with: .mainOrange)
    }
    
    private let commentTextField = UITextField().then {
        $0.placeholder = "친구의 모습에 대해 어떤 이야기를 남겨줄까요?"
        $0.clearButtonMode = .whileEditing
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.gray05.cgColor
        $0.addLeftPadding(17)
    }
    
    private let writeReivewButton = UIButton().then {
        $0.setTitle("기록 남기기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .gray03
        $0.layer.cornerRadius = 8
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray01
        addTarget()
        setLayout()
    }
    
    private func setupViews() {
        view.addSubviews([writeScrollView])
        writeScrollView.addSubviews([headTitle, firstQuestion, firstButton, secondButton, secondQuestion, animalStackView,thirdQuestion, fourthQuestion])
        animalStackView.addSubviews([firstAnimal, secondAnimal, thirdAnimal])
    }
    
    private func setLayout() {
        
    }
    
    private func setRadioButtonSelectStatus(button: UIButton, isSelected: Bool) {
        button.isSelected = isSelected
    }
    
    func addTarget() {
        firstButton.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
    }
    
//    @objc private func pushtToReviewWriteVC() {
//        let reviewWriteVC = ReviewWriteViewController()
//        self.navigationController?.pushViewController(reviewWriteVC, animated: true)
//    }
    
    @objc private func toggleButton() {
        if firstButton.isSelected == true {
            firstButton.isSelected = false
            secondButton.isSelected = true
        }else {
            firstButton.isSelected = true
            secondButton.isSelected = false
        }
    }

}
extension UILabel {
    /// 특정 문자열 컬러 변경하는 메서드
    func setColor(to targetString: String, with color: UIColor) {
        if let labelText = self.text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.foregroundColor,
                                          value: color,
                                          range: (labelText as NSString).range(of: targetString))
            attributedText = attributedString
        }
    }
    
    /// 특정 문자열 폰트 변경하는 메서드
    func setFont(to targetString: String, with font: UIFont) {
        if let labelText = self.text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.font,
                                          value: font,
                                          range: (labelText as NSString).range(of: targetString))
            attributedText = attributedString
        }
    }
}

extension UIButton {
        /// 버튼 Background Color를 상태별로 지정하는 메서드
        func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
            let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
            
            UIGraphicsBeginImageContext(minimumSize)
            
            if let context = UIGraphicsGetCurrentContext() {
                context.setFillColor(color.cgColor)
                context.fill(CGRect(origin: .zero, size: minimumSize))
            }
            
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self.clipsToBounds = true
            self.setBackgroundImage(colorImage, for: state)
        }
}

extension UIView {
    /// UIView 의 모서리가 둥근 정도를 설정하는 메서드
    func makeRounded(cornerRadius : CGFloat?) {
        if let cornerRadius_ = cornerRadius {
            self.layer.cornerRadius = cornerRadius_
        }  else {
            // cornerRadius 가 nil 일 경우의 default
            self.layer.cornerRadius = self.layer.frame.height / 2
        }
        
        self.layer.masksToBounds = true
    }
}
