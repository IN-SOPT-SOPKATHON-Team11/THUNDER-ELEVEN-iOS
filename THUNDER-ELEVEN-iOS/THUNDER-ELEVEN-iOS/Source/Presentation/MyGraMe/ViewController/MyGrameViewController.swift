//
//  MyGrameViewController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import UIKit
import SnapKit
import Then
import SwiftyColor
import Moya

final class MyGrameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let vc = UserLogViewController()
            vc.setDataBind("")
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        if(indexPath.row == 1){
            let vc = UserLogViewController()
            vc.setDataBind("")
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        if(indexPath.row == 2){
            let vc = UserLogViewController()
            vc.setDataBind("")
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 98
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let tableViewHeaderView = myGraMeTableView.dequeueReusableHeaderFooterView(withIdentifier: MyGraMeTableViewHeaderView.identifier) as? MyGraMeTableViewHeaderView else { return UIView() }
//        myGraMeTableView.setDataBind(userID)
        return tableViewHeaderView
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath:
                   IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGraMeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let myGraMeCell = tableView.dequeueReusableCell(withIdentifier: MyGraMeTableViewCell.identifier, for: indexPath)
                as? MyGraMeTableViewCell else {return UITableViewCell()}
        myGraMeCell.dataBind(model: myGraMeList[indexPath.row])
        myGraMeCell.selectionStyle = .none
        return myGraMeCell
    }

    
    
    private lazy var myGraMeTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MyGraMeTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: MyGraMeTableViewHeaderView.identifier)
        return tableView
    } ()
    
    var myGraMeList: [MyGraMeModel] = [
        MyGraMeModel(name: "송현", date: "2022/11/22", first: "연구원 곰", firstImage: "", now: "과제 버스기사 곰", nowImage: ""),
        MyGraMeModel(name: "안누", date: "2022/11/22", first: "스티브 잡스 곰", firstImage: "", now: "낭만 시인 사자", nowImage: ""),
        MyGraMeModel(name: "정연", date: "2022/11/22", first: "사나운 사자", firstImage: "", now: "귀여운 토끼", nowImage: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = 0xF5F5F5.color
        register()
        layout()
    }
}

extension MyGrameViewController {
    private func layout() {
        view.backgroundColor = 0xF5F5F5.color
        view.addSubview(myGraMeTableView)
        myGraMeTableView.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(view.safeAreaInsets)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(180 * myGraMeList.count)
        }
    }
    
    private func register() {
        myGraMeTableView.register(MyGraMeTableViewCell.self,
            forCellReuseIdentifier: MyGraMeTableViewCell.identifier)
        myGraMeTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
    }
    
    
    
}


