# 技術検証用アプリ（PieceFit スパイク）

## 概要

PieceFit（ストレッチ習慣化アプリ）の本開発に先立ち、未経験技術の動作確認を目的として作成した検証用アプリです。

各技術を本番アプリと同じ技術スタック（Rails 8 / PostgreSQL / Docker Compose / TailwindCSS）上で検証しています。

---

## 検証した技術

| 技術 | 用途（本番アプリでの役割） | 対象リリース |
|---|---|---|
| Cloudinary | モザイク合成済み画像の保存・配信 | 本リリース |
| libvips / ruby-vips | 色ブロックを1枚の画像に合成 | 本リリース |
| Sidekiq / Redis | 画像合成処理の非同期実行 | 本リリース |
| HTML / CSS描画 | モザイクアートのCSS Grid描画・Turbo Streamsでのリアルタイム更新 | MVP |

---

## 技術スタック

| 技術 | バージョン |
|---|---|
| Ruby | 3.4.x |
| Rails | 8.1.x |
| PostgreSQL | 最新安定版 |
| Docker Compose | - |
| TailwindCSS | v4系 |
| Hotwire（Turbo / Stimulus） | Rails標準 |

---

## 環境構築

```bash
# リポジトリをクローン
git clone <リポジトリURL>
cd <リポジトリ名>

# .envファイルを作成（Cloudinary認証情報を設定）
cp .env.example .env
# CLOUDINARY_URL=cloudinary://... を記入

# コンテナを起動
docker compose up --build
```

---

## 各技術検証の確認方法

### Cloudinary

```
http://localhost:3000/cloudinary_test/index
```

画像をアップロードしてCloudinaryへの保存・表示を確認できます。

### libvips / ruby-vips

```bash
docker compose exec web bin/rails runner app/services/mosaic_image_generator.rb
```

単色ブロックの生成・結合・グリッド合成をコンソールで確認できます。

### Sidekiq / Redis

```
http://localhost:3000/sidekiq
```

ジョブのキューイング・非同期実行をSidekiqダッシュボードで確認できます。

### HTML / CSS描画

```
http://localhost:3000/css_mosaic/index
```

CSS Gridによるモザイクグリッドの描画と、「ストレッチ完了！」ボタンによるTurbo Streamsでのリアルタイム更新を確認できます。

---

## 注意事項

- 本リポジトリは動作確認のみを目的としており、本番運用を想定したコードではありません
- `.env` ファイルはGit管理対象外です（`.gitignore` に記載済み）
- Cloudinaryの認証情報は必ず `.env` ファイルで管理してください
