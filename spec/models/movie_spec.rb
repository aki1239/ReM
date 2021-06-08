require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    user = FactoryBot.create(:user)
    @movie = FactoryBot.build(:movie, user_id: user.id)
  end


  describe '映画の投稿' do
    context '映画の投稿ができる場合' do
      it '各項目が埋まっていれば投稿できる' do
        expect(@movie).to be_valid
      end
    end
  end

  context '映画の投稿ができない場合' do
    it 'titleが空では投稿できない' do
      @movie.title = ''
      @movie.valid?
      expect(@movie.errors.full_messages).to include("Title can't be blank")
    end
    it 'imageが空では投稿できない' do
      @movie.image = nil
      @movie.valid?
      expect(@movie.errors.full_messages).to include("Image can't be blank")
    end
    it 'phraseが空では投稿できない' do
      @movie.phrase = ''
      @movie.valid?
      expect(@movie.errors.full_messages).to include("Phrase can't be blank")
    end
    it 'textが空では投稿できない' do
      @movie.text = ''
      @movie.valid?
      expect(@movie.errors.full_messages).to include("Text can't be blank")
    end
    it 'genre_idが1では投稿できない' do
      @movie.genre_id = 1
      @movie.valid?
      expect(@movie.errors.full_messages).to include("Genre must be other than 1")
    end
    it 'titleが41文字以上だと出品できない' do
      @movie.title = 'a' * 41
      @movie.valid?
      expect(@movie.errors.full_messages).to include('Title is too long (maximum is 40 characters)')
    end
    it 'textが1001文字以上だと出品できない' do
      @movie.text = 'a' * 1001
      @movie.valid?
      expect(@movie.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
    end
  end

end
