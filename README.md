# さくらマーケット
## 概要
生鮮食品を扱うECサイトで、ユーザーが購入した商品について日記を書くなどのコミュニケーションができることが特徴です。

## 開発環境
- Rails 5.1.5
- Ruby 2.5.0

## 業務内容
- トップページで商品の一覧を確認できる
- ユーザはユーザ登録する
- ショッピングカートを通して商品を購入する
- ５商品ごとに送料がかかる
- 商品購入の際に送付先を入力する必要はない
- 決済方法は代引きのみ。手数料がかかる
- 配送日時を指定できる（時間帯、日にち）
- 管理者は商品を登録することができる
- 管理者は商品一覧の画面で表示順を設定できる
- 管理者はユーザ管理ができる（RUD)

## データモデル
- ユーザ
  - ユーザID
  - 名前
  - メールアドレス
  - パスワード
  - 郵便番号
  - 住所
- 商品
  - 商品ID
  - 商品名
  - 商品画像
  - 価格
  - 説明文
  - 非表示フラグ
  - 表示順
- カート（モデルのみ）
- カートアイテム
  - 量
  - カートID
  - 商品ID
- 注文
  - 注文ID（注文番号）
  - 注文日時
  - 合計金額
  - ユーザID
  - 送料
  - 支払い方法ID
  - 配送日時ID
  - 配送日
- 注文明細
  - 注文明細ID
  - 注文ID
  - 商品ID
  - 数量
  - 価格
- 支払方法
  - 支払方法ID
  - 支払方法
- 配送時間帯
  - 配送時間帯ID
  - 時間帯



## 参考サイト
- [Rails4.2.0 Bootstrapを導入](https://qiita.com/MasahideTakamura/items/b6d14d580c49ac49811e)
- [Rails5でカート機能を作るためのロジックを作ってみた](https://qiita.com/DialBird/items/89ce3a0f25c9dfdb38c1)
- [Rails 部分テンプレートの使い方](https://qiita.com/shizuma/items/1c655dadd2e04b3990a8)
- [Html2Haml](http://html2haml.herokuapp.com/)
- [link_toでPOSTする際にパラメータを渡す方法](https://qiita.com/sugra511/items/3b3235c4798e5b7e8bb5)
- [[初心者向け] Railsで関連するデータ(親子関係)を保存する方法あれこれ](https://qiita.com/jnchito/items/7f41ff3df900909952db)
- [holiday_jp](https://github.com/holiday-jp/holiday_jp-ruby)
- [Rails で namespace を適用する方法](https://qiita.com/ryo-ichikawa/items/2a9159b489a7b16c3dc6)
- [RailsのGem Active adminを使用して管理画面を作成する。](https://qiita.com/dawn_628/items/9ce2968963e162930d7a)
- [active_adminのCSS/JavaScript置き場](https://qiita.com/shinichinomura/items/7d34a2068d951c46dfc3)

## 疑問
- テーブルの正規化はどこまで？
- devise view　沢山のファイル
- devise erbをhamlに変える
- kaminariの沢山のファイル
- timeの扱い
- カート機能の実装
- 代引き手数料のテーブル
- 代引き手数料計算のメソッド
- ship_timeなどモデルは必要なのか？テーブルを作っただけで何の処理もない
- dateなどの標準ライブラリのrequireする場所はどこが適切か
- モデルの処理　クラス・メソッドからクラスメソッドを呼ぶのはどうなのか？
- orderのcreateの処理
- 管理機能の実装の仕方

