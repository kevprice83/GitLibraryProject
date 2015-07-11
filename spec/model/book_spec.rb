require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:each) do
    @title = "The lord of the rings"
    @author = "Tolkien"
  end

  describe 'creation' do
    it 'should create a book when parameters are correct' do
      expect(Book.create(title: @title, author: @author).id).not_to be_falsy
    end

    it 'should NOT create a book when title is nil' do
      expect do
        Book.create!(title: nil, author: @author)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a book when title is empty' do
      expect do
        Book.create!(title: "", author: @author)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a book when author is nil' do
      expect do
        Book.create!(title: @title, author: nil)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a book when author is empty' do
      expect do
        Book.create!(title: @title, author: "")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a book when the title already exists' do
      Book.create(title: @title, author: @author)
      expect do
        Book.create!(title: @title, author: @author)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
