//
//  ViewController.swift
//  MVP+Router+Assembler
//
//  Created by Dima Biliy on 29.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var presenter : MainPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = true
        tableView.register(TableViewCellStars.self, forCellReuseIdentifier: TableViewCellStars.identifier)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MainViewController : MainViewProtocol{
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}


//MARK:- UITableViewDataSource
extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellStars.identifier, for: indexPath as IndexPath) as! TableViewCellStars
        cell.setupLabelData(presenter.comments?[indexPath.row].body ?? "")
        return cell
    }
}

//MARK:- UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell")
        let comment = presenter.comments?[indexPath.row]
        presenter.tapOnTheComment(comment: comment)
    }
}

