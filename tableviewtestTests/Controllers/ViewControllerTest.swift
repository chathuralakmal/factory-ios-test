//
//  ViewControllerTest.swift
//  tableviewtestTests
//
//  Created by Chathura ADL on 2024-01-27.
//
import XCTest
@testable import tableviewtest

final class ViewControllerTest: XCTestCase {
    let employeeVC = ViewController()
    let tableView = UITableView()
    let indexPath = IndexPath(row: 0, section: 0)
    
    override func setUp() {
        super.setUp()
        employeeVC.viewDidLoad()
        employeeVC.network = NetworkSpy()
        employeeVC.fetchEmployees()
       
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    }
    
    func testReturnExpectedCharacterCell() {
        let cell = employeeVC.tableView(tableView, cellForRowAt: indexPath)
        XCTAssertTrue(cell is EmployeeTableViewCell)
    }
    
    
    func testNumberOfRowsInSection() {
        let numberOfRowsInSection = employeeVC.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertTrue(numberOfRowsInSection == 1)
    }
    
}
