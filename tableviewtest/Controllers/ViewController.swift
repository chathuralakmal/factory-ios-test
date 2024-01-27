//
//  ViewController.swift
//  tableviewtest
//
//  Created by Chathura ADL on 2024-01-27.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    private var employees: [EmployeeData] = [EmployeeData]()
    @IBOutlet weak var employeeTableView: UITableView!
    var network : NetworkProtocol?
    var isFetchingData: Bool = false
    
    var nextPage: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        network = Network()
        fetchEmployees()
    }
    
    func fetchEmployees() {
        isFetchingData = true
        network?.fetchEmployees(nextPage: nextPage, completion: { [weak self] nextPageString, employeeData in
            self?.nextPage = nextPageString
            self?.employees = employeeData
            DispatchQueue.main.async {
                self?.isFetchingData = false
                self?.employeeTableView?.reloadData()
            }
        })
    }
    
    func fetchMoreOnScroll(for indexPath: IndexPath) {
        let lastRowIndex = employeeTableView.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            guard !isFetchingData || nextPage == "null" else {
                return
            }
            isFetchingData = true
            network?.fetchEmployees(nextPage: nextPage, completion: { [weak self] nextPageString, employeeData in
                self?.nextPage = nextPageString
                self?.employees.append(contentsOf: employeeData)
                self?.isFetchingData = false
                DispatchQueue.main.async {
                    self?.employeeTableView?.reloadData()
                }
            })
            
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell else {
            return UITableViewCell()
        }
   
        let employee = employees[indexPath.row]
        cell.configure(with: EmployeesViewModel(name: employee.name, division: employee.division))
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        fetchMoreOnScroll(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let employee = employees[indexPath.row]
        let detailView = DetailView(employeeData: employee)
        let detailSwiftUIController = UIHostingController(rootView: detailView)
        
        self.navigationController?.pushViewController(detailSwiftUIController, animated: true)
        
    }
}
