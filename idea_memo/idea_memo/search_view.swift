//
//  search_view.swift
//  idea_memo
//
//  Created by 中村幸太 on 2021/02/01.
//

import Foundation
import SwiftUI

//検索用のビューのファイル

//検索バーのビュー
//検索結果のビューを内包
struct SearchView: View{
    @State var search = ""  //入力用
    @State var search_r = ""  //検索用
    @State var isEditing = false
    var body: some View{
        VStack{
            HStack{
                TextField("Search", text: $search,
                          onCommit: {
                            self.search_r = self.search //エンター押した時に代入するとエンターを押したときに検索するようになる
                          })
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            //バツボタン
                            if isEditing {
                                Button(action: {
                                    self.search = ""
                                    self.search_r = ""
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                //キャンセルボタン
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.search = ""
                        self.search_r = ""
     
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            Searchresults(search: $search_r) //検索結果のビュー
        }
    }
}




//検索結果のビュー
struct Searchresults: View{
    @State var testdata = ["私の名前は田中", "私の名前は鈴木", "研究めんどくさい", "研究つらい", "アプリ作るの楽しい", "研究楽しい" ,"お餅食べたい"]
    @Binding var search: String
    var body: some View{
        List{
            ForEach(self.testdata, id: \.self) { i in
                if i.contains(self.search) { //ここで検索ワードを含むものだけ表示する
                    Text(i)
                }
            }
            
        }
        .listStyle(PlainListStyle())
    }
}
