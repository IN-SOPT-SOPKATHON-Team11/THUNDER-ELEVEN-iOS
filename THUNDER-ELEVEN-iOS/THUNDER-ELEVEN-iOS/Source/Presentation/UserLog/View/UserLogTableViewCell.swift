//
//  UserLogTableViewCell.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import UIKit

class UserLogTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    static var isFromNib = false
    
    private let impressionLabel: UILabel = UILabel().then {
        $0.font = .contents2Bold
        $0.textColor = .gray09
        $0.numberOfLines = 3
    }
    
    private let dateLabel: UILabel = UILabel().then {
        $0.font = .description1
        $0.textColor = .gray06
    }
    
    private let animalImageView: UIImageView = UIImageView().then {
        $0.backgroundColor = .mainOrange
        $0.layer.cornerRadius = 32
    }
    
    private let commentLabel: UILabel = UILabel().then {
        $0.font = .contents2Regular
        $0.textColor = .gray09
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 22, bottom: 24, right: 22))
    }
}
extension UserLogTableViewCell{
    public func setDataBind(animalString: String, date: String, animalSeq: Int, comment: String){
        impressionLabel.text = animalString
        dateLabel.text = date
        animalImageView.image = UIImage(named: "\(animalSeq)")
        commentLabel.text = comment
        impressionLabel.setColor(to: "첫인상", with: .mainOrange)
        impressionLabel.setColor(to: "현인상", with: .mainOrange)
    }
    private func setLayout(){
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubviews([impressionLabel, dateLabel, animalImageView, commentLabel])
        impressionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(14)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(impressionLabel)
            make.trailing.equalToSuperview().offset(-14)
        }
        animalImageView.snp.makeConstraints { make in
            make.top.equalTo(impressionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(14)
            make.width.height.equalTo(64)
        }
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(impressionLabel.snp.bottom).offset(16)
            make.leading.equalTo(animalImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-46)
        }
    }
}


extension UILabel {
    func setColor(to targetString: String, with color: UIColor) {
          if let labelText = self.text, labelText.count > 0 {
              let attributedString = NSMutableAttributedString(string: labelText)
              attributedString.addAttribute(.foregroundColor,
                                            value: color,
                                            range: (labelText as NSString).range(of: targetString))
              attributedText = attributedString
          }
      }
}
