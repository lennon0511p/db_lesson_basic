CREATE TABLE departments (
    department_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (department_id)
);

ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, department_id, age, gender) VALUES
('山田 太郎', 'yamada@example.com', 1, 28, 1),
('佐藤 花子', 'sato@example.com', 1, 32, 2),
('鈴木 一郎', 'suzuki@example.com', 1, 25, 1),
('高橋 健太', 'takahashi@example.com', 2, 35, 1),
('田中 裕子', 'tanaka@example.com', 2, 29, 2),
('伊藤 洋平', 'ito@example.com', 2, 40, 1),
('渡辺 美咲', 'watanabe@example.com', 2, 26, 2),
('小林 誠', 'kobayashi@example.com', 3, 45, 1),
('加藤 恵', 'kato@example.com', 4, 38, 2),
('吉田 剛', 'yoshida@example.com', 5, 30, 1);

INSERT INTO reports (person_id, content) VALUES
(7, '本日はA社への新規営業同行を行いました。'),
(8, '既存顧客のB社への定期ヒアリングを実施しました。'),
(9, '営業部内の月次売上データの集計作業を完了しました。'),
(10, '新機能のバックエンドAPIの実装に着手しました。'),
(11, 'フロントエンドのUIコンポーネント改修を行いました。'),
(12, 'データベースのパフォーマンスチューニングを実施。'),
(13, 'テスト仕様書の作成および単体テストを実行しました。'),
(14, '先月分の経費精算処理および月次決算の補助を行いました。'),
(15, '来年度の新卒採用に向けた面接スケジュールを調整しました。'),
(16, '社内ネットワークのセキュリティアップデートを実施しました。');

SELECT * FROM people;

UPDATE people SET department_id = 1 WHERE department_id IS NULL;

SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
-- peopleテーブルから、department_idカラムの値が1であるレコードを絞り込み、created_atカラムの昇順に並び替えて、name・email・ageの3つのカラムを取得する。

SELECT name FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2)
   OR (age BETWEEN 40 AND 49 AND gender = 1);

SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

SELECT p.name, d.name, r.content
FROM people p
INNER JOIN departments d USING (department_id)
INNER JOIN reports r USING (person_id);

SELECT p.name
FROM people p
LEFT OUTER JOIN reports r USING (person_id)
WHERE r.report_id IS NULL;