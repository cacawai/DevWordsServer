//
//  File.swift
//  File
//
//  Created by 徐新元 on 2021/9/6.
//

import Fluent
import Vapor

final class Word: Model, Content {
    static let schema = "Words"
    @ID(key: .id)
    var id: UUID?

    @Field(key: "english")
    var english: String
    
    @Field(key: "phonetic")
    var phonetic: String
    
    @Field(key: "chinese")
    var chinese: String
    
    init() {}
    
    init(english: String, phonetic: String, chinese: String) {
        self.english = english
        self.phonetic = phonetic
        self.chinese = chinese
    }
}

