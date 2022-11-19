//
//  MyGraMeTableViewHeaderView.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 정채은 on 2022/11/20.
//

import UIKit

class MyGraMeTableViewHeaderView: UITableViewHeaderFooterView {
    static let identifier = "MyGraMeTableViewHeaderView"
    
    private var myGraMeLabel : UILabel = UILabel().then {
        $0.font = .header1
        $0.text = "나의 그래미"
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MyGraMeTableViewHeaderView {
    private func layout(){
        self.backgroundColor = .clear
        self.addSubview(myGraMeLabel)
        myGraMeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(43)
            make.leading.equalToSuperview().offset(20)
        }
    }
}
