//
//  SettingView.swift
//  Timerapr
//
//  Created by 健太郎 on 2024/01/21.
//

import SwiftUI

struct SettingView: View {
//    秒数設定
    @State var timerValue = 10
    var body: some View {
        ZStack{
//            背景色表示
            Color.backgroundSetting
                .ignoresSafeArea()
            
//            垂直にレイアウト
            VStack{
                Spacer()
//                テキストを表示する
                Text("\(timerValue)秒")
                    .font(.largeTitle)
//                Pickerを表示
//                timeValueにはtagの値が設定されている　tagと連動する
                Picker(selection: $timerValue){
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("30")
                        .tag(30)
                    Text("40")
                        .tag(40)
                    Text("50")
                        .tag(50)
                    Text("60")
                        .tag(60)

                }label: {
                    Text("選択")
                }
//                Pickerをホイール表示
                .pickerStyle(.wheel)
                Spacer()
            }
        }
    }
}

#Preview {
    SettingView()
}
