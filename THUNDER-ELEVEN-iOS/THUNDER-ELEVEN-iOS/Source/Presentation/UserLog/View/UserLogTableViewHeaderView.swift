//
//  UserLogTableViewHeaderView.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import UIKit

class UserLogTableViewHeaderView: UITableViewHeaderFooterView {
    
    private let userNameLabel: UILabel = UILabel().then {
        $0.font = UIFont.header1
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserLogTableViewHeaderView {
    public func setDataBind(_ userName: String){
        userNameLabel.text = "\(userName)님의 기록"
    }
    private func setLayout(){
        self.backgroundColor = .clear
        self.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(41)
            make.leading.equalToSuperview().offset(20)
        }
    }
}
