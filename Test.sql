CREATE TABLE SQL.TestTbl(
    Name VARCHAR(50),
    Email VARCHAR(50),
    Memo VARCHAR(100)
)

INSERT INTO SQL.TestTbl VALUES('田辺次郎','jiro@mail.com','システム管理者です')
INSERT INTO SQL.TestTbl VALUES('高田みどり','midori@mail.com','営業担当者です')
INSERT INTO SQL.TestTbl VALUES('市川武','take@mail.com','システム管理者です')
INSERT INTO SQL.TestTbl VALUES('緑川照子','teru@mail.com','会社代表です')

--- エクスポートを試す
--- 第1引数：エクスポートファイル
--- 第2引数：エクスポート対象テーブル
--- 第3引数：（省略可）デリミタ（デフォルトは ,）
CALL SQL.Utils_CSVExport('c:\temp\test.csv','SQL.TestTbl')


TRUNCATE TABLE SQL.TestTbl

--- インポートを試す
--- 第1引数：インポートファイル
--- 第2引数：インポート対象テーブル
--- 第3引数：（省略可）デリミタ（デフォルトは ,）
CALL SQL.Utils_CSVImport('c:\temp\test.csv','SQL.TestTbl')

SELECT * FROM SQL.TestTbl


