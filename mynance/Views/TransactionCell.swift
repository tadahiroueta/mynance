//
//  TransactionCell.swift
//  mynance
//
//  Created by Ueta, Lucas T on 4/18/24.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        let contentStack = UIStackView()
        contentStack.distribution = .equalSpacing
        contentStack.alignment = .top
        contentView.addSubview(contentStack)
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        contentStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        contentStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        let leftSide = UIStackView()
        leftSide.spacing = 10
        leftSide.alignment = .top
        contentStack.addArrangedSubview(leftSide)
        leftSide.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIView()
        icon.backgroundColor = .systemBlue
        icon.layer.cornerRadius = 10
        leftSide.addArrangedSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        let image = UIImageView(image: UIImage(systemName: "dollarsign.circle.fill"))
        image.tintColor = .white
        icon.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerYAnchor.constraint(equalTo: icon.centerYAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: icon.centerXAnchor).isActive = true
        
        let leftSideText = UIStackView()
        leftSideText.axis = .vertical
        leftSideText.spacing = 8
        leftSide.addArrangedSubview(leftSideText)
        
        let categoryLabel = UILabel()
        categoryLabel.text = "Income"
        categoryLabel.font = .boldSystemFont(ofSize: 17)
        leftSideText.addArrangedSubview(categoryLabel)
        
        let nameLabel = UILabel()
        nameLabel.text = "Paycheck"
        nameLabel.font = .systemFont(ofSize: 12)
        leftSideText.addArrangedSubview(nameLabel)
        
        let rightSide = UIStackView()
        rightSide.axis = .vertical
        rightSide.spacing = 8
        rightSide.alignment = .trailing
        contentStack.addArrangedSubview(rightSide)
        
        let amountLabel = UILabel()
        amountLabel.text = "$5,000.00"
        amountLabel.font = .boldSystemFont(ofSize: 17)
        rightSide.addArrangedSubview(amountLabel)
        
        let dateLabel = UILabel()
        dateLabel.text = "Jan 26, 2022"
        dateLabel.font = .systemFont(ofSize: 12)
        rightSide.addArrangedSubview(dateLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
