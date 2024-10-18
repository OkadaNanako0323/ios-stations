//
//  Book.swift
//  ios-stations
//

import Foundation

struct Book: Decodable {
    let id: String
    let title: String
    let url: String
    let detail: String
    let review: String
    let reviewer: String
    
}

let json = """
[{
    "id": "書籍id",
    "title": "書籍タイトル",
    "url": "書籍情報参照URL",
    "detail": "書籍詳細情報",
    "review": "読んだ感想",
    "reviewer": "レビュー者（ユーザ名）",

}]
""".data(using: .utf8)!

func decode() {
    do {
        _ = try JSONDecoder().decode(Book.self, from: json)
    } catch {
        print("error")
    }
}

