//
//  Item.swift
//  TaskTableView
//
//  Created by Ai on 2020/06/14.
//  Copyright © 2020 Igarashi Ai. All rights reserved.
//

import Foundation

class Item {
    var title: String
    var done: Bool = false
    
    init(title:String) {
        self.title = title
    }
}
