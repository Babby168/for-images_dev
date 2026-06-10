class CssMosaicController < ApplicationController
  def index
    # DBから piece テーブルの全件を取得。
    @pieces = Piece.all
  end

  def add_piece
    # DBの piecesテーブルから positionカラムを指定して値を高速に配列で返す。（インスタンス化させない。）
    filled_positions = Piece.pluck(:position)

    # 0〜89までの数値の中から、まだ埋まってない状態の最小の数値を探す。
    next_position = (0..89).find { |i| !filled_positions.include?(i) }

    # もしまだ埋まってない状態数値があれば、新規 Pieceレコードを作成・保存する。
    if next_position
      Piece.create!(position: next_position, color: "blue")
    end

    # piecesテーブルの全件を取得する。
    @pieces = Piece.all

    # Turbo Stream形式でレスポンスを返す。
    respond_to do |format|
      format.turbo_stream
    end
  end
end
