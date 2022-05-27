# プログラムでCSVファイルをテーブルに読み込む方法のサンプル

InterSystems IRIS／Caché の管理ポータルメニュー：SQLデータインポートウィザードの処理で行うようなCSVファイルをテーブルへインポート、テーブルからファイルにエクスポートする方法をプログラムで実行することができます。

※ サンプルは**バージョン 2017.1以降**で動作確認しています。

※ **バージョン 2016.2.3以前でお試しいただく場合**は、[SQL.Utilsクラス](SQL/Utils.cls) の20行目をコメント化してからご利用ください。
```
//Set mgr.IQN=$$$BuildIQN(SchemaName,TableName)
```

## 1.サンプルの使用手順

CSVファイルをテーブルへインポート、テーブルからファイルへエクスポートの処理は、[SQL.Utilsクラス](SQL/Utils.cls)を使用しています。

- 1) サンプルのインポート

    実行したいネームスペースに [SQL.Utilsクラス](SQL/Utils.cls)をインポートします。

    スタジオをご利用の場合は、ファイルをドラッグ＆ドロップするとインポートできます。

    管理ポータルでインポートされる場合は、[システムエクスプローラ] > [クラス] > (ネームスペース選択) > インポートボタンクリック でファイルを選択し、インポートを行います。

    VSCodeをご利用の場合は、使用したいIRISに接続し、[SQL.Utilsクラス](SQL/Utils.cls)を保存（Ctrl＋S）するとインポートされます。


- 2) サンプルの実行方法

    - A) SQLで試したい場合

        テストで使用するテーブル定義の作成、テストデータの追加、サンプルの実行など、SQLで実行できます。

        手順は、[Test.sql](Test.sql)をご覧ください。

    - B) クラスで試したい場合

        [SQL.TestTbl.cls](SQL/TestTbl.cls) をインポートします。

        テストデータの作成は以下のメソッドを実行してください。

        ```
        do ##class(SQL.TestTbl).CreateData()
        ```

        テーブルからCSVファイルへのエクスポートには、[SQL.Utils](SQL/Utils.cls)クラスのCSVExport()メソッドを使用します。
        実行例は以下の通りです。

        ```
        USER>do ##class(SQL.Utils).CSVExport("c:\temp\test.csv","SQL.TestTbl")
        Name || %Library.String
        Email || %Library.String
        Memo || %Library.String
        
        ルーチンのコンパイル中 : SQLExport4.mac
        ```

        テストデータの一括削除には、以下のメソッドを実行してください。
        ```
        do ##class(SQL.TestTbl).DestroyData()
        ```

        CSVファイルからテーブルへのインポートには、[SQL.Utils](SQL/Utils.cls)クラスのCSVImport()メソッドを使用します。
        実行例は以下の通りです。

        ```
        USER>do ##class(SQL.Utils).CSVImport("c:\temp\test.csv","SQL.TestTbl")
        adding Name
        adding Email
        adding Memo
        
        Importing data
        Building indices...
        Import complete: 4 rows inserted into SQL.TestTbl
        ```

