# デモQRスキャナー

これは、QRコードを使用して従業員の勤怠を管理するためのFlutterアプリケーションです。

## 説明

このアプリケーションを使用すると、従業員はQRコードをスキャンして勤怠（出勤、退勤、休憩開始、休憩終了）を記録できます。QRコードが利用できない場合は、手動で入力するオプションも提供されています。このアプリケーションは、データをローカルに保存し、ネットワーク接続が利用可能な場合にサーバーと同期することで、オフラインで動作するように設計されています。

## 特徴

*   **QRコードスキャン**: 従業員のQRコードをスキャンして情報を取得します。
*   **手動入力**: QRコードが利用できない場合に、従業員IDと名前を手動で入力します。
*   **勤怠ステータス**: 勤怠ステータス（出勤、退勤、休憩開始、休憩終了）を記録します。
*   **ローカルデータストレージ**: SQLiteデータベースを使用して勤怠記録をローカルに保存します。
*   **オフラインサポート**: アプリケーションはオフラインで動作し、ネットワーク接続が利用可能になるとデータを同期します。
*   **ローカリゼーション**: 英語と日本語をサポートしています。

## 技術スタック

*   **フレームワーク**: [Flutter](https://flutter.dev/)
*   **状態管理**: [GetX](https://pub.dev/packages/get)
*   **データベース**: [Drift](https://pub.dev/packages/drift) (SQLite)
*   **ルーティング**: [GetX](https://pub.dev/packages/get)
*   **QRコードスキャナー**: [mobile_scanner](https://pub.dev/packages/mobile_scanner)
*   **ネットワーク監視**: [connectivity_plus](https://pub.dev/packages/connectivity_plus)
*   **ロギング**: [logger](https://pub.dev/packages/logger)
*   **ローカリゼーション**: [flutter_localizations](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html), [intl](https://pub.dev/packages/intl)

## プロジェクト構造

このプロジェクトはGetXパターンに従い、機能ごとに構成されています。

```
lib
├── bindings
├── core
│   ├── constants
│   ├── database
│   ├── extensions
│   ├── network
│   ├── services
│   ├── theme
│   └── utils
├── domain
├── features
│   ├── attendance
│   ├── employee
│   ├── manual_entry
│   └── qr_scanner
├── l10n
└── routes
```

*   `bindings`: アプリケーションの依存性注入バインディングが含まれています。
*   `core`: データベース、ネットワーク、サービス、テーマ、ユーティリティなどの共有コンポーネントが含まれています。
*   `domain`: アプリケーションのビジネスロジックが含まれています。
*   `features`: アプリケーションのさまざまな機能が含まれており、それぞれに独自の `data`、`domain`、`presentation` レイヤーがあります。
*   `l10n`: ローカリゼーションファイルが含まれています。
*   `routes`: アプリケーションのルートが含まれています。

## はじめに

ローカルコピーをセットアップして実行するには、次の簡単な手順に従ってください。

### 前提条件

*   Flutter SDK: Flutter SDKがインストールされていることを確認してください。インストール手順は[こちら](https://flutter.dev/docs/get-started/install)にあります。

### インストール

1.  リポジトリをクローンします
    ```sh
    git clone https://github.com/your_username/demo_qr_scanner.git
    ```
2.  パッケージをインストールします
    ```sh
    flutter pub get
    ```
3.  アプリを実行します
    ```sh
    flutter run
    ```
