//
//  SecondViewController.swift
//  ios-stations
//

import UIKit
import WebKit

class SecondViewController: UIViewController {

    private var webView: WKWebView!
    
    //ここでFirstVCのurlを受け取る
    private var url: String!
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //URLを表示
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        view = webView
        
        load(withURL: url)
    }
    
    private func load(withURL urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}
