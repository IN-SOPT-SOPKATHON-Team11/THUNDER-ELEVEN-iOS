//
//  UserLogViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import UIKit
import Then
import SwiftyColor
import SnapKit

class UserLogViewController: UIViewController {
    
    private let user: String = ""
    private let userNameLabel: UILabel = UILabel().then {
        $0.backgroundColor = .blue
        //pretend + bold + 24  크기
    }
    
    private let UserLogTableView: UITableView = UITableView().then {
        $0.backgroundColor = .red
        UserLogTableViewCell.register(target: $0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataBind("서연")
        setLayout()
    }
}
extension UserLogViewController {
    
    private func setDataBind(_ user: String){
        userNameLabel.text = "\(user)님의 기록"
    }
    
    private func setLayout(){
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(41)
            make.leading.equalToSuperview().offset(20)
        }
        UserLogTableView.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
    }
}
