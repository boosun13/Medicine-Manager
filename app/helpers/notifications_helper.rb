module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @visiter_comment = notification.comment_id
    @post_title = Comment.find_by(id: @visiter_comment)&.post.title
    tag.a(@visiter.name, href: '#', style: 'font-weight: bold;') + 'が' + tag.a(@post_title, href: user_posts_path(current_user), style: 'font-weight: bold;') + 'にコメントしました。'
  end
end
