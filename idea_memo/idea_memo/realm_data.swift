//
//  realm_data.swift
//  idea_memo
//
//  Created by 中村幸太 on 2021/01/29.
//

import Foundation
import RealmSwift

//保存するデータは文と単語、ペア検索の処理をするかどうか、文章のジャンル
//例：text = "文章の保存ができるよ"
//例：word = ["文章","保存","できる"]
//例：flag = true 　（ペアの処理の有無）
//例：genre = "ニュース"


//RealmのEntity
class realm_data :Object{
    @objc dynamic var id: Int = 0
    @objc dynamic var genre = "" //ジャンル
    @objc dynamic var text = "" //文章
    @objc dynamic var word = "" //分けた単語
    @objc dynamic var flag = true //ペア表示の処理を行うか
    
    private static var config = Realm.Configuration(schemaVersion :1)
    private static var realm = try! Realm(configuration: config)
    //idを主キーに設定
    override static func primaryKey() -> String? {
            return "id"
    }
    //realmのデータを取り出す関数
    static func all() -> Results<realm_data> {
        realm.objects(realm_data.self)
    }
}

//データを取得しておくクラス
class get_data : ObservableObject{
    @Published var dataEntities: Results<realm_data> = realm_data.all()
    //よくわからんけどここから下のずらっと書いてあるやつをコピペしたら保存した時にビューを更新してくれるようになった
    private var notificationTokens: [NotificationToken] = []
    
        init() {
            // DBに変更があったタイミングでdataEntitiesの変数に値を入れ直す
            notificationTokens.append(dataEntities.observe { change in
                switch change {
                case let .initial(results):
                    self.dataEntities = results
                case let .update(results, _, _, _):
                    self.dataEntities = results
                case let .error(error):
                    print(error.localizedDescription)
                }
            })
        }

        deinit {
            notificationTokens.forEach { $0.invalidate() }
        }
}
