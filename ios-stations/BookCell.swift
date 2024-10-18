//
//  BookCell.swift
//  ios-stations
//

import UIKit

class BookCell: UITableViewCell {
    
        
    var element: Book!
    
    let bookIcon = UIImageView()
    let bookTitle = UILabel()
    let bookDetail = UILabel()
    
    //初期化の処理
    //セルの色や文字の場所などのセットアップを行う関数を実行するための場所
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("BookCellのメソッドが呼ばれてる")
        cellUIView()
        cellUIContraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


extension BookCell {
    //部品の設定
    func cellUIView() {
        print("UIが配置されてる")
        //アイコン
        bookIcon.contentMode = .scaleAspectFit
        bookIcon.image = UIImage(named: "Book")
        contentView.addSubview(bookIcon)
        
        //タイトル
        bookTitle.font = UIFont.boldSystemFont(ofSize: 16)
        bookTitle.numberOfLines = 1
        contentView.addSubview(bookTitle)
        
        //説明
        bookDetail.font = UIFont.boldSystemFont(ofSize: 16)
        bookDetail.numberOfLines = 3
        contentView.addSubview(bookDetail)
    }
}

extension BookCell {
    //制約
    func cellUIContraint(){
        //コードで制約をはる際に不都合なのでfalseにしておく
        bookIcon.translatesAutoresizingMaskIntoConstraints = false
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        bookDetail.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    // bookIcon の制約
                    bookIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    bookIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                    bookIcon.widthAnchor.constraint(equalToConstant: 60),
                    bookIcon.heightAnchor.constraint(equalToConstant: 60),
                    bookIcon.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),

                    // bookTitle の制約
                    bookTitle.leadingAnchor.constraint(equalTo: bookIcon.trailingAnchor, constant: 16),
                    bookTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                    bookTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

                    // bookDetail の制約
                    bookDetail.leadingAnchor.constraint(equalTo: bookIcon.trailingAnchor, constant: 16),
                    bookDetail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                    bookDetail.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 8),
                    bookDetail.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
                ])
        
        
    }
    
}
    
