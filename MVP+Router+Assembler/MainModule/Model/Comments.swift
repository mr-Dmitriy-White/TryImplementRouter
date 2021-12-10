//
//  Comments.swift
//  MVP+Router+Assembler
//
//  Created by Dima Biliy on 29.10.2021.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id : Int
    var name : String
    var email : String
    var body : String
}
