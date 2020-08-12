module NotificationsHelper

    def notification_form(notification)
        @visiter = notification.visiter
        @comment = nil
        your_item = link_to 'あなたに', "#", style:"font-weight: bold;"
        @visiter_comment = notification.comment_id
        #notification.actionがfollowかlikeかcommentか
        @comment = Comment.find_by(id: @visiter_comment)&.content
        tag.a(@visiter.name, href:"#", style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:"#", style:"font-weight: bold;")+"にコメントしました"
    end

end
