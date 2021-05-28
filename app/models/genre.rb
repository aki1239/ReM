class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アクション' },
    { id: 3, name: 'SF' },
    { id: 4, name: 'ヒューマンドラマ' },
    { id: 5, name: 'ラブロマンス' },
    { id: 6, name: 'サスペンス' },
    { id: 7, name: 'ホラー' },
    { id: 8, name: 'ミステリー' },
    { id: 9, name: 'ミュージカル' },
    { id: 10, name: 'コメディ' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :movies

  end