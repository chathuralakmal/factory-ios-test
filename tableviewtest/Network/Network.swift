//
//  Network.swift
//  tableviewtest
//
//  Created by Chathura ADL on 2024-01-27.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    func fetchEmployees(nextPage: String, completion: @escaping (String, [EmployeeData]) -> Void)
}

struct Network: NetworkProtocol {
    
    func fetchEmployees(nextPage: String, completion: @escaping (String, [EmployeeData]) -> Void) {
        let url = "https://sg666zbdmf.execute-api.us-east-1.amazonaws.com/dev\(nextPage)"
        AF.request(url).responseDecodable(of: GetEmployeesResponse.self) { response in
            switch response.result {
            case .success(let resp):
                completion(resp.next ?? "null", resp.results)
            case .failure(let error):
                print("Error on fetch Characters: \(error)")
            }
        }
    }
    

}
