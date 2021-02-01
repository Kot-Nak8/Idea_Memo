//
//  figure_view.swift
//  idea_memo
//
//  Created by 中村幸太 on 2021/02/01.
//

import Foundation
import SwiftUI

//ボタンとか付箋とかの図形のあるファイル

//storyの円の図形を作るビュー
struct CircleView: View {
    @Binding var Rs: Double
    @Binding var Gs: Double
    @Binding var Bs: Double
    @Binding var Rss: Double
    @Binding var Gss: Double
    @Binding var Bss: Double
    @Binding var Ri: Double
    @Binding var Gi: Double
    @Binding var Bi: Double
    
    var body: some View {
        //Geometなんちゃらはよくわからん、親ビューのサイズとかを取得できるみたい
        GeometryReader { geometry in
            ZStack{
            Circle()
                .fill(Color(red: self.Ri/255, green: self.Gi/255, blue: self.Bi/255))
                .frame(width: geometry.size.width, height: geometry.size.height)
            Circle()
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: self.Rs/255, green: self.Gs/255, blue: self.Bs/255), Color(red: self.Rss/255, green: self.Gss/255, blue: self.Bss/255)]), startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 5)
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }.onAppear(perform: {
            self.Rs = Setting().Rs_color
            self.Gs = Setting().Gs_color
            self.Bs = Setting().Bs_color
            self.Rss = Setting().Rss_color
            self.Gss = Setting().Gss_color
            self.Bss = Setting().Bss_color
            self.Ri = Setting().Ri_color
            self.Gi = Setting().Gi_color
            self.Bi = Setting().Bi_color
        })
    }
}



//付箋の図形を作るビュー
struct StickyNoteView: View {
    @Binding var R: Double
    @Binding var G: Double
    @Binding var B: Double

    var body: some View {
        //Geometなんちゃらはよくわからん、親ビューのサイズとかを取得できるみたい
        GeometryReader { geometry in
            ZStack {
                //Pathは図形を作るやつらしい
                Path { path in
                    let w = geometry.size.width
                    let h = geometry.size.height
                    let m = min(w/5, h/5)
                    path.move(to: CGPoint(x: 0, y: 10))
                    path.addLine(to: CGPoint(x: 0, y: h+10))
                    path.addLine(to: CGPoint(x: w-m, y: h+10))
                    path.addLine(to: CGPoint(x: w, y: h-m+10))
                    path.addLine(to: CGPoint(x: w, y: 10))
                    path.addLine(to: CGPoint(x: 0, y: 10))
                }
                .fill(Color(red: self.R/255, green: self.G/255, blue: self.B/255))
                Path { path in
                    let w = geometry.size.width
                    let h = geometry.size.height
                    let m = min(w/5, h/5)
                    path.move(to: CGPoint(x: w-m, y: h+10))
                    path.addLine(to: CGPoint(x: w-m, y: h-m+10))
                    path.addLine(to: CGPoint(x: w, y: h-m+10))
                    path.addLine(to: CGPoint(x: w-m, y: h+10))
                }
                .fill(Color.black).opacity(0.3)
            }
        }.onAppear(perform: {
            self.R = Setting().R_color
            self.G = Setting().G_color
            self.B = Setting().B_color
        })
    }
}
