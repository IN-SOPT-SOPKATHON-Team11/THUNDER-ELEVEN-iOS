//
//  CollectionViewCell.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 김담인 on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class WriteTagCollectionViewCell: UICollectionViewCell {
    
    static let id = "writeTagCollectionViewCell"
    
    // MARK: - Properties
    let contentLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .contents2Regular
        $0.textColor = .black
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .white
                contentLabel.textColor = .black
            } else {
                contentView.backgroundColor = .mainOrange
                contentLabel.textColor = .white
            }
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
        setUI()
    }
    
    // MARK: - UI
    private func setLayout() {
        contentView.addSubviews([contentLabel])
        
        contentLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setUI() {
        contentView.backgroundColor = .gray01
        contentView.makeRounded(cornerRadius: contentView.frame.height / 2)
    }
    
    // MARK: - Functions
    func setData(data: String) {
        contentLabel.text = data
    }
}
