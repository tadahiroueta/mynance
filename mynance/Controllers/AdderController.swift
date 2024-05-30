//
//  AdderController.swift
//  mynance
//
//  Created by Ueta, Lucas T on 4/30/24.
//

import UIKit

class AdderController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var tableCells: [UITableViewCell] = []
    var tableCellHeights: [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add transaction"
        
        view.backgroundColor = .systemGray6
        
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "inputCell")
        table.delegate = self
        table.dataSource = self
        table.sizeToFit()
        table.backgroundColor = .white
        table.layer.cornerRadius = 10
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        let headerCell = UITableViewCell(style: .default, reuseIdentifier: "inputCell")
        tableCells.append(headerCell)
        tableCellHeights.append(100)
        
        let header = UIStackView()
        header.axis = .vertical
        header.alignment = .trailing
        header.spacing = 10
        headerCell.contentView.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: headerCell.topAnchor, constant: 10).isActive = true
        header.rightAnchor.constraint(equalTo: headerCell.rightAnchor, constant: -10).isActive = true
        // TODO resize to nicer
        let amountLabel = UILabel()
        amountLabel.text = "Amount"
        amountLabel.font = .boldSystemFont(ofSize: 17)
        header.addArrangedSubview(amountLabel)
        
        let amountField = UITextField()
        amountField.placeholder = "$0.00"
        amountField.font = .boldSystemFont(ofSize: 36)
        header.addArrangedSubview(amountField)
        
        let pickerCell = UITableViewCell()
        tableCells.append(pickerCell)
        tableCellHeights.append(300)
        
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        pickerCell.contentView.addSubview(picker)
        
        let descriptionCell = UITableViewCell()
        tableCells.append(descriptionCell)
        tableCellHeights.append(50)
        
        let descriptionField = UITextField()
        descriptionField.placeholder = "Description"
        descriptionCell.contentView.addSubview(descriptionField)
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        descriptionField.widthAnchor.constraint(equalTo: descriptionCell.widthAnchor, constant: -20).isActive = true
        
        table.heightAnchor.constraint(greaterThanOrEqualToConstant: tableCellHeights.reduce(0, +)).isActive = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return tableCells.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { return tableCells[indexPath.row] } // maybe change to section
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return tableCellHeights[indexPath.row] }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return 3 }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return "Income" }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { // TODO
    }
}
