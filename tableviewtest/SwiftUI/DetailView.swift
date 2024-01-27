//
//  DetailView.swift
//  tableviewtest
//
//  Created by Chathura ADL on 2024-01-27.
//

import SwiftUI

struct DetailView: View {
    
    var employeeData: EmployeeData?
    
    var body: some View {
            VStack {
                // Profile Image
                Image("profileimage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 5)

                // Profile Details
                Text(employeeData?.name ?? "Name")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text(employeeData?.division ?? "Division")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)

                Text(employeeData?.address ?? "Address")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(employeeData?.country ?? "Country")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding()
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
