//
//  SafariView.swift
//  Okashiapr
//
//  Created by 健太郎 on 2024/02/12.
//

import SwiftUI
//↓アプリ内でsafariを起動する構造体
import SafariServices

//SFdafariViewControllerResponsentableを起動する構造体
struct SafariView: UIViewControllerRepresentable{
//    表示するホームページのURLを受け取る変数
    let url: URL
//    表示するViewを生成するときに実行
    //    お菓子検索画面からsafari 起動画面が呼び出されると、最初に下記のメソッドが実行されます。
    func makeUIViewController(context: Context) -> SFSafariViewController {
//        safariを起動
        return SFSafariViewController(url: url)
    }
//    Viewが更新されたときに実行
//    Viewが更新された時に自動的に実行されるメソッド。safariを表示するだけなので処理は追加しない
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
//        処理なし
    }
}
