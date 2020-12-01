module TeamsHelper
  def criticalness_class(criticalness)
    case criticalness
    when 'high' then
      'badge badge-danger'
    when 'medium' then
      'badge badge-warning'
    when 'low' then
      'badge badge-success'
    end
  end
end
