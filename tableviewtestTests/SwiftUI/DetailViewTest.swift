//
//  DetailViewTest.swift
//  tableviewtestTests
//
//  Created by Chathura ADL on 2024-01-27.
//

import XCTest
import SwiftUI
@testable import tableviewtest

class DetailViewTests: XCTestCase {
    
    func testDetailViewInitialization() {
        let employeeData = EmployeeData(id: 1, address: "123 Main St", country: "USA", division: "Engineering", name: "John Doe")
        let detailView = DetailView(employeeData: employeeData)
        XCTAssertNotNil(detailView)
    }
}
