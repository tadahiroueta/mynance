//
//  ViewController.swift
//  mynance
//
//  Created by Ueta, Lucas T on 4/18/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        let body = UIStackView()
        body.axis = .vertical
        body.spacing = 15
        body.alignment = .leading
        view.addSubview(body)
        body.translatesAutoresizingMaskIntoConstraints = false
        body.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        body.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        body.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
    
        let addStack = UIStackView()
        addStack.axis = .vertical
        addStack.alignment = .trailing
        body.addArrangedSubview(addStack)
        addStack.translatesAutoresizingMaskIntoConstraints = false
        addStack.widthAnchor.constraint(equalTo: body.widthAnchor).isActive = true
        
        
        let addIcon = UIButton()
        addIcon.setImage(UIImage(systemName: "plus"), for: .normal)
        addIcon.tintColor = .systemBlue
        addIcon.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        addStack.addArrangedSubview(addIcon)
        addIcon.translatesAutoresizingMaskIntoConstraints = false
        if let imageView = addIcon.imageView {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        }
        
        let header = UILabel()
        header.text = "Mynance"
        header.font = .boldSystemFont(ofSize: 36)
        body.addArrangedSubview(header)
        
        let content = UIStackView()
        content.axis = .vertical
        body.addArrangedSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        content.widthAnchor.constraint(equalTo: body.widthAnchor).isActive = true
        
        let contentHeader = UILabel()
        contentHeader.text = "Balance"
        contentHeader.font = .systemFont(ofSize: 18)
        contentHeader.textColor = .systemGray
        content.addArrangedSubview(contentHeader)
        
        let balanceLabel = UILabel()
        balanceLabel.text = "$2,720.00"
        balanceLabel.font = .boldSystemFont(ofSize: 44)
        content.addArrangedSubview(balanceLabel)
        
        let table = UITableView(frame: content.bounds)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "transactionCell")
        table.delegate = self
        table.dataSource = self
        table.sizeToFit()
        table.layer.cornerRadius = 10
        content.addArrangedSubview(table)
        content.setCustomSpacing(20, after: balanceLabel)
        table.translatesAutoresizingMaskIntoConstraints = false
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 3 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { return TransactionCell() }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 90 }
    
    @objc func handleAdd() { present(AdderController(), animated: true) }
    
}

