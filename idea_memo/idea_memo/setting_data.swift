//
//  setting_data.swift
//  idea_memo
//
//  Created by 中村幸太 on 2021/01/31.
//

import Foundation

//各種設定用のデータ
//付箋の色とかストーリーみたいなやつの色を決める用のユーザーデフォルト

class Setting: ObservableObject {
    //R　付箋
    @Published var R_color : Double {
        didSet {
            UserDefaults.standard.set(R_color, forKey: "R_color")
        }
    }
    //G　付箋
    @Published var G_color : Double {
        didSet {
            UserDefaults.standard.set(G_color, forKey: "G_color")
        }
    }
    //B　付箋
    @Published var B_color : Double {
        didSet {
            UserDefaults.standard.set(B_color, forKey: "B_color")
        }
    }
    //Rf　付箋文字
    @Published var Rf_color : Double {
        didSet {
            UserDefaults.standard.set(Rf_color, forKey: "Rf_color")
        }
    }
    //Gf　付箋文字
    @Published var Gf_color : Double {
        didSet {
            UserDefaults.standard.set(Gf_color, forKey: "Gf_color")
        }
    }
    //Bf　付箋文字
    @Published var Bf_color : Double {
        didSet {
            UserDefaults.standard.set(Bf_color, forKey: "Bf_color")
        }
    }
    //Rs　ストーリーの枠
    @Published var Rs_color : Double {
        didSet {
            UserDefaults.standard.set(Rs_color, forKey: "Rs_color")
        }
    }
    //Gs　ストーリーの枠
    @Published var Gs_color : Double {
        didSet {
            UserDefaults.standard.set(Gs_color, forKey: "Gs_color")
        }
    }
    //Bs　ストーリーの枠
    @Published var Bs_color : Double {
        didSet {
            UserDefaults.standard.set(Bs_color, forKey: "Bs_color")
        }
    }
    //Rss　ストーリーの枠2
    @Published var Rss_color : Double {
        didSet {
            UserDefaults.standard.set(Rss_color, forKey: "Rss_color")
        }
    }
    //Gss　ストーリーの枠2
    @Published var Gss_color : Double {
        didSet {
            UserDefaults.standard.set(Gss_color, forKey: "Gss_color")
        }
    }
    //Bss　ストーリーの枠2
    @Published var Bss_color : Double {
        didSet {
            UserDefaults.standard.set(Bss_color, forKey: "Bss_color")
        }
    }
    //Ri　ストーリーの円の中
    @Published var Ri_color : Double {
        didSet {
            UserDefaults.standard.set(Ri_color, forKey: "Ri_color")
        }
    }
    //Gi　ストーリーの円の中
    @Published var Gi_color : Double {
        didSet {
            UserDefaults.standard.set(Gi_color, forKey: "Gi_color")
        }
    }
    //Bi　ストーリーの円の中
    @Published var Bi_color : Double {
        didSet {
            UserDefaults.standard.set(Bi_color, forKey: "Bi_color")
        }
    }
    //Rw　ストーリーの円の文字
    @Published var Rw_color : Double {
        didSet {
            UserDefaults.standard.set(Rw_color, forKey: "Rw_color")
        }
    }
    //Gw　ストーリーの円の文字
    @Published var Gw_color : Double {
        didSet {
            UserDefaults.standard.set(Gw_color, forKey: "Gw_color")
        }
    }
    //Bw　ストーリーの円の中
    @Published var Bw_color : Double {
        didSet {
            UserDefaults.standard.set(Bw_color, forKey: "Bw_color")
        }
    }
    //Rn　入力ボタンの色
    @Published var Rn_color : Double {
        didSet {
            UserDefaults.standard.set(Rn_color, forKey: "Rn_color")
            
        }
    }
    //Gn　入力ボタンの色
    @Published var Gn_color : Double {
        didSet {
            UserDefaults.standard.set(Gn_color, forKey: "Gn_color")
            
        }
    }
    //Bn　入力ボタンの色
    @Published var Bn_color : Double {
        didSet {
            UserDefaults.standard.set(Bn_color, forKey: "Bn_color")
            
        }
    }
    
    //初期起動判定
    @Published var f_on : Bool {
        didSet {
            UserDefaults.standard.set(f_on, forKey: "f_on")
        }
    }
    
    /// 初期化処理
    init() {
        R_color = UserDefaults.standard.double(forKey: "R_color")
        G_color = UserDefaults.standard.double(forKey: "G_color")
        B_color = UserDefaults.standard.double(forKey: "B_color")
        Rf_color = UserDefaults.standard.double(forKey: "Rf_color")
        Gf_color = UserDefaults.standard.double(forKey: "Gf_color")
        Bf_color = UserDefaults.standard.double(forKey: "Bf_color")
        Rs_color = UserDefaults.standard.double(forKey: "Rs_color")
        Gs_color = UserDefaults.standard.double(forKey: "Gs_color")
        Bs_color = UserDefaults.standard.double(forKey: "Bs_color")
        Rss_color = UserDefaults.standard.double(forKey: "Rss_color")
        Gss_color = UserDefaults.standard.double(forKey: "Gss_color")
        Bss_color = UserDefaults.standard.double(forKey: "Bss_color")
        Ri_color = UserDefaults.standard.double(forKey: "Ri_color")
        Gi_color = UserDefaults.standard.double(forKey: "Gi_color")
        Bi_color = UserDefaults.standard.double(forKey: "Bi_color")
        Rw_color = UserDefaults.standard.double(forKey: "Rw_color")
        Gw_color = UserDefaults.standard.double(forKey: "Gw_color")
        Bw_color = UserDefaults.standard.double(forKey: "Bw_color")
        Rn_color = UserDefaults.standard.double(forKey: "Rn_color")
        Gn_color = UserDefaults.standard.double(forKey: "Gn_color")
        Bn_color = UserDefaults.standard.double(forKey: "Bn_color")
        f_on = UserDefaults.standard.bool(forKey: "f_on")
    }
}
