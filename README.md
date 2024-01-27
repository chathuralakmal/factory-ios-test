# Employee Data Viewer

## Overview

This iOS application fetches employee data and displays it in a table view. The project is implemented using both UIKit and SwiftUI to showcase different approaches in iOS app development.

## Features

- Fetches employee data from a remote server.
- Displays employee information in a table view.
- Allows users to view detailed information for each employee.
- Utilizes both UIKit and SwiftUI for the user interface.

## Technologies Used

- Swift
- UIKit
- SwiftUI
- Alamofire (for network requests)

## Project Structure

- `Network`: Handles network requests using Alamofire.
- `EmployeeData`: Contains the data model for employee information.
- `EmployeeTableViewCell`: UITableViewCell for displaying employee data.
- `DetailView`: SwiftUI view for detailed employee information.
- `ViewController`: UIKit view controller managing the main screen with the table view.

## UIKit Implementation

The UIKit version of the app demonstrates the traditional approach to building iOS applications using view controllers and UIKit components.

## SwiftUI Implementation

The SwiftUI version of the app showcases the modern SwiftUI framework for building user interfaces. It provides a more declarative and concise way of defining the UI.
