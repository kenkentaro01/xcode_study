////SwiftUIViewを選択することで「import SwiftUI
//」の記述が追加されたswiftファイルが作成される。
//  SwiftUIView.swift
//  Mapapr
//
//  Created by 健太郎 on 2024/01/20.
//

import SwiftUI
import MapKit

struct MapView: View {
//    検索キーワードを保存するための定数
    let searchKey: String
//    キーワードから取得した緯度経度
//    CLLocationCoordinate2Dは緯度経度の情報を格納できるデータ型
    @State var targetCordinate = CLLocationCoordinate2D()
    var body: some View {
        Map(){
        }
//        検索キーワドの変更を検知
//        onChangeとはof(引数ラベル)で指定されている値が変更された時に処理を実行する
//    initial : TrueになっていることでViewが最初に表示されたときにactionが実行される
//        newValueは変更後の値
        .onChange(of: searchKey, initial: true) { oldValue, newValue in
//            入力されたキー/*ワードをデバッグエリアに表示*/
            print("検索キーワード:\(newValue)")
        }
    }
}

#Preview {
//    searchKeyの初期値
    MapView(searchKey:"東京")
}
