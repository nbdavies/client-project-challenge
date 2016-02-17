module ArticlesHelper
  def content_to_html(content)
    mark_down_content = content.gsub(/\*\*(.*)\*\*/, '<b>\1</b>')
    mark_down_content = mark_down_content.gsub(/\*(.*)\*/, '<i>\1</i>')
    mark_down_content = mark_down_content.gsub(/_(.*)_/, '<i>\1</i>')
    mark_down_content = mark_down_content.gsub(/\n/, '<br />')
  end
end
