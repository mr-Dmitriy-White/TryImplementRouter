//
//  DetailViewController.swift
//  MVP+Router+Assembler
//
//  Created by Dima Biliy on 29.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter : DetailViewPresenterProtocol!
    
    private let hugeLabel:UILabel = {
        let label = UILabel()
        label.text = "Tap the button to get greeting"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.layer.zPosition = 2
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var getGreeting: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.setTitle("Back", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(hugeLabel)
        hugeLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0).isActive = true
        hugeLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        hugeLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        hugeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = true
        
        view.addSubview(getGreeting)
        getGreeting.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getGreeting.bottomAnchor.constraint(equalTo: hugeLabel.bottomAnchor, constant: -50).isActive = true
        getGreeting.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        getGreeting.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        getGreeting.addTarget(self, action: #selector(getGreetingSelector), for: .touchUpInside)
        
        presenter.setComment()
    }
    
    @objc func getGreetingSelector(){
        presenter.tap()
    }
}

extension DetailViewController : DetailViewProtocol {
    func setComment(comment: Comment?) {
        hugeLabel.text = comment?.body
    }
}

