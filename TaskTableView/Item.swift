//
//  Item.swift
//  TaskTableView
//
//  Created by Ai on 2020/06/14.
//  Copyright © 2020 Igarashi Ai. All rights reserved.
//

import Foundation

struct Item: Codable{
    var title: String
    var done: Bool
    
      init(title: String, done: Bool) {
          self.title = title
          self.done = done
      }
    
//    func save() {
//        JSONEncoder().encode(self)
//    }
//
//    
}

