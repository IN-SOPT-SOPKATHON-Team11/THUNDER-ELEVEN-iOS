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
        return myGraMeCell
    }
    
    
    private lazy var myGraMeTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    } ()
    
    var myGraMeList: [MyGraMeModel] = [
        MyGraMeModel(name: "채은", date: "2022년 11월 22일", first: "행복한 토끼", firstImage: "", now: "자신감 있는 사자", nowImage: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
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


