1.
SELECT * FROM パーティー

2.
SELECT 名称 AS なまえ,hp AS 現在のHP,mp AS 現在のMP FROM パーティー

3.
SELECT * FROM イベント

4.
SELECT イベント番号 AS 番号,イベント名称 AS 場面 FROM イベント

5.
INSERT INTO パーティー(id,名称,職業コード,hp,mp)
VALUES 
("A01","スガワラ",21,131,232),
("A02","オーエ",10,156,84), 
("A03","イズミ",20,84,190)

6.
SELECT * FROM パーティー
WHERE id="C02"

7.
UPDATE パーティー SET hp=120
WHERE id="A01"

8.
SELECT id,名称,hp FROM パーティー
WHERE hp < 100

9.
SELECT id,名称,mp FROM パーティー
WHERE mp >= 100

10.
SELECT イベント番号,イベント名称,タイプ FROM イベント
WHERE タイプ<>"3"

11.
SELECT イベント番号,イベント名称 FROM イベント
WHERE イベント番号<=5

12.
SELECT イベント番号,イベント名称 FROM イベント
WHERE イベント番号>20

13.
SELECT イベント番号,イベント名称 FROM イベント
WHERE 前提イベント番号 IS NULL

14.
SELECT イベント番号,イベント名称,後続イベント番号 FROM イベント
WHERE 後続イベント番号 IS NOT NULL

15.
UPDATE パーティー SET 状態コード="01"
WHERE 名称 LIKE "%ミ%"

16.
SELECT id,名称,hp FROM パーティー
WHERE hp BETWEEN 120 AND 160

17.
SELECT 名称,職業コード FROM パーティー
WHERE 職業コード IN("01","10","11")

18.
SELECT 名称,状態コード FROM パーティー
WHERE 状態コード IN "00","09"
19.
SELECT * FROM パーティー
WHERE hp>100 AND mp>100

20.
SELECT * FROM パーティー
WHERE id LIKE "A%" AND 職業コード LIKE "2%"

21.
22.
23.
24.
25.
26.
27.
28.
29.
30.
