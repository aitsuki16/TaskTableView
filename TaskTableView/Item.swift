//
//  Item.swift
//  TaskTableView
//
//  Created by Ai on 2020/06/14.
//  Copyright © 2020 Igarashi Ai. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding{
    var title = String()
    var done: Bool = false
    
     override init() { }

    func encode(with aCoder: NSCoder) {
            aCoder.encode(title, forKey: "title")
            aCoder.encode(done, forKey: "done")
        }

    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "title") as! String
        done = aDecoder.decodeBool(forKey: "done")
    }
}

