# Conduit - RealWorldプロジェクト
Conduitは、Medium.comのクローンサイトであり、RealWorldプロジェクトの一環として開発されました。本プロジェクトでは、Railsを使用してConduitと同じ外観と機能を持つサイトを実装しています。

[Conduit](https://demo.realworld.io/#/)は、本番レベルのWebアプリケーションを構築する際の一般的な技術、パターン、実践的なアプローチを示すために設計されています。

[RealWorld公式サイト
](https://realworld-docs.netlify.app/)


## 技術スタック
* バックエンド: Ruby on Rails(APIモード)
* データベース: MySQL


## 実装済み機能
* ユーザー認証 (JWT)
* 記事の作成、特定の記事の閲覧、編集、削除

## 未実装機能
* 記事へのコメント
* ユーザーと記事のフォロー機能
* タグによる記事のフィルタリング

## 開発環境

* ruby 2.7.0
* Rails 6.0.6.1

## 使用したgem
* bcrypt
	* パスワードのハッシュ化に使用されるgemです。セキュリティを強化するために、パスワードをハッシュ化して保存します。
* active model serializers
	* オブジェクトのJSONシリアライズを行うgemです。Railsアプリケーションで、レスポンスとしてJSONデータを整形する際に使用されます。
* devise
	* 認証システムを提供するgemです。ユーザー登録、ログイン、ログアウトなどの機能を簡単に追加できます。
*  jwt(JSON Web Tokens)
	*  Webトークンの生成と検証に使用されるgemです。API認証によく使用され、セキュアなユーザー認証と認可を実現します。

