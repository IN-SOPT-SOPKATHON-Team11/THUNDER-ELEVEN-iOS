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
import Moya

//struct UserLog {
//    var
//}
class UserLogViewController: UIViewController {
    
    let image: [UIImage?] = [Const.Image.bear_bus, Const.Image.bear_lab, Const.Image.bear_steve, Const.Image.lion_doctor, Const.Image.lion_romance, Const.Image.rabbit_cute
    ]
    private var userID: String = ""
    
    private var userLogs: UserLogs?
    
    private let userProvider = MoyaProvider<UserLogRouter>(
        plugins: [ NetworkLoggerPlugin() ]
    )
    
    private let userLogTableView: UITableView = UITableView(frame: .zero, style: .grouped).then {
        UserLogTableViewCell.register(target: $0)
        
        $0.register(UserLogTableViewHeaderView.self,
                    forHeaderFooterViewReuseIdentifier: UserLogTableViewHeaderView.className)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setDataBind("서린")
    }
}
extension UserLogViewController {
    public func setDataBind(_ userID: String){
        self.userID = userID //->헤더뷰
        
        userProvider.request(.getUsersImpressionLog) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status<300{
                    do{
                        self.userLogs = try result.map(UsersLogResponseDto.self).data
                        self.userLogTableView.reloadData()
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
    private func setUI(){
        view.backgroundColor = .gray01
        userLogTableView.separatorStyle = .none
    }
    private func setDelegate(){
        userLogTableView.delegate = self
        userLogTableView.dataSource = self
    }
    private func setLayout(){
        view.addSubview(userLogTableView)
        userLogTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension UserLogViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userLogs?.logs.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userLogTableView.dequeueReusableCell(withIdentifier: UserLogTableViewCell.className, for: indexPath) as? UserLogTableViewCell else {return UserLogTableViewCell()}

        let tag: String = (userLogs?.logs[indexPath.row].impression.tag) ?? "사나운"
        let animal: String = userLogs?.logs[indexPath.row].impression.animal ?? "사자"
        let comment: String = userLogs?.logs[indexPath.row].comment ?? "ㅇㅇ이랬는데 ㅇㅇㅇ이랬어요"
        cell.setDataBind(animalString: tag+animal, date: "2022/11/18", animalSeq: 1, comment: comment)
        cell.selectionStyle = .none
        let num = Int.random(in: 0...5)
        cell.animalImageView.image = self.image[num]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 168
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let tableViewHeaderView = userLogTableView.dequeueReusableHeaderFooterView(withIdentifier: UserLogTableViewHeaderView.className) as? UserLogTableViewHeaderView else { return UIView() }
        tableViewHeaderView.setDataBind(userID)
        return tableViewHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 96
    }
}
