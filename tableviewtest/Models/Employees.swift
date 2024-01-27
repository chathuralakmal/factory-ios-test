//
//  Employee.swift
//  tableviewtest
//
//  Created by Chathura ADL on 2024-01-27.
//

import Foundation

struct GetEmployeesResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [EmployeeData]
}

struct EmployeeData: Codable {
    let id: Int
    let address, country, division, name: String
}
