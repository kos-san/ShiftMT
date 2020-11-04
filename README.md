# アプリ名
シフト管理ツール

# 概要
店舗の管理者が所属スタッフ個人の出勤希望をオンライン上で収集し、編集、共有が可能です。

# 本番環境
https://shiftmt.herokuapp.com/

Basic認証
- user: admin
- pass: 2222

# 制作背景（意図）
自分の過去の職務経歴の中で、欲しいと強く感じたシステムを形にしました。
以前の会社では、各店舗に配属を受け、所属しているスタッフは、シフト制の勤務形態を実施していました。
また、社員数よりアルバイト勤務のスタッフが多く所属し、そのため、シフト表の作成が毎月の業務にあり、大きな負担となっていました。
シフト表を作成する上で、個人の勤務希望の日程、時間を募り、そこから人件費などを加味して適正の人員を配置していきますが、提出してもらうのは、それぞれ出勤のタイミニングに記入してもらい、また、完成したシフト表を確認するにも出勤日になるため、作成に欠かれる時間は短い上に手書きや、エクセルを使用したシフト表では、労働量に加え、ミスも起きてしまうため、非常に負担の大きな作業となっていました。
これを解消する為、シフト表をオンライン上で提出、共有ができるようにし、変更があった場合でも、常に最新の情報が共有できるアプリケーションの開発を行いました。

