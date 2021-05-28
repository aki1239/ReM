class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title, :phrase, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :genre_id, numericality: { other_than: 1 } 
  validates :genre_id, presence: true
end
