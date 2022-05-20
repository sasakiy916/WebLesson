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
SELECT * FROM イベント AS e
JOIN コード AS c
ON e.タイプ=c.コード値
WHERE c.コード名称="強制" AND 前提イベント番号 IS NOT NULL AND 後続イベント番号 IS NOT NULL

22.
パーティーテーブル:id
イベントテーブル:イベント番号

23.
SELECT DISTINCT 状態コード FROM パーティー

24.
SELECT id,名称 FROM パーティー
ORDER BY id ASC

25.
SELECT 名称,職業コード FROM パーティー
ORDER BY 名称 DESC

26.
SELECT 名称,hp,状態コード FROM パーティー
ORDER BY 状態コード ASC,hp DESC

27.
SELECT タイプ,イベント番号,イベント名称,前提イベント番号,後続イベント番号 FROM イベント
ORDER BY 1 ASC,2 ASC

28.
SELECT * FROM パーティー
ORDER BY hp DESC LIMIT 3

29.
SELECT * FROM パーティー
ORDER BY mp DESC LIMIT 1 OFFSET 2

30.
SELECT 
CASE 
WHEN c.コード値 LIKE "1%" THEN "[S]"
WHEN c.コード値 LIKE "2%" THEN "[M]"
ELSE "[A]"
END AS 職業区分,
職業コード,
ID,
名称
FROM パーティー AS p
JOIN コード AS c
ON p.職業コード=c.コード値
WHERE c.コード種別=1
ORDER BY 職業コード ASC

31.
SELECT e.イベント番号 FROM イベント AS e
WHERE e.イベント番号 NOT IN (SELECT イベント番号 FROM 経験イベント)

32.
SELECT イベント番号 FROM イベント
JOIN コード
ON タイプ=コード値
WHERE 
イベント番号 IN(
    SELECT イベント番号 FROM 経験イベント
    WHERE クリア区分=1
) 
AND
コード名称="フリー"

33.
SELECT
名称 AS なまえ,
コード名称 AS 職業,
hp AS 現在のHP,
CASE
WHEN コード名称 IN("武闘家","学者")THEN hp+50
ELSE hp
END AS 装備後のHP
FROM パーティー
JOIN コード
ON 職業コード=コード値
WHERE コード種別=1

34.
UPDATE パーティー SET mp=mp+20
WHERE id IN("A01","A03")

35.
SELECT 名称 AS なまえ,hp AS 現在のHP,hp*2 AS 予想されるダメージ FROM パーティー
JOIN コード
ON 職業コード=コード値
WHERE コード名称 IN("武闘家")

36.
SELECT
名称 AS なまえ,
concat(hp,"/",mp) AS HPとMP,
CASE
WHEN 状態コード IS NULL OR 状態コード="00" THEN ""
ELSE (SELECT コード名称 FROM コード WHERE コード種別=2 AND コード値=状態コード)
END AS ステータス
FROM パーティー

37.
SELECT 
イベント番号,
イベント名称,
コード名称 AS タイプ,
CASE
WHEN イベント番号 BETWEEN 1 AND 10 THEN "序盤"
WHEN イベント番号 BETWEEN 11 AND 17 THEN "中盤"
ELSE "終盤"
END AS 発生時期 
FROM イベント AS p
JOIN (SELECT * FROM コード WHERE コード種別=3) AS c
ON p.タイプ=c.コード値
ORDER BY イベント番号

38.
SELECT 名称 AS なまえ,hp AS 現在のHP,char_length(名称)*10 AS 予想ダメージ FROM パーティー

39.
UPDATE パーティー 
SET 状態コード=(
    SELECT コード値 FROM コード
    WHERE コード名称="混乱"
)
WHERE hp%4=0 OR mp%4=0

40.
SELECT floor(777 * ((100-30)/100)) AS 支払った金額

41.
UPDATE パーティー SET hp=hp+ROUND(hp*0.3,0),mp=mp+ROUND(mp*0.3,0)

42.
SELECT 名称 AS なまえ,hp AS HP,POWER(hp,0) AS 攻撃1回目,POWER(hp,1)AS 攻撃2回目,POWER(hp,2)AS 攻撃3回目 FROM パーティー AS p
JOIN (SELECT * FROM コード WHERE コード種別=1) AS c
ON p.職業コード=c.コード値
WHERE コード名称="戦士"

43.
SELECT 名称 AS なまえ,hp AS HP,状態コード,
状態コード+CASE
WHEN hp<=50 THEN 3
WHEN hp<=100 THEN 2
WHEN hp<=150 THEN 1
ELSE 0
END AS リスク値
FROM パーティー
ORDER BY リスク値 DESC,HP ASC

44.
SELECT IFNULL(前提イベント番号,"前提なし") AS 前提イベント番号,
イベント番号,
IFNULL(後続イベント番号,"後続なし") AS 後続イベント番号
FROM イベント

45.
SELECT 
concat(max(hp),"/",min(hp),"/",avg(hp)) AS HPの最大、最小、平均,
concat(max(mp),"/",min(mp),"/",avg(mp)) AS MPの最大、最小、平均
FROM パーティー

46.
SELECT コード名称 AS タイプ,COUNT(タイプ) AS イベント数
FROM イベント
JOIN (SELECT * FROM コード WHERE コード種別=3) AS c
ON タイプ=コード値
GROUP BY タイプ

47.
SELECT クリア結果,COUNT(クリア結果)イベント数 FROM 経験イベント
WHERE クリア結果 IS NOT NULL
GROUP BY クリア結果
ORDER BY クリア結果 ASC

48.
SELECT 
CASE
WHEN sum(mp)<500 THEN "敵は見とれている!"
WHEN sum(mp)<1000 THEN "敵は呆然としている!"
ELSE "敵はひれ伏している!"
END AS 小さな奇跡の効果
FROM パーティー

49.
SELECT 
CASE WHEN クリア区分=1 THEN "クリアした"
ELSE "参加したがクリアしていない"
END AS 区分,
count(クリア区分) AS イベント数
FROM 経験イベント
GROUP BY クリア区分 DESC

50.
SELECT SUBSTRING(職業コード,1,1) AS 職業タイプ,sum(hp) AS 最大HP,min(hp) AS 最小MP,avg(hp) AS 平均HP,sum(mp) AS 最大MP,min(mp) AS 最小MP,avg(mp) AS 平均MP 
FROM パーティー
GROUP BY 職業タイプ

51.
SELECT SUBSTRING(id,1,1) AS IDによる分類,avg(hp) AS HPの平均,avg(mp) AS MPの平均 
FROM パーティー
GROUP BY IDによる分類

52.
SELECT 
SUM(
    CASE
    WHEN hp<100 THEN 1
    WHEN hp<150 THEN 2
    WHEN hp<200 THEN 3
    ELSE 5
    END
)
AS 開けられる扉の数 
FROM パーティー

53.
SELECT 
名称 AS なまえ,
hp AS 現在のHP,
(SELECT hp
WHERE コード名称="勇者")/SUM(hp)*100
AS パーティでの割合 
FROM パーティー
LEFT JOIN (SELECT * FROM コード WHERE コード種別=1) AS c
ON 職業コード=コード値

54.

55.
56.
57.
58.
59.
60.
