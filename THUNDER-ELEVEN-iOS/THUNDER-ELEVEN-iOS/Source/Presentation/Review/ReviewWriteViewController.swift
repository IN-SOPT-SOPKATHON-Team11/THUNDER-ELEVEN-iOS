//
//  ReviewWriteViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 김담인 on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class ReviewWriteViewController: UIViewController, UICollectionViewDelegate {
    
    private let writeScrollView = UIScrollView()
    private let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let naviButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ic_chevron-left"), for: .normal)
    }
    
    private let sendToReivewButton = UIButton().then {
        $0.setTitle("기록 남기기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .gray03
        $0.layer.cornerRadius = 8
    }
    
    private let headTitle = UILabel().then {
        $0.text = "이러쿵님의 인상기록을 위해 4가지만 답변해주세요!"
        $0.setColorD(to: "4가지", with: .mainOrange)
    }
    
    private let firstQuestion = UILabel().then {
        $0.text = "1 어떤 인상인가요?"
        $0.setColorD(to: "1", with: .mainOrange)
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
        $0.setColorD(to: "2", with: .mainOrange)
    }
    
    private let animalStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 16
    }
    
    private let firstAnimal = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "img_bear_gray"), for: .normal)
        $0.setBackgroundImage(UIImage(named: "img_bear_default"), for: .selected)
        
    }
    
    private let secondAnimal = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "img_lion_gray"), for: .normal)
        $0.setBackgroundImage(UIImage(named: "img_bear_default"), for: .selected)
    }
    
    private let thirdAnimal = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "img_rabbit_gray"), for: .normal)
        $0.setBackgroundImage(UIImage(named: "img_bear_default"), for: .selected)
    }
    
    private let thirdQuestion = UILabel().then {
        $0.text = "3 성격 키워드를 모두 선택해주세요."
        $0.setColorD(to: "3", with: .mainOrange)
    }
    
