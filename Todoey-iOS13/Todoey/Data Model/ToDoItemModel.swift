//
//  ToDoItemModel.swift
//  Todoey
//
//  Created by Anton Goncharov on 20.07.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

class ToDoItemModel: Encodable {
    var name: String = ""
    var done: Bool = false
}
