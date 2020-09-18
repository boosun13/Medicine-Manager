class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, foreign_key: 'item_id', dependent: :destroy

  validates :title, presence: true

  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      item_id: id,
      visited_id: user_id,
      action: 'inquiry'
    )
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, comment_id)
    # 管理者はユーザーへ、ユーザーは管理者へ通知
    if current_user.admin
      temp = Post.find_by(id: id).user
      save_notification_comment!(current_user, comment_id, temp.id)

    else
      temps = User.where(admin: true)
      temps.each do |temp|
        save_notification_comment!(current_user, comment_id, temp.id)
      end
    end
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # 管理者の自分への通知をしないようにする
    if current_user.id != visited_id
      notification = current_user.active_notifications.new(
        item_id: id,
        comment_id: comment_id,
        visited_id: visited_id,
        action: 'comment'
      )
      notification.save if notification.valid?
    end
  end
end
