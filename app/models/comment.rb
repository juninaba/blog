class Comment < ApplicationRecord
  belongs_to :article #tweetsテーブルとのアソシエーション
  belongs_to :user # usersテーブルとのアソシエーション
end
