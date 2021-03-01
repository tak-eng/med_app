# README

# アプリケーション名：
アイデア管理用アプリ

# アプリケーション概要：
アイデア名とカテゴリー名を一緒に登録して、カテゴリー名とそれに対応するアイデア名を紐付ける

# 実装した機能について：
・Gemの”acts-as-taggable-on”を活用し、カテゴリー名を”タグ付け機能”として実装した
・respond_toメソッドを活用してJSON形式で、各ステータスコードを返すように記述
・カテゴリーの一覧を表示し、カテゴリー名を押せば、同じカテゴリーで登録したアイデア名を一括で表示できるように実装した


# DB設計：
## ideasテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| body   | string     | null: false |


## itemsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |


### Association
- belongs_to :trips

## missionsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |

### Association
- belongs_to :trips

## memosテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| text   | text       | null: false |


### Association
- belongs_to :trips