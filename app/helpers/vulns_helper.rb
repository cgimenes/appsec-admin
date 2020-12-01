module VulnsHelper
  def risk_class(risk)
    case risk
    when 'critical' then
      'badge badge-dark'
    when 'high' then
      'badge badge-danger'
    when 'medium' then
      'badge badge-warning'
    when 'low' then
      'badge badge-success'
    when 'info' then
      'badge badge-info'
    end
  end

  def status_class(status)
    case status
    when 'pending'
      'badge badge-danger'
    when 'fixed'
      'badge badge-success'
    when 'accepted'
      'badge badge-info'
    when 'incomplete_data'
      'badge badge-info'
    end
  end

  def boolean_icon_class(boolean)
    boolean ? 'fa fa-check-square-o' : 'fa fa-square-o'
  end
end