# DEMO
スタッフは、個人でアカウントを取得することで、アプリケーションを使用することができます。
[![Image from Gyazo](https://i.gyazo.com/8d98c9d4c2b01987789812aa659e3013.png)](https://gyazo.com/8d98c9d4c2b01987789812aa659e3013)

管理したい店舗を管理者が作成することにより、管理することができます。
店舗にはいくつでも所属することができます。
[![Image from Gyazo](https://i.gyazo.com/892b1fbe0edab365f6b78dfdbe4f02f3.png)](https://gyazo.com/892b1fbe0edab365f6b78dfdbe4f02f3)

店舗を作成すると、店舗情報が表示され、管理者であれば、管理メニューも表示されます。
[![Image from Gyazo](https://i.gyazo.com/e3d8b230a16055ea6e02711e1f995ffe.png)](https://gyazo.com/e3d8b230a16055ea6e02711e1f995ffe)

「スタッフを招待する」へページ遷移すると、所属スタッフを電話番号から検索し、メンバーへ登録が可能になります。
[![Image from Gyazo](https://i.gyazo.com/5f2695487bbeab46b81c10ede7440887.png)](https://gyazo.com/5f2695487bbeab46b81c10ede7440887)
[![Image from Gyazo](https://i.gyazo.com/a6b8fa0ce415ebc8ebcf2327635fa3ea.png)](https://gyazo.com/a6b8fa0ce415ebc8ebcf2327635fa3ea)

「シフトを提出する」へページ遷移すると、スタッフは希望日時を提出することができます。
[![Image from Gyazo](https://i.gyazo.com/d2ecba290dacd8f240f369cc44e6a81b.png)](https://gyazo.com/d2ecba290dacd8f240f369cc44e6a81b)
登録ボタンから、時間の記入ができるようになります。
[![Image from Gyazo](https://i.gyazo.com/89d2f9ccd2cd1ea165c3c6441dc75e4c.png)](https://gyazo.com/89d2f9ccd2cd1ea165c3c6441dc75e4c)
登録を行うと、ページに反映され、時間が表示されます。
[![Image from Gyazo](https://i.gyazo.com/dd07e801a5015c57dc58648f136ac42f.png)](https://gyazo.com/dd07e801a5015c57dc58648f136ac42f)

「シフトを確認する」遷移すると、店舗スタッフの提出状況が確認できます。
[![Image from Gyazo](https://i.gyazo.com/09b686ab16bf217f8e67cc6b72a72852.png)](https://gyazo.com/09b686ab16bf217f8e67cc6b72a72852)
「業務連絡」へ遷移すると、スタッフが業務連絡を配信、閲覧することが可能です。
[![Image from Gyazo](https://i.gyazo.com/f6818c7a70002ffc09b62eba9bf85dc3.png)](https://gyazo.com/f6818c7a70002ffc09b62eba9bf85dc3)

「スタッフ一覧」へ遷移すると、各スタッフの管理者への任命、退職者のスタッフ権限の削除を行えます。
管理者へ任命されたスタッフは、管理者と同じ機能を使用できるようになります。
[![Image from Gyazo](https://i.gyazo.com/65cc69c3a601f7067b7a3c4df5417755.png)](https://gyazo.com/65cc69c3a601f7067b7a3c4df5417755)

「シフト表を作成する」へ遷移すると、各個人の希望時間を参照しながら、シフト表を作成することができます。
希望提出時に備考欄へコメントを記述している場合は、確認の文字が表示され、クリックをすると、内容が表示されるようになっています。
[![Image from Gyazo](https://i.gyazo.com/4f76d4238cc4ca74f175db4933a7c262.png)](https://gyazo.com/4f76d4238cc4ca74f175db4933a7c262)
時間をクリックすると、時間を指定して、登録が可能です。
[![Image from Gyazo](https://i.gyazo.com/dd4a0ba9a77a5e78a9c01c8ca9a7c300.png)](https://gyazo.com/dd4a0ba9a77a5e78a9c01c8ca9a7c300)

登録を行うと、「シフトを確認する」から遷移したページで、全てのスタッフに共有されます。
[![Image from Gyazo](https://i.gyazo.com/b55862bbbbc2049df9cd50c4e9edb953.png)](https://gyazo.com/b55862bbbbc2049df9cd50c4e9edb953)
# 工夫したポイント
　店舗の情報に、スタッフを登録することで、所属スタッフ（メンバー）、管理者スタッフ（管理者、メンバー）を管理者が決め、アプリケーション側で認識させ、権限により利用できるメニューを変更する方法を色々考えた結果、実装することができました。
メンバーテーブルを作成し、スタッフを追加したタイミングで、ユーザー情報を店舗情報をもたせて保存し、管理者は管理者テーブルへ店舗情報とメンバー情報をもたせて保存することで、常にこのテーブルの情報を監視することで、機能実装が可能になりました。
# 使用技術
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
Html, CSS, JavaScript, jQuery

## データベース
mySQL, Sequel Pro

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
- pdfファイルの出力を可能にし、印刷が行える機能の実装
  提出と共有、個人の出勤時間の確認をアプリケーションへアクセスすることで閲覧できるのは、便利ですが、都度アプリケーションへアクセスするのは、非常に不便だと思います。そのため、確認用に１枚でも共有用に印刷された紙があると、利便性は更に向上すると考えました。

- シフト表だけでなく、機能を拡張して、店舗管理が一括で行えるように実装
　店舗の管理に必要なのは、人員配置だけでなく、シフト表から算出した人件費などを参照して、店の営業利益を細かく計算し、営業の増益につながるツールも実装していきたいと考えました。
　また、数字に関する上長への報告書の作成も日々の業務で負担の大きいものになります。報告機能も揃えた機能が実装された時、アプリケーションの価値は格段に上がると考えています。

# DB設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| phone_num          | string | null: false |

### Association

- has_many :stores
- has_many :members
- has_many :shifts
- has_many :tables
- has_many :contacts

## stores テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| store_name | string       | null: false                    |
| tel        | string       | null: false                    |
| opening    | int          | null: false                    |
| closing    | int          | null: false                    |
| user       | reference    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :members
- has_many   :shifts
- has_many   :tables
- has_many   :contacts

## members テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| store  | reference | null: false, foreign_key: true |
| user   | reference | null: false, foreign,key: true |

### Association

- belongs_to :user
- belongs_to :store
- has_many   :admins

## admins テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| store  | reference | null: false, foreign_key: true |
| member | reference | null: false, foreign_key: true |

### Association

- belongs_to :member
- belongs_to :store

## shifts テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| workday | date      | null: false                    |
| start   | time      | null: false                    |
| ending  | time      | null: false                    |
| text    | text      |                                |
| user    | reference | null: false, foreign_key: true |
| store   | reference | null: false, foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :store

## tables テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| workday | date      | null: false                    |
| start   | time      | null: false                    |
| ending  | time      | null: false                    |
| store   | reference | null: false, foreign_key: true |
| user    | reference | null: false, foreign_key: true |

### Associations

- belongs_to :store
- belongs_to :user

## contacts テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| title  | string    | null: false                    |
| text   | text      | null: false                    |
| user   | reference | null: false, foreign_key: true |
| store  | reference | null: false, foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :store