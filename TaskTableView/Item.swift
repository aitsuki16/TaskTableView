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
//      func encode(to encoder: Encoder) throws {
//          var container = try encoder.container(keyedBy: CodingKey.self)
//
//      }
//
//      init(from decoder: Decoder) throws {
//          let container = try decoder.container(keyedBy: CodingKey.self)
//          title = try container.decode(String.self, forKey: .title)
//          done = try container.decode(String.self, forKey: .done)
//
//        }
//    func encode(with aCoder: NSCoder) {
//            aCoder.encode(title, forKey: "title")
//            aCoder.encode(done, forKey: "done")
//        }
//
//    required init?(coder aDecoder: NSCoder) {
//        title = aDecoder.decodeObject(forKey: "title") as! String
//        done = aDecoder.decodeBool(forKey: "done")
//    }
    
    
}

