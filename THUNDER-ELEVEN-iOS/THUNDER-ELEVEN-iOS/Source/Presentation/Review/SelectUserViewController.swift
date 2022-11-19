//
//  SelectUserViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 김담인 on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class SelectUserViewController: UIViewController {
    
    private let selectHeadLabel = UILabel().then {
        $0.text = "누구의 인상을 기록할까요?"
        $0.font = .header1
    }
    
    private let selectTextField = UITextField().then {
        $0.placeholder = "ex) 이러쿵"
        $0.clearButtonMode = .whileEditing
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.gray05.cgColor
        $0.addLeftPadding(17)
    }
    
    private let sendToReivewButton = UIButton().then {
        $0.setTitle("기록 하러 가기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .gray03
        $0.layer.cornerRadius = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray01
        setupViews()
        setupLayout()
        addTarget()
    }
    
    func addTarget() {
        sendToReivewButton.addTarget(self, action: #selector(pushtToReviewWriteVC), for: .touchUpInside)
    }
    
    @objc private func pushtToReviewWriteVC() {
        let reviewWriteVC = ReviewWriteViewController()
        self.navigationController?.pushViewController(reviewWriteVC, animated: true)
    }
    
    func setupViews() {
        self.view.addSubviews([selectHeadLabel,selectTextField,sendToReivewButton])
        
    }
    
    func setupLayout() {
        selectHeadLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(46)
            $0.leading.equalToSuperview().offset(22)
        }
        
        selectTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(selectHeadLabel.snp.bottom).offset(80)
            $0.height.equalTo(60)
        }
        
        sendToReivewButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(selectTextField.snp.bottom).offset(24)
            $0.height.equalTo(60)
            
        }
        
    }

}
