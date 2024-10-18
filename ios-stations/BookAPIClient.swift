//
//  BookAPIClient.swift
//  ios-stations
//

import Alamofire

protocol BookAPIClientProtocol {
    func fetchBooks(offset: Int, completion: @escaping ([Book]?) -> Void)
}

class BookAPIClient: BookAPIClientProtocol {
    func fetchBooks(offset: Int, completion: @escaping ([Book]?) -> Void) {
        let url = "https://railway.bookreview.techtrain.dev/public/books"
         
         AF.request(url).responseDecodable(of: [Book].self) { response in
         switch response.result {
         case .success(let books):
         completion(books)
         print("sucess")
         case .failure(_):
         completion(nil)
         print("erooor")
         }
        }
    }
}

