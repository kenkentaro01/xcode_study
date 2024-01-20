//
//  ContentView.swift
//  Mapapr
//
//  Created by 健太郎 on 2024/01/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//垂直にレイアウト
        VStack{
//            マップを表示
            MapView(searchKey: "羽田空港")
        }
    }
}

#Preview {
    ContentView()
}
