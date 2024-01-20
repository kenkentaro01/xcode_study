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
    
//    表示するマップの位置
//MapCameraPositionはマップ内のカメラ位置を記述する構造体です。
    @State var cameraPosition: MapCameraPosition = .automatic
    var body: some View {
//        引数positionによりカメラの位置を指定することができる。
        Map(position: $cameraPosition
        ){
//            マップにピンを表示
//coordinatenの引数は緯度経度を渡している
            Marker(searchKey,coordinate: targetCordinate)
        }
//        検索キーワドの変更を検知
//        onChangeとはof(引数ラベル)で指定されている値が変更された時に処理を実行する
//    initial : TrueになっていることでViewが最初に表示されたときにactionが実行される
//        newValueは変更後の値
        .onChange(of: searchKey, initial: true) { oldValue, newValue in
//            入力されたキー/*ワードをデバッグエリアに表示*/
            print("検索キーワード:\(newValue)")
            
//            地図の検索クエリの作成
            let request = MKLocalSearch.Request()

//            検索クエリにキーワードを設定
//naturalLanguageQueryプロパティは検索したい文字列をセットします。
            request.naturalLanguageQuery=newValue
            
//MKLocalSearchの初期化
            let search = MKLocalSearch(request: request)
            
//検索の開始
//            位置情報が取得できた時、inからの処理が実行される
            search.start{
                response,error in
//                print("response\(response?.mapItems)")
//結果が存在する時は1件目を取り出す
//                キーワード検索では一つの場所を特定できない場合複数の位置情報がAppleのサーバから送られてくるものが複数あるため以下のような処理を行っている
//                下記の処理はresponseの値をアンラップして一つずつmapItemに渡している。おそらく変数mapItemsに「？」のオプショナル型を指定する値がついていないためnillだけ省いたものだけが渡されるのではないか？
                if let mapItems = response?.mapItems,
                     
                   let mapItem = mapItems.first{
//                    位置情報から緯度経度をtargetCordinateに取り出す
                    targetCordinate = mapItem.placemark.coordinate
//                    緯度経度をデバッグに出力
                    print("緯度経度:\(targetCordinate)")
//                  出力結果は
//                緯度経度:CLLocationCoordinate2D(latitude: 35.689506, longitude: 139.6917)
                    
//                    表示するマップの領域を作成
                    cameraPosition = .region(MKCoordinateRegion(
//                        検索した結果がカメラの位置の中心に来るようにしている
                    center: targetCordinate,
//                    中心から５００メートルの範囲がViewに収まるように表示される
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0
                    ))
                }
            }
        }
    }
}

#Preview {
//    searchKeyの初期値
    MapView(searchKey:"東京駅")
}
