module TopicsHelper
  def action_tag(array)
    link_to fa_icon(array[0], text: array[1]), action_topic_path(type: array[2]),
    title: array[3], data: { confirm: array[4] }, method: :post
  end
end
