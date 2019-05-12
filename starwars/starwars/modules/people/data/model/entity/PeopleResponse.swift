//
// Created by Carlos Leonardo Camilo Vargas Huamán on 2019-05-12.
// Copyright (c) 2019 orbis. All rights reserved.
//

import Foundation

class PeopleResponse: Codable {
    var results: [Person] = []
    class Person: Codable {
        var name: String?
        var height: String?
        var mass: String?
        var gender: String?
        var homeworld: String?
    }
}