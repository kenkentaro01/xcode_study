//
//  BackgroundModifier.swift
//  Musicapr
//
//  Created by 健太郎 on 2024/01/19.
//

import SwiftUI

//構造体、既存のクラスに新しい機能を追加することができる。extension(拡張)
extension Image{
    func backgroundModifier() -> some View{
//        画像を表示するImageのインスタンス
        self
//        リサイズする
            .resizable()
//        画面いっぱいになるようにセーフエリア外まで表示されるように設定
            .ignoresSafeArea()
            .scaledToFill()
    }
}
