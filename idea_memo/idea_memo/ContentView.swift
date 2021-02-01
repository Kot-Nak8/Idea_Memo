//
//  ContentView.swift
//  idea_memo
//
//  Created by 中村幸太 on 2021/01/28.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedObject var setting = Setting()
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
                PairView()
                    .navigationTitle("Idea Pair")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "lightbulb")
            }
            //設定
            NavigationView{
                SettingView()
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "gearshape")
            }
        }.onAppear(perform: { //初回起動時に付箋の色とかを以下に設定
            if !(self.setting.f_on) {
                self.setting.R_color = 200
                self.setting.G_color = 220
                self.setting.B_color = 250
                self.setting.Rs_color = 165
                self.setting.Gs_color = 175
                self.setting.Bs_color = 225
                self.setting.Rss_color = 55
                self.setting.Gss_color = 30
                self.setting.Bss_color = 90
                self.setting.Ri_color = 255
                self.setting.Gi_color = 255
                self.setting.Bi_color = 255
                self.setting.Rn_color = 15
                self.setting.Gn_color = 110
                self.setting.Bn_color = 255
                self.setting.f_on = true
                print("aa")
            }
        })
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
            InputView().position(x: 6*wi/7, y: 5*he/7)
        }
    }
}




//ストーリーみたいなやつ
struct StoryView: View{
    @State var Rs = Setting().Rs_color
    @State var Gs = Setting().Gs_color
    @State var Bs = Setting().Bs_color
    @State var Rss = Setting().Rss_color
    @State var Gss = Setting().Gss_color
    @State var Bss = Setting().Bss_color
    @State var Ri = Setting().Ri_color
    @State var Gi = Setting().Gi_color
    @State var Bi = Setting().Bi_color
    @State var Rw = Setting().Rw_color
    @State var Gw = Setting().Gw_color
    @State var Bw = Setting().Bw_color
    let wi = UIScreen.main.bounds.size.width //スクリーンの幅と高さ取得
    let he = UIScreen.main.bounds.size.height
    @State var new_i = 0
    @State var text = "新しいアイデアを記入"
    @State var testdata = ["犬","スマホ","広告","誕生日","自動車","Youtube","aaa","aaa"]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(self.testdata.indices, id: \.self) { i in
                    NavigationLink(destination:
                            ZStack{
                                    List{
                                        TextPairView(text: $testdata[self.new_i])
                                        HStack{
                                            Spacer()
                                            Text("＋")
                                            Spacer()
                                        }
                                        TextPairView(text: $testdata[self.new_i])
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
                            HStack{ //画面の端をタッチすると次のコンテンツに移動する。編集中は機能しないようにしたい
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
                            BackView() //バツボタン
                                .position(x: 8*wi/9, y: he/7)
                        }.onAppear(perform:{
                            self.new_i = i
                            })
                             .navigationBarBackButtonHidden(true)
                        ){
                            Text(self.testdata[i]) //ストーリの丸表示
                                .foregroundColor(Color(red: self.Rw/255, green: self.Gw/255, blue: self.Bw/255))
                                .lineLimit(2)
                                .padding()
                                .frame(width: 80, height: 80)
                                .background(CircleView(Rs: $Rs, Gs: $Gs, Bs: $Bs, Rss: $Rss, Gss: $Gss, Bss: $Bss, Ri: $Ri, Gi: $Gi, Bi: $Bi))
                                .padding(5)
                    }.onAppear(perform: {
                        self.Rw = Setting().Rw_color
                        self.Gw = Setting().Gw_color
                        self.Bw = Setting().Bw_color
                        self.text = "新しいアイデアを記入"
                    })
                }
            }
        }
    }
}



//navigationlinkから戻るボタン(ストーリ用)
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
                .opacity(0.7)
                .foregroundColor(.gray)
        }
    }
}



//入力ボタンのビュー
struct InputView: View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var Rn = Setting().Rn_color
    @State var Gn = Setting().Gn_color
    @State var Bn = Setting().Bn_color
    @State var flag = true
    @State var text = "アイデアを記入"
    var body: some View{
        NavigationLink(destination: //入力画面
            VStack{
                Spacer()
                TextEditView(text: $text)
                Toggle(isOn: $flag) {
                    Text("ペア表示の有無")
                }.padding(EdgeInsets(
                    top: 5,        // 上辺の余白幅
                    leading: 30,    // 左辺の余白幅
                    bottom: 10,     // 下辺の余白幅
                    trailing: 30    // 右辺の余白幅
                ))
                Button(action:{
                    //ここに入力したのを保存する処理を入れる
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
                   .foregroundColor(Color(red: self.Rn/255, green: self.Gn/255, blue: self.Bn/255))
                }.onAppear(perform: {
                    self.Rn = Setting().Rn_color
                    self.Gn = Setting().Gn_color
                    self.Bn = Setting().Bn_color
                    self.text = "アイデアを記入"
                })
    }
}



//保存したアイデア一覧
struct IdeaView: View{
    let wi = UIScreen.main.bounds.size.width //スクリーンの幅と高さ取得
    let he = UIScreen.main.bounds.size.height
    @State var R = Setting().R_color
    @State var G = Setting().G_color
    @State var B = Setting().B_color
    @State var Rf = Setting().Rf_color
    @State var Gf = Setting().Gf_color
    @State var Bf = Setting().Bf_color
    @State var flag = true
    @State var testdata = ["1テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
        "2テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
        "3テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテてててててててt",
        "4テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
            "5テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
            "6テストテストテストテストテスト",
            "7テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
            "8テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ",
            "9テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト",
                "10テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテ"
        ]
    
    var body: some View{
        LazyVGrid(columns: Array(repeating: .init(.fixed(wi/2-15)), count: 2)){
            ForEach(self.testdata.indices) { i in
                HStack{
                    NavigationLink(destination:
                        VStack{
                            TextEditView(text: $testdata[i])
                            Toggle(isOn: $flag) {
                                Text("ペア表示の有無")
                            }.padding(EdgeInsets(
                                top: 5,        // 上辺の余白幅
                                leading: 30,    // 左辺の余白幅
                                bottom: 10,     // 下辺の余白幅
                                trailing: 30    // 右辺の余白幅
                            ))
                            Button(action:{
                                //編集したのを更新する処理
                            }){Text("更新")}
                            }
                    ){
                            Text(self.testdata[i])
                                .padding(5)
                                .frame(width: wi/2-20, height: 180)
                                .background(StickyNoteView(R: $R, G: $G, B: $B))
                                .font(.footnote)
                                .foregroundColor(Color(red: self.Rf/255, green: self.Gf/255, blue: self.Bf/255))
                                .lineLimit(6)
                                .padding(EdgeInsets(
                                    top: 5,        // 上辺の余白幅
                                    leading: 5,    // 左辺の余白幅
                                    bottom: 0,     // 下辺の余白幅
                                    trailing: 0    // 右辺の余白幅
                                ))
                        }.onAppear(perform: {
                            self.Rf = Setting().Rf_color
                            self.Gf = Setting().Gf_color
                            self.Bf = Setting().Bf_color
                        })
                }
            }
        }
    }
}



//TextEditorにはスタイルやプレースホルダーなどがまだ備わっていないため、自分で作るしかないらしい
//入力フィールド。入力するときと編集する時のテキストフィールド
struct TextEditView: View {
    @State var wi = UIScreen.main.bounds.size.width
    @State var he = UIScreen.main.bounds.size.height
    @Binding var text: String
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
        .frame(width: 6*wi/7, height: 3*he/5, alignment: .center)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


