class Article < ApplicationRecord
  belongs_to :user #usersテーブルとのアソシエーション
  has_many :comments #commentsテーブルとのアソシエーション
end