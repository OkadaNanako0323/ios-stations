//
//  FirstViewController.swift
//  ios-stations
//

import UIKit

class FirstViewController: UIViewController {
    
    var books: [Book]?
    let bookDate = BookAPIClient()
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func fetchBooks(_ sender: Any) {
        
        self.bookDate.fetchBooks(offset: self.books?.count ?? 0) { books in
            if let books = books {
                if self.books == nil {
                    //ここでbook配列にデータがBookのインスタンスが格納される
                    self.books = books
                } else {
                    //リロードして画面に表示
                    self.books?.append(contentsOf: books)
                }
                self.tableView.reloadData()
                
            } else {
                //エラーしたら…
                print("データの取得に失敗")
            }
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //これないと表示されない
        //self = FirstViewController
        tableView.dataSource = self
        tableView.delegate = self
        
        //カスタムセルの登録
        tableView.register(BookCell.self, forCellReuseIdentifier: "reuseCell")
        
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
        
    }
    
    //リロード
    @objc func refreshTableView(){
        self.books = nil
        self.bookDate.fetchBooks(offset: 0) { [weak self] books in
            guard let self = self else { return }
            if let books = books {
                self.books = books
                DispatchQueue.main.async {
                    self.tableView.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                }
            } else {
                print("データの取得に失敗")
            }
        }
    }
}
    
    extension FirstViewController: UITableViewDataSource {
       //セルの内容を設定
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("row\(indexPath.row)目のセルが作られてる")
            //カスタムセルの取得
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as? BookCell else {
                fatalError("エラー")
            }
            
            //取得したBookのインスタンスからプロパティを設定する
            if let book = books?[indexPath.row] {
                    // アイコン
                    cell.bookIcon.image = UIImage(named: "Book")

                    // タイトル
                    cell.bookTitle.text = book.title
                    cell.bookDetail.text = book.detail
                } else {
                    // book が取得できない場合の処理
                    cell.bookTitle.text = "無題"
                    cell.bookDetail.text = "詳細なし"
                }
            
            return cell
        }
        //行数を指定
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //books?だから必ずアンラップ
            if let books = books {
                return books.count
            } else {
                return 0
            }
            
        }
        
        //セルの高さ
        //必要？
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        
    }
    
    //セルの選択された時の処理
    extension FirstViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            //bookのインスタンスの中から、urlプロパティを渡す
            if let selectBook = books?[indexPath.row] {
                //SecondViewControllerをインスタンスかするとき、urlが求められる
                //なので、先にbook配列にあるBookインスタンスから、ulrプロパティを取得しておく↑
                //イニシャライザの際に求められるurlにはBookインスタンスのulrを入れておく
                let secondVC = SecondViewController(url: selectBook.url)
                
                //画面遷移
                //モーダルなのはOKなのかわからない
                self.present(secondVC, animated: true, completion: nil)
            }
            
        }
    }

