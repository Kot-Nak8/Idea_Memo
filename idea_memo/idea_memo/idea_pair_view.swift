//
//  idea_pair_view.swift
//  idea_memo
//
//  Created by 中村幸太 on 2021/02/01.
//

import Foundation
import SwiftUI

//アイデアのペアを表示する用のファイル


struct PairView: View{
    @State var R = Setting().R_color
    @State var G = Setting().G_color
    @State var B = Setting().B_color
    @State var Rf = Setting().Rf_color
    @State var Gf = Setting().Gf_color
    @State var Bf = Setting().Bf_color
    let wi = UIScreen.main.bounds.size.width
    @State var text = "新しいアイデアを記入"
    @State var testdata = ["テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章",
    "テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章",
    "テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章",
    "テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章",
    "テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章",
    "テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章テスト文章"]
    
    var body: some View{
        List{
            ForEach(self.testdata.indices) { i in
               NavigationLink(destination:
                            List{
                                TextPairView(text: $testdata[i])
                                HStack{
                                    Spacer()
                                    Text("＋")
                                    Spacer()
                                }
                                TextPairView(text: $testdata[i])
                                HStack{
                                    Spacer()
                                    Text("||")
                                    Spacer()
                                }
                                TextPairView(text: $text)
                                HStack{
                                    Spacer()
                                    Button(action:{
                                        //保存の処理
                                    }){Text("保存")}
                                    Spacer()
                                    }
                                Spacer()
                                }
                                .navigationTitle("New Idea")
                                .navigationBarTitleDisplayMode(.inline)
                    
                ){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.gray, lineWidth: 7)
                            .background(Color.clear)
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.blue, lineWidth: 2)
                                    .background(Color.clear)
                                Text(self.testdata[i])
                                    .padding(5)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.blue, lineWidth: 2)
                                    .background(Color.clear)
                                Text(self.testdata[i])
                                    .padding(5)
                            }
                        }
                        .font(.footnote)
                        .lineLimit(5)
                        .padding()
                        
                    }.frame(width: 6*wi/7, height: 200 ,alignment: .center)
                    .onAppear(perform: {
                        self.Rf = Setting().Rf_color
                        self.Gf = Setting().Gf_color
                        self.Bf = Setting().Bf_color
                        self.text = "新しいアイデアを記入"
                    })
                }
            }
        }
    }
}




struct TextPairView: View {
    @State var wi = UIScreen.main.bounds.size.width
    @State var he = UIScreen.main.bounds.size.height
    @Binding var text: String
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 20.0)
            .strokeBorder(Color.gray, lineWidth: 3)
            .foregroundColor(.gray)
            .background(Color.clear)
        TextEditor(text: self.$text)
            .padding()
            .onTapGesture(perform: {
                if self.text == "新しいアイデアを記入"{
                    self.text = ""
                }
            })
        }
        .frame(width: 6*wi/7, height: 2*he/7, alignment: .center)
    }
}
