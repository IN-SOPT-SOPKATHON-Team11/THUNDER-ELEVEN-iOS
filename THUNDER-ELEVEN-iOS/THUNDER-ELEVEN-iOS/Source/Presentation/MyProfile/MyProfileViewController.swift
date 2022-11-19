//
//  MyProfileViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import UIKit
import Moya

class MyProfileViewController: UIViewController {
    private let userProvider = MoyaProvider<MyProfileRouter>(
        plugins: [ NetworkLoggerPlugin() ]
    )

    private var routerResponse: UserInfo?
//    private var userName: String
//    private var firstImage: String
//    private var firstAnimal: String
//    private var secondImage: String
//    private var secondAnimal: String
    
    private let whatImpressionLabel: UILabel = UILabel().then {
        $0.font = .header1
    }
    
    private let firstImpressionLabel: UILabel = UILabel().then {
        $0.font = .contents2Bold
    }
    private let firstImpressionImageView: UIImageView = UIImageView().then {
        $0.backgroundColor = .black
    }
    private let firstImpressionAnimalLabel: UILabel = UILabel().then {
        $0.backgroundColor = .subYellow
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .contents2Bold
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private let secondImpressionLabel: UILabel = UILabel().then {
        $0.font = .contents2Bold
    }
    private let secondImpressionImageView: UIImageView = UIImageView().then {
        $0.backgroundColor = .mainOrange
    }
    private let secondImpressionAnimalLabel: UILabel = UILabel().then {
        $0.backgroundColor = .subYellow
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .contents2Bold
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        getProfile()
    }
}
extension MyProfileViewController{
    private func getProfile(){
        userProvider.request(.getMyProfile) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status<300{
                    do{
                        self.routerResponse = try result.map(MyProfileResponse.self).data
                        print(self.routerResponse)
                        self.setDataBind(self.routerResponse?.user.nickname ?? "현우",
                                         firstTag: self.routerResponse?.firstImpression.tag ?? "사나운",
                                         firstAnimal: self.routerResponse?.firstImpression.animal ?? "사자111" ,
                                         secondTag: self.routerResponse?.currentImpression.tag ?? "낙관적인",
                                         secondAnimal: self.routerResponse?.currentImpression.animal ?? "곰")
                        print("2222")
                    }
                    catch(let error){
                        print("실패!")
                        print(error.localizedDescription)
                    }
                }
                else if status >= 400{
                    print("이상한 요청 보내지 마세요;;")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    private func setDataBind(_ name: String, firstTag: String, firstAnimal: String, secondTag: String, secondAnimal: String){
        whatImpressionLabel.text = "\(name)님은 어떤 인상일까요?"
        whatImpressionLabel.setColor(to: name, with: .mainOrange)
        firstImpressionLabel.text = "첫인상"
        secondImpressionLabel.text = "현인상"
        firstImpressionAnimalLabel.text = "\(firstTag) \(firstAnimal)"
        secondImpressionAnimalLabel.text = "\(secondTag) \(secondAnimal)"
    }
    private func setUI(){
        
    }
    private func setLayout(){
        view.setGradient(color1: .subYellow, color2: .white)
        view.addSubviews([whatImpressionLabel, firstImpressionLabel,
                          firstImpressionImageView, firstImpressionAnimalLabel,
                          secondImpressionLabel, secondImpressionImageView, secondImpressionAnimalLabel])
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
        firstImpressionAnimalLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstImpressionImageView.snp.bottom)
            make.width.equalTo(106)
            make.height.equalTo(32)
        }
        
        secondImpressionLabel.snp.makeConstraints { make in
            make.top.equalTo(firstImpressionAnimalLabel.snp.bottom).offset(55)
            make.centerX.equalToSuperview()
        }
        secondImpressionImageView.snp.makeConstraints { make in
            make.top.equalTo(secondImpressionLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(168)
        }
        secondImpressionAnimalLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondImpressionImageView.snp.bottom)
            make.width.equalTo(106)
            make.height.equalTo(32)
        }
    }
}
