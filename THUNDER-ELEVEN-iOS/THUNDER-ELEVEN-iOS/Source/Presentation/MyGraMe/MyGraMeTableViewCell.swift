//
//  MyGraMeTableViewCell.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 정채은 on 2022/11/20.
//

import UIKit
import SnapKit
import Then
import SwiftyColor

// MARK: - MyGraMeTableViewCell

class MyGraMeTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "MyGraMeTableViewCell"
    
    //MARK: - UI Components
    
    private let graMeContainerView = UIView()
    private let writeLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "contents3_bold", size: 14)
        $0.text = "00님이 작성한"
    }
    private let dateLabel = UILabel().then{
        $0.textColor = 0x8E8E93.color
        $0.font = UIFont(name: "Description1", size: 12)
    }
    private let firstImageView = UIImageView()
    private let firstLabel = UILabel().then{
        $0.font = UIFont(name: "contents2_bold", size: 16)
        $0.text = "첫인상"
        $0.textColor = 0x636366.color
    }
    private let firstTagLabel = UILabel().then{
        $0.font = UIFont(name: "Header", size: 20)
    }
    private let nowImageView = UIImageView()
    private let nowLabel = UILabel().then{
        $0.font = UIFont(name: "contents2_bold", size: 16)
        $0.text = "현인상"
        $0.textColor = 0x636366.color
    }
    private let nowTagLabel = UILabel().then{
        $0.font = UIFont(name: "Header", size: 20)
    }
    private let historyLabel = UILabel().then{
        $0.font = UIFont(name: "contents2_regular", size: 16)
        $0.text = "그래미 히스토리"
    }
    private let historyImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_next")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Extensions

extension MyGraMeTableViewCell {
    private func layout(){
        backgroundColor = .white
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        
        [graMeContainerView, writeLabel, dateLabel, firstImageView, firstLabel, firstTagLabel, nowImageView, nowTagLabel, nowLabel, historyLabel, historyImageView].forEach{
            contentView.addSubview($0)
        }
        
        writeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(17)
            $0.leading.equalToSuperview().offset(14)
        }
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(writeLabel.snp.top)
            $0.trailing.equalToSuperview().offset(-14)
        }
        firstImageView.snp.makeConstraints{
            $0.top.equalTo(writeLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(14)
            $0.height.equalTo(24)
            $0.width.equalTo(16)
        }
        firstLabel.snp.makeConstraints{
            $0.top.equalTo(firstImageView.snp.top)
            $0.leading.equalTo(firstImageView.snp.trailing).offset(4)
        }
        firstTagLabel.snp.makeConstraints{
            $0.top.equalTo(firstLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(14)
        }
        nowImageView.snp.makeConstraints{
            $0.top.equalTo(firstImageView.snp.top)
            $0.leading.equalToSuperview().offset(140)
            $0.height.equalTo(24)
            $0.width.equalTo(16)
        }
        nowLabel.snp.makeConstraints{
            $0.top.equalTo(nowImageView.snp.top)
            $0.leading.equalTo(nowImageView.snp.leading).offset(-4)
        }
        nowTagLabel.snp.makeConstraints{
            $0.top.equalTo(nowLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nowImageView.snp.leading)
        }
        historyLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(37)
            $0.bottom.equalToSuperview().offset(17)
        }
        historyImageView.snp.makeConstraints{
            $0.leading.equalTo(historyLabel.snp.trailing)
            $0.bottom.equalTo(historyLabel.snp.bottom)
        }
    }
    func dataBind(model:MyGraMeModel) {
        writeLabel.text = model.name
        dateLabel.text = model.date
        firstImageView.image = UIImage(named: model.firstImage)
        firstTagLabel.text = model.first
        nowImageView.image = UIImage(named: model.nowImage)
        nowTagLabel.text = model.now
        
    }
}
