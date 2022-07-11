//
//  Question.swift
//  QuizzApp
//
//  Created by 임희찬 on 2022/07/11.
//

import Foundation

struct Question {
    let text : String
    let answer : String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
