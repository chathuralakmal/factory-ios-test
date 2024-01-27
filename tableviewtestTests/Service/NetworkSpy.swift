//
//  NetworkSpy.swift
//  tableviewtestTests
//
//  Created by Chathura ADL on 2024-01-27.
//

import Foundation
@testable import tableviewtest

struct NetworkSpy: NetworkProtocol {
    
    let results = [tableviewtest.EmployeeData(id: 1, address: "Test", country: "test", division: "test", name: "test")]
    let next = ""

    func fetchEmployees(nextPage: String, completion: @escaping (String, [tableviewtest.EmployeeData]) -> Void) {
        completion(self.next, self.results)
    }
}
