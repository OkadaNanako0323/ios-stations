//
//  UIColor+Theme.swift
//  ios-stations
//

import UIKit

extension UIColor {
    struct Theme {
        static var main: UIColor  { return UIColor(named: "Main")! }
    }
    
    //コンピューテッドプロパティ
    //get省略されてるけど
    //スタティックプロパティにしてるおかげでいちいちインスタンスを生成しなくても、randamプロパティにアクセスできる
    static var random: UIColor {
        //０から２５５までの数をランダムで生成
        //CGFloatを使うのは191.5みたいな数も生成したいから？
        //255.0で割るのはswiftの色の指定が0~1でやるから……らしい
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        
        //red green buleそれぞれに↑で生成したランダムな数字が代入される
        //完全にランダムになった色がrandamに代入されて返ってくる
        //UIColorのインスタンス
        return UIColor(red: r, green: g, blue: b, alpha: 1)
   
    }
}
