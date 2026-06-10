# 既存のデータを削除する。
Piece.destroy_all

# 埋まってるピースをDBに保存する。
[0, 1, 2, 5, 6, 10, 15, 20, 25, 30].each do |position|
  Piece.create!(position: position, color: "blue")
end
