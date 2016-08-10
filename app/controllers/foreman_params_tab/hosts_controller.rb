module ForemanParamsTab
  class HostsController < ::HostsController
    before_action :find_resource, :only => [:parameters]

    def parameters
      render :partial => 'parameters'
    rescue ActionView::Template::Error => exception
      process_ajax_error exception, 'fetch parameters'
    end

    def action_permission
      case params[:action]
      when 'parameters'
        :view
      else
        super
      end
    end
  end
end
