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
                    .background(Color("bg"))
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
    let wi = UIScreen.main.bounds.size.width //スクリーンの幅と高さ取得
    let he = UIScreen.main.bounds.size.height
    var body: some View{
        ZStack{
            ScrollView{
                VStack{
                Text("") //Spacer()だと空きすぎてたからTextの空欄で調整してみた
                StoryView()
                IdeaView()
                }
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
    let wi = UIScreen.main.bounds.size.width //スクリーンの幅と高さ取得
    let he = UIScreen.main.bounds.size.height
    @State var new_i = 0
    @State var testdata = ["犬","スマホ","広告","誕生日","自動車","Youtube","aaa","aaa"]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(self.testdata.indices, id: \.self) { i in
                    NavigationLink(destination:
                        ZStack{
                            Color.white.edgesIgnoringSafeArea(.all)
                            VStack{
                                Text(self.testdata[self.new_i])
                                Text("アイデアのペアを表示")
                            }
                            HStack{ //画面の端をタッチすると次のコンテンツに移動する。編集中は機能しないようにする
                                Button(action:{  //左をタップ
                                    if self.new_i - 1 >= 0{
                                        self.new_i = self.new_i - 1
                                    }
                                    print(new_i)
                                }){
                                    Text(" ")
                                        .frame(width: wi/7, height: he)
                                }
                                Spacer()
                                Button(action:{  //右をタップ
                                    if self.testdata.count > self.new_i + 1{
                                    self.new_i = self.new_i + 1
                                    }
                                    print(new_i)
                                }){
                                    Text(" ")
                                        .frame(width: wi/7, height: he)
                                }
                            }
                            BackView()
                                .position(x: 8*wi/9, y: he/7)
                        }.onAppear(perform:{
                            self.new_i = i
                            })
                             .navigationBarBackButtonHidden(true)
                        ){
                            Text(self.testdata[i])
                                .foregroundColor(.black)
                                .lineLimit(2)
                                .padding()
                                .frame(width: 80, height: 80)
                                .background(CircleView())
                                .padding(5)
                    }
                }
            }
        }
    }
}



//storyの円の図形を作るビュー
struct CircleView: View {
    //グラデーションの設定
    let gradient = LinearGradient(gradient: Gradient(colors: [Color(red: 200/255, green: 255/255, blue: 255/255), .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        //Geometなんちゃらはよくわからん、親ビューのサイズとかを取得できるみたい
        GeometryReader { geometry in
            ZStack{
            Circle()
                .fill(Color.white)
                .frame(width: geometry.size.width, height: geometry.size.height)
            Circle()
                .stroke(gradient, lineWidth: 5)
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}



//navigationlinkから戻るボタン
struct BackView: View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View{
        Button(action:{
            self.presentationMode.wrappedValue.dismiss()
        }){
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .opacity(0.4)
                .foregroundColor(.gray)
        }
    }
}



//保存したアイデア一覧
struct IdeaView: View{
    let wi = UIScreen.main.bounds.size.width //スクリーンの幅と高さ取得
    let he = UIScreen.main.bounds.size.height
    @State var testdata = ["1テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
        "2テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
        "3テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテてててててててt",
        "4テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
            "5テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
            "6テストテストテストテストテスト",
            "7テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
            "8テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
            "9テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
                "10テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
                "11テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテてててててててt",
                "12テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
                    "13テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
                    "14テストテストテストテストテスト",
                    "15テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
                    "16テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
                    
        ]
    
    
    var body: some View{
        LazyVGrid(columns: Array(repeating: .init(.fixed(wi/2-15)), count: 2)){
            ForEach(self.testdata.indices) { i in
                HStack{
                    NavigationLink(destination:
                        VStack{
                            Text("編集画面")
                            Text(self.testdata[i])
                                .padding()
                            Button(action:{
                                print(self.testdata[i])
                            }){Text("ii")}
                            }
                    ){
                        Text(self.testdata[i])
                            .padding(5)
                            .frame(width: wi/2-20, height: 180)
                            .background(StickyNoteView())
                            .font(.footnote)
                            .foregroundColor(.black)
                            .lineLimit(6)
                            .padding(EdgeInsets(
                                top: 5,        // 上辺の余白幅
                                leading: 5,    // 左辺の余白幅
                                bottom: 0,     // 下辺の余白幅
                                trailing: 0    // 右辺の余白幅
                            ))
                        }
                }
            }
        }
    }
}



//付箋の図形を作るビュー
struct StickyNoteView: View {
    //色はユーザーが変えられるようにしようかなと思う
    var color =  Color(red: 200/255, green: 255/255, blue: 255/255)

    var body: some View {
        //Geometなんちゃらはよくわからん、親ビューのサイズとかを取得できるみたい
        GeometryReader { geometry in
            ZStack {
                //Pathは図形を作るやつらしい
                Path { path in
                    let w = geometry.size.width
                    let h = geometry.size.height
                    let m = min(w/5, h/5)
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: h))
                    path.addLine(to: CGPoint(x: w-m, y: h))
                    path.addLine(to: CGPoint(x: w, y: h-m))
                    path.addLine(to: CGPoint(x: w, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: 0))
                }
                .fill(self.color)
                Path { path in
                    let w = geometry.size.width
                    let h = geometry.size.height
                    let m = min(w/5, h/5)
                    path.move(to: CGPoint(x: w-m, y: h))
                    path.addLine(to: CGPoint(x: w-m, y: h-m))
                    path.addLine(to: CGPoint(x: w, y: h-m))
                    path.addLine(to: CGPoint(x: w-m, y: h))
                }
                .fill(Color.black).opacity(0.3)
            }
        }
    }
}



//検索バーのビュー
//検索結果のビューを内包
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
                    .animation(.default)
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
            
        }
        .listStyle(PlainListStyle())
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
            .strokeBorder()
            .foregroundColor(.gray)
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


