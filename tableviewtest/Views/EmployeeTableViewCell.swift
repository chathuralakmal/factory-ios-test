//
//  EmployeeTableViewCell.swift
//  tableviewtest
//
//  Created by Chathura ADL on 2024-01-27.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    static let identifier = "EmployeeTableViewCell"

    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeDivision: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(with model: EmployeesViewModel) {
        employeeName?.text = model.name
        employeeDivision?.text = model.division
    }
}
