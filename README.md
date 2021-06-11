# アプリケーション名
## ReM
鑑賞した映画を記録し、記録した内容を再度思い出すことで記憶力向上も期待できるアプリケーションです。

# アプリケーション概要
アプリURL: http://rem-35563.herokuapp.com/<br>
ベーシック認証: user⇨syo    password⇨2222. <br>
アプリ GitHub: https://github.com/aki1239/ReM

# テスト用アカウント
nickname⇨test@test　　email⇨test@test 　　password⇨111aaa<br>
第二アカウント　 test2        test2@test2        111aaa <br>           



<img src="https://i.gyazo.com/abf52082619f85be9cabe310b0888f4d.jpg" width="500">


# 作成背景
私は普段家で映画やアニメを鑑賞することが多いです。しかし友人と映画の話をする際に映画の感想や言葉が出てこない時があります。
鑑賞した作品が多くなるほどそういった場面が増えていき、本当は楽しく話をしたいだけなのに、映画の内容が思い出せずにフラストレーションを抱えてしまう。
そんな時に自分で鑑賞した作品を管理し、記憶が薄れた段階で内容を思い出せるようなツールがあればと思い、このアプリケーションを作成しました。

# 利用方法
## ①まずはアカウントを作成し、自分だけの映画の棚を作成してください。
<img src="https://gyazo.com/732a0891f26b74d872af2b8c705e831b.png" width="300px">

## ②このままでは何も表示されませんので映画を記録するために記録ボタンを押してください。
<img src="https://i.gyazo.com/712f1e6ec6ea3f53eccee19a4f55b71d.png" width="500px">

## ③各項目を入力し、記録ボタンを押すとトップページに表示されます。
<img src="https://i.gyazo.com/0e85e672ddd1fe209e98a3c7c74bce4e.png" width="500px">

## ④表示された作品をクリックすると詳細が表示され、投稿した内容を編集、削除することができます。
<img src="https://i.gyazo.com/842bf6e98b9ba5df2e01830fe8e64845.png" width="500px">

## ⑤作品の詳細ページのReMボタンをクリックすると２秒後に画面上部にアラートが出現し、自分で考えたキャッチフレーズはなんだったか質問してきます。
<img src="https://i.gyazo.com/f4778686a6fca60c2146bc425f5b64b3.jpg" width="300px">

## ⑥正しければ、「正しく入力されました」と表示されます。間違った場合は正解を教えてくれます。
<img src="https://i.gyazo.com/dc97f1ec7edef4fc2203b2f521215928.jpg" width="300px">

## ⑦作品にはジャンルを設定しており、ジャンル検索機能によって指定したジャンルのみを表示させることができます。
<img src="https://i.gyazo.com/5c62794bfd8f7e4bd429b752852b5f9e.jpg" width="500px">


# ER図
<img src="https://i.gyazo.com/3e90d92ddcb2e1639c8406e1751279b0.png" width="300px">

# データベース設計
## usersテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
|nickname|string|null: false|
| email | string | null: false, unicue:true |
|password|string|null: false|
### Association
has_many :movies

## moviesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|title|string|null: false|
|genre_id|integer|null: false|
|phrase|string|null: false|
|text|text|null: false|
|user_id|integer|foreign_key: true, null: false|
### Association
belongs_to :user

# 今後の課題
現状ではリマインド機能が手動で実行される仕様で、今後は映画を記録してから一定時間後に自動でアラート表記される仕組みを取り入れたいです。
# 今後実装予定の機能
## 星機能
作品の情報を入力する際に５段階の星の評価を設定し、一覧ページや詳細ページで表示させる機能
## 正答率表示機能
リマインド機能での正答率を内部で記録させ、正答率を表示させる機能




