//
//  DoneReviewViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 김담인 on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class DoneReviewViewController: UIViewController {
    private let nickname: String = "현우"
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "현우님의 첫인상이\n성공적으로 기록됐어요"
        label.font = .header1
        label.textColor = .mainOrange
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let successImage: UIImageView = {
        let img = UIImageView(image: Const.Image.img_success)
        return img
    }()
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "내 모습의 기록도 부탁할까요?"
        label.font = .header3
        label.textColor = .black
        return label
    }()
    private let copyImage: UIImageView = {
        let img = UIImageView(image: Const.Image.button_copy)
        return img
    }()
    private let helpImage: UIImageView = {
        let img = UIImageView(image: Const.Image.img_helpBalloon)
        return img
    }()
    private let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("홈으로 돌아가기", for: .normal)
        button.backgroundColor = .mainOrange
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .header3
        button.addTarget(self, action: #selector(submitButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.setGradient(color1: .subYellow, color2: .white)
    }
    
    private func setLayout() {
        view.addSubviews(successImage, titleLabel, subLabel, copyImage, helpImage, submitButton)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
        }
        successImage.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(13)
            make.width.equalTo(260)
            make.height.equalTo(202)
        }
        subLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(successImage.snp.bottom).offset(33)
        }
        copyImage.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(subLabel.snp.bottom).offset(16)
            make.width.height.equalTo(48)
        }
        helpImage.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(copyImage.snp.bottom).offset(-10)
        }
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(helpImage.snp.bottom).offset(53)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(60)
        }
    }

    // MARK: - Objc Function
    @objc private func submitButtonDidTap() {
        
    }
}
