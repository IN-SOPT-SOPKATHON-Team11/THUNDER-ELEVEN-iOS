//
//  MyProfileViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import UIKit

class MyProfileViewController: UIViewController {

    private let whatImpressionLabel: UILabel = UILabel().then {
        $0.backgroundColor = .red
    }
    
    private let firstImpressionLabel: UILabel = UILabel().then {
        $0.backgroundColor = .red
    }
    private let firstImpressionImageView: UIImageView = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    private let secondImpressionLabel: UILabel = UILabel().then {
        $0.backgroundColor = .red
    }
    private let secondImpressionImageView: UIImageView = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension MyProfileViewController{
    private func setUI(){
        
    }
    private func setLayout(){
        whatImpressionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        firstImpressionLabel.snp.makeConstraints { make in
            make.top.equalTo(whatImpressionLabel.snp.bottom).offset(41)
            make.centerX.equalToSuperview()
        }
        firstImpressionImageView.snp.makeConstraints { make in
            make.top.equalTo(firstImpressionLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(168)
        }
        
        firstImpressionLabel.snp.makeConstraints { make in
            make.top.equalTo(whatImpressionLabel.snp.bottom).offset(41)
            make.centerX.equalToSuperview()
        }
        firstImpressionImageView.snp.makeConstraints { make in
            make.top.equalTo(firstImpressionLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(168)
        }
        
    }
}
