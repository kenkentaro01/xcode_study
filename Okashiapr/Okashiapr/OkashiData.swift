//
//  OkashiData.swift
//  Okashiapr
//
//  Created by 健太郎 on 2024/02/11.
//

import SwiftUI
//Identifiableプロトコルを利用して、お菓子の情報をまとめる構造体
//Identifiableは一意に識別できる型
//→これを指定するとデータを一意に特定するための「id」と呼ばれるプロパティを定義する必要があり
struct OkashiItem: Identifiable{
//    UUIDはidをランダムな一意の値を生成している
    let id = UUID()
    let name : String
    let link : URL
    let image: URL
}
//お菓子データ検索ようクラス
//webAPIからデータを取得するごとに状態が変化するため、インスタンスを別のメモリにコピーするstructではなく、インスタンスのっもりを共有する参照型のクラスで作成する必要がある
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
//    お菓子のリスト
//    以下の書き方により構造体を複数保持することができる
    var okashiList: [OkashiItem] = []
//    クリックされたwebページのURL情報
//    クリックされるまでは変数の値は何もない状態なのでオプショナル変数で定義
    var okashiLink: URL?
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
//    @MainActorを使いメインスレッドで更新する
    @MainActor
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
            
//            print(/*json*/)
//            お菓子の情報が取得できているか確認
            guard let items = json.item else {return}
//            お菓子のリストを初期化
            okashiList.removeAll()
            
//            取得しているお菓子の数だけ処理
            for item in items {
//                お菓子の名称　掲載URL、画像をアンラップ
                if let name = item.name,
                   let link = item.url,
                   let image = item.image{
//                    一つの歌詞の構造他でまとめて管理
                    let okashi = OkashiItem(name: name, link: link, image: image)
//                    お菓子の配列へ追加
                    okashiList.append(okashi)
                }
            }
            print(okashiList)
        }catch{
//            エラー処理
            print("エラーが出ました")
        }
    }
}
