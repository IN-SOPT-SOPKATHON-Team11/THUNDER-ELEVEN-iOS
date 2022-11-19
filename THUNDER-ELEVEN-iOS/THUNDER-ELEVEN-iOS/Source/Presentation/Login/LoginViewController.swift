//
//  LoginViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import UIKit
import SwiftUI

import SnapKit
import Then
import Moya

class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    private let logoImage: UIImageView = {
        let img = UIImageView(image: Const.Image.img_logo)
        return img
    }()
    
    private let userIDLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임"
        return label
    }()
    
    private let userIDTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.placeholder = "닉네임을 입력해주세요"
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .mainOrange
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .header3
        button.addTarget(self, action: #selector(submitButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("아직 회원이 아니신가요?", for: .normal)
        button.titleLabel?.font = .contents2Regular
        button.setTitleColor(.gray08, for: .normal)
        return button
    }()
    
    // MARK: - Property
    let loginProvider = MoyaProvider<LoginRouter>(plugins: [NetworkLoggerPlugin()])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - Function
    
    private func postLogin(loginRequest: LoginRequest) {
        let loginRequest: LoginRequest = loginRequest
        loginProvider.request(.postLogin(param: loginRequest)) { response in
            switch response {
            case .success(let data):
                let status = data.statusCode
                if status == 200 {
                    print("⚡️",response)
                    do {
                        let response = try data.map(Login.self)
                        UserDefaults.standard.set(response.accessToken, forKey: "token")
                    }
                    catch(let error) {
                        print(error.localizedDescription)
                    }
                    UIApplication.shared.windows.first?.rootViewController = MyProfileViewController()
//                    let mainViewController = MyProfileViewController()
//                    let navigationController = UINavigationController(rootViewController: mainViewController)
//                    let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//                    guard let delegate = sceneDelegate else { return }
//                    delegate.window?.rootViewController = navigationController
//                    /keyWindow?.replaceRootViewController(MyProfileViewController, animated: true, completion: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        
        view.addSubviews(logoImage, userIDLabel, userIDTextField, passwordLabel, passwordTextField, submitButton, signupButton)
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
        }
        userIDLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(logoImage.snp.bottom).offset(60)
        }
        userIDTextField.snp.makeConstraints { make in
            make.top.equalTo(userIDLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(60)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        passwordLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(userIDTextField.snp.bottom).offset(30)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(60)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(60)
        }
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(submitButton.snp.bottom).offset(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Objc Function
    @objc private func submitButtonDidTap() {
        guard let id = userIDTextField.text else { return }
        guard let pw = passwordTextField.text else { return }
        let request = LoginRequest(nickname: id, password: pw)
        postLogin(loginRequest: request)
    }
}
//
//struct UIViewPreview<View: UIView>: UIViewRepresentable {
//    let view: View
//    
//    init(_ builder: @escaping () -> View) {
//        view = builder()
//    }
//    
//    func makeUIView(context: Context) -> UIView {
//        return view
//    }
//    
//    func updateUIView(_ view: UIView, context: Context) {
//        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
//    }
//}
//
//struct LoginViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        Container().edgesIgnoringSafeArea(.all)
//    }
//    
//    struct Container: UIViewControllerRepresentable {
//        func makeUIViewController(context: Context) -> UIViewController {
//            let loginViewController = LoginViewController()
//            return UINavigationController(rootViewController: loginViewController)
//        }
//        
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//            typealias UIViewControllerType = UIViewController
//        }
//    }
//}

