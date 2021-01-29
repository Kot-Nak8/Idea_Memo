//
//  ContentView.swift
//  idea_memo
//
//  Created by 中村幸太 on 2021/01/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            //ホーム
            NavigationView{
                HomeView()
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "house")
                }
            //検索
            NavigationView{
                SearchView()
                    .padding(.top)
                    .navigationTitle("Search")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                }
            //アイデアのペア表示
            NavigationView{
                Text("アイデアのペア表示")
            }
            .tabItem {
                Image(systemName: "lightbulb")
                }
        }
    }
}




//ホーム画面
struct HomeView: View{
    @State var wi = UIScreen.main.bounds.size.width //スクリーンの幅と高さ取得
    @State var he = UIScreen.main.bounds.size.height
    var body: some View{
        ZStack{
            VStack{
                Text("") //Spacer()だと空きすぎてたからTextの空欄で調整してみた
                StoryView()
                IdeaView()
            }
            NavigationLink(destination:
                VStack{
                    Spacer()
                    TextEditView()
                    Spacer()
                    Button(action:{
                        
                    }){
                        Text("入力完了")
                        }
                    Spacer()
                    }
                ){
                    Image(systemName: "pencil.circle.fill")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 60, height: 60)
                    }.position(x: 6*wi/7, y: 5*he/7)
        }
    }
}




//ストーリーみたいなやつ
struct StoryView: View{
    @State var testdata = ["犬","スマホ","広告","誕生日","自動車","Youtube"]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(self.testdata, id: \.self) { i in
                    NavigationLink(destination:
                        Text(i)
                    ){
                        ZStack{
                            Image(systemName: "circle")
                                .resizable()
                                .foregroundColor(Color.gray)
                                .background(Color.clear)
                            Text(i)
                                .padding()
                        }
                        .padding(5)
                        .frame(width: 100, height: 100)
                    }
                }
            }
        }
    }
}




//保存したアイデア一覧
struct IdeaView: View{
    @State var testdata = ["テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
        "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
        "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテてててててててt",
        "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
            "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
            "テストテストテストテストテスト"
        ]
    
    var body: some View{
        List{
            ForEach(self.testdata, id: \.self) { i in
                NavigationLink(destination:
                    VStack{
                        Text("編集画面")
                        Text(i)
                            .padding()
                        }
                ){
                    Text(i)
                        .lineLimit(4)
                        .padding(5)
                }
            }
        }.listStyle(PlainListStyle())
    }
}





//検索バーのビュー
struct SearchView: View{
    @State var search = ""
    @State var search_r = ""
    @State var isEditing = false
    var body: some View{
        VStack{
            HStack{
                TextField("Search", text: $search,
                          onCommit: {
                            self.search_r = self.search //エンター押した時に代入
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
                    //.animation(.default)
                }
            }
            Searchresults(search: $search_r) //検索結果のビュー
        }
    }
}




//検索結果のビュー
struct Searchresults: View{
    @State var testdata = ["私の名前は中村", "私の名前は田久保", "研究めんどくさい", "研究つらい", "アプリ作るの楽しい", "研究楽しい" ,"彼女いない"]
    @Binding var search: String
    var body: some View{
        List{
            ForEach(self.testdata, id: \.self) { i in
                if i.contains(self.search) {
                    Text(i)
                }
            }
            
        }.listStyle(PlainListStyle())
    }
}



//TextEditorにはスタイルやプレースホルダーなどがまだ備わっていないため、自分で作るしかないらしい
//入力フィールド
struct TextEditView: View {
    @State var wi = UIScreen.main.bounds.size.width
    @State var he = UIScreen.main.bounds.size.height
    @State var text = "アイデアを記入"
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 20.0)
            .strokeBorder().foregroundColor(.gray)
            .background(Color.clear)
        TextEditor(text: self.$text)
            .padding()
            .onTapGesture(perform: {
                if self.text == "アイデアを記入"{
                    self.text = ""
                }
            })
        }
        .frame(width: 4*wi/5, height: he/2, alignment: .center)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


