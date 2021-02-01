//
//  settings_view.swift
//  idea_memo
//
//  Created by 中村幸太 on 2021/02/01.
//

import Foundation
import SwiftUI

//設定のビューのファイル

struct SettingView: View {
    @ObservedObject var setting = Setting()
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
    @State var Rn = Setting().Rn_color
    @State var Gn = Setting().Gn_color
    @State var Bn = Setting().Bn_color
    
    var body: some View {
        List{
            husen()
            story()
            inbutton()
            description()
            
        }
    }
}



//付箋の色を決めるビュー
struct husen: View{
    @ObservedObject var setting = Setting()
    @State var R = Setting().R_color
    @State var G = Setting().G_color
    @State var B = Setting().B_color
    @State var Rf = Setting().Rf_color
    @State var Gf = Setting().Gf_color
    @State var Bf = Setting().Bf_color
    let wi = UIScreen.main.bounds.size.width
    var body: some View{
        NavigationLink(destination:
        VStack{
            Text("テストの文字")
                .padding(5)
                .frame(width: wi/2-20, height: 170)
                .background(StickyNoteView(R: $R, G: $G, B: $B))
                .font(.callout)
                .foregroundColor(Color(red: self.Rf/255, green: self.Gf/255, blue: self.Bf/255))
                .lineLimit(6)
                .padding(EdgeInsets(
                    top: 5,        // 上辺の余白幅
                    leading: 5,    // 左辺の余白幅
                    bottom: 20,     // 下辺の余白幅
                    trailing: 0    // 右辺の余白幅
                ))
            Form{
                Text("付箋の色")
                HStack{
                    Text("   Red")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.leading)
                    Slider(value: Binding(
                        get: {
                            self.R
                        },
                        set: {(newValue) in
                            self.R = newValue
                            self.setting.R_color = self.R
                            
                        }
                        ), in: 0...255, step:1)
                        .padding(.leading)
                        .padding(.trailing)
                        .accentColor(Color.red)
                    Text("\(R,specifier: "%.0f")")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.trailing)
                    }
                HStack{
                    Text("Green")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.leading)
                    Slider(value: Binding(
                        get: {
                            self.G
                        },
                        set: {(newValue) in
                            self.G = newValue
                            self.setting.G_color = self.G
                            
                        }
                        ), in: 0...255, step:1)
                        .padding(.leading)
                        .padding(.trailing)
                        .accentColor(Color.green)
                    Text("\(G,specifier: "%.0f")")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.trailing)
                    }
                HStack{
                    Text("  Blue")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.leading)
                    Slider(value: Binding(
                        get: {
                            self.B
                        },
                        set: {(newValue) in
                            self.B = newValue
                            self.setting.B_color = self.B
                            
                        }
                        ), in: 0...255, step:1)
                        .padding(.leading)
                        .padding(.trailing)
                        .accentColor(Color.blue)
                    Text("\(B,specifier: "%.0f")")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.trailing)
                    }
                Text("文字の色")
                HStack{
                    Text("   Red")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.leading)
                    Slider(value: Binding(
                        get: {
                            self.Rf
                        },
                        set: {(newValue) in
                            self.Rf = newValue
                            self.setting.Rf_color = self.Rf
                            
                        }
                        ), in: 0...255, step:1)
                        .padding(.leading)
                        .padding(.trailing)
                        .accentColor(Color.red)
                    Text("\(Rf,specifier: "%.0f")")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.trailing)
                    }
                HStack{
                    Text("Green")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.leading)
                    Slider(value: Binding(
                        get: {
                            self.Gf
                        },
                        set: {(newValue) in
                            self.Gf = newValue
                            self.setting.Gf_color = self.Gf
                            
                        }
                        ), in: 0...255, step:1)
                        .padding(.leading)
                        .padding(.trailing)
                        .accentColor(Color.green)
                    Text("\(Gf,specifier: "%.0f")")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.trailing)
                    }
                HStack{
                    Text("  Blue")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.leading)
                    Slider(value: Binding(
                        get: {
                            self.Bf
                        },
                        set: {(newValue) in
                            self.Bf = newValue
                            self.setting.Bf_color = self.Bf
                            
                        }
                        ), in: 0...255, step:1)
                        .padding(.leading)
                        .padding(.trailing)
                        .accentColor(Color.blue)
                    Text("\(Bf,specifier: "%.0f")")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.trailing)
                    }
            }
            Spacer()
            
        }.onAppear(perform: {
            self.R = Setting().R_color
            self.G = Setting().G_color
            self.B = Setting().B_color
            self.Rf = Setting().Rf_color
            self.Gf = Setting().Gf_color
            self.Bf = Setting().Bf_color
        })
        ){
            Text("付箋の色")
        }
    }
}


