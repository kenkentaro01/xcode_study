//
//  OkashiData.swift
//  Okashiapr
//
//  Created by 健太郎 on 2024/02/11.
//

import SwiftUI

//お菓子データ検索ようクラス
@Observable class OkashiData{
//    JSONのデータ構造
    struct ResultJson: Codable{
        //        JSONのitem内のデータ構造
        struct Item: Codable{
//            お菓子の名称
            let name: String?
//            掲載URL
            let url: URL?
//            画像URL
            let image: URL?
            
        }
//        複数要素
        let item:[Item]?
    }
        //    WebAPI検索用メソッド　第一引数:keyword 検索したいワード
            func searchOkashi(keyword:String){
        //        デバッグエリアに出力
                print("serchOkashiメソッドで受け取った値\(keyword)")
        //        Taskは非同期で処理を実行できる
                Task{
        //            ここからは非同期で処理される
        //            非同期でお菓子を検索する
                    await search(keyword: keyword)
    }

        }
//    非同期でお菓子データを取得
//    asyncはTask上で実行される必要がある
    private func search(keyword: String) async{
//        デバッグエリアに出力
//        print("serchメソッドで受け取った値:\(keyword)")
//        お菓子のキーワードをURLエンコードする
//        addingPercentEncoding文字列をエンコードするメソッド
//        guard let　はエンコードで失敗すると戻り値がnilとなる
//        .urlQueryAllowedでURLパラメータ用のエンコード方法を指定している
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else{
            return
        }
//        リクエストURLの組み立て
//        URLは改行せずに1行で書き込むこと
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&keyword=\(keyword_encode)&format=json&max=10&order=r")else{
            return
        }
//        デバッグエリアに出力
        print(req_url)
        do{
//            リクエストURLからダウンロード
//            タプル型として返却される
//            タプル:複数の値を1つの変数として扱うことができる機能
//            配列と違って値の追加や削除をすることができない
            let (data, _) = try await URLSession.shared.data(from: req_url)
//            jsondecoderのインスタンスの取得
            let decoder = JSONDecoder()
//             受け取ったjsonデータをパース（解析）して格納
            let json = try decoder.decode(ResultJson.self,from:data)
            
            print(json)
        }catch{
//            エラー処理
            print("エラーが出ました")
        }
    }
}
