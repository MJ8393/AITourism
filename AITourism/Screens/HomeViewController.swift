//
//  HomeViewController.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import UIKit
import SnapKit

struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}

class HomeViewController: UIViewController {
    
    var selectedRow: Int = -1
    var isCollapse: Bool = false
    let tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        /// Setup the Alan button
        configureUI()
        configureTableView()
        addSubviews()
        setConstraints()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("cell1"), object: nil, queue: nil) { _ in
            self.changeCell1()
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("cell2"), object: nil, queue: nil) { _ in
            self.changeCell2()
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("cell3"), object: nil, queue: nil) { _ in
            self.changeCell3()
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("cell4"), object: nil, queue: nil) { _ in
            self.changeCell4()
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("cell5"), object: nil, queue: nil) { _ in
            self.changeCell5()
        }
    }
    
    private func changeCell1() {
        selectedRow = 0
        isCollapse = true
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    private func changeCell2() {
        selectedRow = 1
        isCollapse = true
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    private func changeCell3() {
        selectedRow = 2
        isCollapse = true
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    private func changeCell4() {
        selectedRow = 3
        isCollapse = true
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    private func changeCell5() {
        selectedRow = 4
        isCollapse = true
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    private func configureUI() {
        configureBackgroundColor(whiteColor)
        configureNavBar("About", true, mainColor, whiteColor)
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseID)
    }

    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalTo(view)
            make.top.equalTo(view)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedRow == indexPath.row && isCollapse == true { return 240 }
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setContent(question: questions[indexPath.row])
        cell.arrayImageView.image = isCollapse ? UIImage(named: "up-arrow") : UIImage(named: "down-arrow")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: MainTableViewCell = tableView.cellForRow(at: indexPath) as! MainTableViewCell
        if selectedRow == indexPath.row {
            if isCollapse == false {
                isCollapse = true
                cell.arrayImageView.image = UIImage(named: "up-arrow")
            } else {
                isCollapse = false
                cell.arrayImageView.image = UIImage(named: "down-arrow")
            }
        } else {
            isCollapse = true
            cell.arrayImageView.image = UIImage(named: "up-arrow")
            if selectedRow != -1 {
                let indexPath = IndexPath(row: selectedRow, section: 0)
                let cell1: MainTableViewCell = tableView.cellForRow(at: indexPath) as! MainTableViewCell
                cell1.arrayImageView.image = UIImage(named: "down-arrow")
            }
        }
        selectedRow = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}
