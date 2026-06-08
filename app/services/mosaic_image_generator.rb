class MosaicImageGenerator
  # 列の数
  COLS       = 10
  # 行の数
  ROWS       = 9
  # ピースのサイズ（ピクセル単位）
  PIECE_SIZE = 30
  # 空の状態の時に表示するカラーを定義する
  # `.freeze` メソッド＝定数を書き換えられないようにする（Rubyだと定数は書き換え可能なため。）
  EMPTY_COLOR = [200, 200, 200].freeze

  # ピースの初期化
  def initialize(pieces)
    # pieces = [{ filled: true, color: "#DC5050" }, ...] の配列を想定
    @pieces = pieces
  end

  # 画像の生成
  def generate
    # 90個のピース配列を10個ずつのグループに分割する。（ each_slice ）
    # 各要素を row_pieces として小分けして新しい配列として返す
    grid_rows = @pieces.each_slice(COLS).map do |row_pieces|
      # Vipsを使って、新しいピースを生成する
      row_images = row_pieces.map { |piece| build_piece(piece) }
      # 新しく生成したピースを含めたピースを横に連結していく。
      row_images.reduce { |acc, img| acc.join(img, :horizontal) }
    end

    # 連結した各行を縦に連結させる
    grid_rows.reduce { |acc, row| acc.join(row, :vertical) }
  end

  private

  # ピースを生成
  def build_piece(piece)
    # ピースがあればhexカラーをrgb配列に変換する。なければEMPTY_COLORで定義した色を当てる。
    color = piece[:filled] ? hex_to_rgb(piece[:color]) : EMPTY_COLOR
    # Vipsを使って画像を生成。 縦横ともにPIECE_SIZEで定義したサイズ。色は変数colorに定義した内容に沿って生成する。
    Vips::Image.black(PIECE_SIZE, PIECE_SIZE).new_from_image(color)
  end

  # hexカラーをrgb配列に変換する処理内容
  def hex_to_rgb(hex)
    # hexカラーコードから "#" を削除する
    # 2文字ずつに分割してRGB各成分の16進数文字列の配列にする
    # 各要素を16進数から10進数に変換する（vipsが受け取れる 0~255 の整数にするため）
    hex.delete("#").scan(/../).map { |h| h.to_i(16) }
  end
end