//    private let tagCollectionView = UICollectionView()
    
    private let fourthQuestion = UILabel().then {
        $0.text = "4 코멘트를 남겨주세요."
        $0.setColorD(to: "4", with: .mainOrange)
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
    
    private let characterTagCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .gray01
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = false
    }
    
    let tagDatas = ["활발한", "조용한", "낙관적인", "신중한", "겸손한", "똑똑한", "도전적인", "자신감 있는", "평화로운", "자유로운", "이성적인", "감성적인", "사랑스러운", "귀여운", "호기심 많은" ]
    
    private let tagCellHeight = 37
    private let cellVerticalSpacing = 10
    
    private let leftCVLayoutForFeel = LeftAlignedCollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 5
        $0.sectionInset = .zero
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .gray01
        setupViews()
        setLayout()
        setToggleButton()
        addTarget()
        setTagCV()
        registerCell()
        sleep(5)
        let VC = DoneReviewViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    private func setupViews() {
        view.addSubviews([writeScrollView])
        writeScrollView.addSubviews([contentView])
        contentView.addSubviews([naviButton, headTitle, firstQuestion, firstButton, secondButton, secondQuestion, animalStackView,thirdQuestion, fourthQuestion, characterTagCV, sendToReivewButton])
        animalStackView.addArrangedSubviews([firstAnimal, secondAnimal, thirdAnimal])
    }
    
    private func setLayout() {
        writeScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        naviButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(14)
            $0.top.equalToSuperview()
        }
        
        headTitle.snp.makeConstraints {
            $0.top.equalTo(naviButton.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(20)
        }
        
        firstQuestion.snp.makeConstraints {
            $0.top.equalTo(headTitle.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(20)
        }
        
        firstButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.top.equalTo(firstQuestion.snp.bottom).offset(10)
            $0.height.equalTo(36)
            $0.width.equalTo(104)
        }
        
        secondButton.snp.makeConstraints {
            $0.leading.equalTo(firstButton.snp.trailing).offset(10)
            $0.centerY.equalTo(firstButton)
            $0.height.equalTo(36)
            $0.width.equalTo(104)
        }
        
        secondQuestion.snp.makeConstraints {
            $0.top.equalTo(firstButton.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(21)
        }
        
        animalStackView.snp.makeConstraints {
            $0.top.equalTo(secondQuestion.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview()
        }
        
        thirdQuestion.snp.makeConstraints {
            $0.top.equalTo(animalStackView.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(20)
        }
        
        characterTagCV.snp.makeConstraints {
            $0.top.equalTo(thirdQuestion.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(21)
            $0.width.equalTo(332)
            $0.height.equalTo(228)
        }
        
        fourthQuestion.snp.makeConstraints {
            $0.top.equalTo(characterTagCV.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(20)
        }
        
//        sendToReivewButton.snp.makeConstraints {
//            $0.top.equalTo(fourthQuestion.snp.bottom).offset(8)
//            $0.leading.equalToSuperview().offset(20)
//        }
        
        
        
//        commentTextField.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(20)
//            $0.top.equalTo(fourthQuestion.snp.bottom).offset(8)
//            $0.width.equalTo(335)
//            $0.height.equalTo(200)
//        }
        
    }
    
//    private func setRadioButtonSelectStatus(button: UIButton, isSelected: Bool) {
//        button.isSelected = isSelected
//    }
    
    func setToggleButton() {
        firstButton.isSelected = true
        firstAnimal.isSelected = true
    }
    
    func addTarget() {
        firstButton.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        firstAnimal.addTarget(self, action: #selector(animalToggleButton), for: .touchUpInside)
        secondAnimal.addTarget(self, action: #selector(animalToggleButton), for: .touchUpInside)
        thirdAnimal.addTarget(self, action: #selector(animalToggleButton), for: .touchUpInside)
        sendToReivewButton.addTarget(self, action: #selector(pushtToDoneVC), for: .touchUpInside)
    }
    
    private func setTagCV() {
        characterTagCV.dataSource = self
        characterTagCV.delegate = self
        characterTagCV.layoutMargins = .zero
        characterTagCV.allowsMultipleSelection = true
        characterTagCV.clipsToBounds = true
        characterTagCV.collectionViewLayout = leftCVLayoutForFeel
    }
    
    private func registerCell() {
        characterTagCV.register(cell: WriteTagCollectionViewCell.self, forCellWithReuseIdentifier: WriteTagCollectionViewCell.id)
    }
    
//    @objc private func pushtToReviewWriteVC() {
//        let reviewWriteVC = ReviewWriteViewController()
//        self.navigationController?.pushViewController(reviewWriteVC, animated: true)
//    }
    @objc private func pushtToDoneVC() {
        let VC = DoneReviewViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc private func toggleButton() {
        if firstButton.isSelected == true {
            firstButton.isSelected = false
            secondButton.isSelected = true
        }else {
            firstButton.isSelected = true
            secondButton.isSelected = false
        }
    }
    
    @objc private func animalToggleButton() {
        if firstAnimal.isSelected == true {
            secondAnimal.isSelected = false
            thirdAnimal.isSelected = false
        }else if secondAnimal.isSelected == true {
            firstAnimal.isSelected = false
            thirdAnimal.isSelected = false
        }else if thirdAnimal.isSelected == true {
            firstAnimal.isSelected = false
            secondAnimal.isSelected = false
        }
    }

}
// MARK: - UICollectionViewDataSource
extension ReviewWriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = UICollectionViewCell()
//        cell.backgroundColor = .red
//        return cell
        let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier: WriteTagCollectionViewCell.id, for: indexPath) as! WriteTagCollectionViewCell
            cell.setData(data: tagDatas[indexPath.row])
            return cell

    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ReviewWriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizingCell = WriteTagCollectionViewCell()
            sizingCell.setData(data: tagDatas[indexPath.row])
        
        sizingCell.contentLabel.sizeToFit()
        
        let cellWidth = sizingCell.contentLabel.frame.width + 26
        let cellHeight = tagCellHeight
        return CGSize(width: cellWidth, height: CGFloat(cellHeight))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        var indexPathPerCV = indexPath
        if let cell = collectionView.cellForItem(at: indexPath) as? WriteTagCollectionViewCell {
            cell.isSelected = true
        }else {
            collectionView.deselectItem(at: indexPath, animated: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? WriteTagCollectionViewCell {
            cell.isSelected = false
            
        }
    }
}



extension UILabel {
    /// 특정 문자열 컬러 변경하는 메서드
    func setColorD(to targetString: String, with color: UIColor) {
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

extension UICollectionView {
    func register<T: UICollectionViewCell>(cell: T.Type,
                                           forCellWithReuseIdentifier reuseIdentifier: String = T.className) {
        register(cell, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