//ストーリーの色を決める
struct story: View{
    @ObservedObject var setting = Setting()
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
    var body: some View{
        NavigationLink(destination:
            VStack{
                Text("テスト") //ストーリの丸表示
                    .foregroundColor(Color(red: self.Rw/255, green: self.Gw/255, blue: self.Bw/255))
                    .lineLimit(2)
                    .padding()
                    .frame(width: 80, height: 80)
                    .background(CircleView(Rs: $Rs, Gs: $Gs, Bs: $Bs, Rss: $Rss, Gss: $Gss, Bss: $Bss, Ri: $Ri, Gi: $Gi, Bi: $Bi))
                    .padding(20)
                Form{
                    Group{
                        Text("枠(左下)")
                        HStack{
                            Text("   Red")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Rs
                                },
                                set: {(newValue) in
                                    self.Rs = newValue
                                    self.setting.Rs_color = self.Rs
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.red)
                            Text("\(Rs,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        HStack{
                            Text("Green")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Gs
                                },
                                set: {(newValue) in
                                    self.Gs = newValue
                                    self.setting.Gs_color = self.Gs
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.green)
                            Text("\(Gs,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        HStack{
                            Text("  Blue")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Bs
                                },
                                set: {(newValue) in
                                    self.Bs = newValue
                                    self.setting.Bs_color = self.Bs
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.blue)
                            Text("\(Bs,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        Text("枠(右上)")
                        HStack{
                            Text("   Red")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Rss
                                },
                                set: {(newValue) in
                                    self.Rss = newValue
                                    self.setting.Rss_color = self.Rss
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.red)
                            Text("\(Rss,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        HStack{
                            Text("Green")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Gss
                                },
                                set: {(newValue) in
                                    self.Gss = newValue
                                    self.setting.Gss_color = self.Gss
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.green)
                            Text("\(Gss,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        HStack{
                            Text("  Blue")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Bss
                                },
                                set: {(newValue) in
                                    self.Bss = newValue
                                    self.setting.Bss_color = self.Bss
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.blue)
                            Text("\(Bss,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        }
                    Group{
                        Text("中の色")
                        HStack{
                            Text("   Red")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Ri
                                },
                                set: {(newValue) in
                                    self.Ri = newValue
                                    self.setting.Ri_color = self.Ri
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.red)
                            Text("\(Ri,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        HStack{
                            Text("Green")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Gi
                                },
                                set: {(newValue) in
                                    self.Gi = newValue
                                    self.setting.Gi_color = self.Gi
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.green)
                            Text("\(Gi,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        HStack{
                            Text("  Blue")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Bi
                                },
                                set: {(newValue) in
                                    self.Bi = newValue
                                    self.setting.Bi_color = self.Bi
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.blue)
                            Text("\(Bi,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        Text("文字の色")
                        HStack{
                            Text("   Red")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Rw
                                },
                                set: {(newValue) in
                                    self.Rw = newValue
                                    self.setting.Rw_color = self.Rw
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.red)
                            Text("\(Rw,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        HStack{
                            Text("Green")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Gw
                                },
                                set: {(newValue) in
                                    self.Gw = newValue
                                    self.setting.Gw_color = self.Gw
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.green)
                            Text("\(Gw,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                        HStack{
                            Text("  Blue")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.leading)
                            Slider(value: Binding(
                                get: {
                                    self.Bw
                                },
                                set: {(newValue) in
                                    self.Bw = newValue
                                    self.setting.Bw_color = self.Bw
                                    
                                }
                                ), in: 0...255, step:1)
                                .padding(.leading)
                                .padding(.trailing)
                                .accentColor(Color.blue)
                            Text("\(Bw,specifier: "%.0f")")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                                .padding(.trailing)
                            }
                    }
                    
                    
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
            self.Rw = Setting().Rw_color
            self.Gw = Setting().Gw_color
            self.Bw = Setting().Bw_color
        })
        ){
            Text("ストーリーの色")
        }
    }
}



//入力ボタンの色
struct inbutton: View{
    @ObservedObject var setting = Setting()
    @State var Rn = Setting().Rn_color
    @State var Gn = Setting().Gn_color
    @State var Bn = Setting().Bn_color
    var body: some View{
        NavigationLink(destination:
            VStack{
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(red: self.Rn/255, green: self.Gn/255, blue: self.Bn/255))
                    .padding(20)
                Form{
                    Text("ボタンの色")
                    HStack{
                        Text("   Red")
                            .foregroundColor(Color.gray)
                            .font(.caption)
                            .padding(.leading)
                        Slider(value: Binding(
                            get: {
                                self.Rn
                            },
                            set: {(newValue) in
                                self.Rn = newValue
                                self.setting.Rn_color = self.Rn
                                
                            }
                            ), in: 0...255, step:1)
                            .padding(.leading)
                            .padding(.trailing)
                            .accentColor(Color.red)
                        Text("\(Rn,specifier: "%.0f")")
                            .foregroundColor(Color.gray)
                            .font(.caption)
                            .padding(.trailing)
                        }
                    HStack{
                        Text("Green")
                            .foregroundColor(Color.gray)
                            .font(.caption)
                            .padding(.leading)
                        Slider(value: Binding(
                            get: {
                                self.Gn
                            },
                            set: {(newValue) in
                                self.Gn = newValue
                                self.setting.Gn_color = self.Gn
                                
                            }
                            ), in: 0...255, step:1)
                            .padding(.leading)
                            .padding(.trailing)
                            .accentColor(Color.green)
                        Text("\(Gn,specifier: "%.0f")")
                            .foregroundColor(Color.gray)
                            .font(.caption)
                            .padding(.trailing)
                        }
                    HStack{
                        Text("  Blue")
                            .foregroundColor(Color.gray)
                            .font(.caption)
                            .padding(.leading)
                        Slider(value: Binding(
                            get: {
                                self.Bn
                            },
                            set: {(newValue) in
                                self.Bn = newValue
                                self.setting.Bn_color = self.Bn
                                
                            }
                            ), in: 0...255, step:1)
                            .padding(.leading)
                            .padding(.trailing)
                            .accentColor(Color.blue)
                        Text("\(Bn,specifier: "%.0f")")
                            .foregroundColor(Color.gray)
                            .font(.caption)
                            .padding(.trailing)
                        }
                }
            }.onAppear(perform: {
                self.Rn = Setting().Rn_color
                self.Gn = Setting().Gn_color
                self.Bn = Setting().Bn_color
            })
        ){Text("入力ボタンの色")}
    }
}



struct description: View{
    var body: some View{
        NavigationLink(destination:
            Text("利用規約とかを書くところ")
        ){Text("本アプリについて")}
    }
}
