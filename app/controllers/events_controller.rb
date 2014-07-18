class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    mt_params = permitted(JSON.parse(params["man_tracker"]))
    @event = Event.new(mt_params.merge(headers))
    @event.save!
    render nothing: true
    return
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.permit(:man_tracker)
    end

    def headers
      {
          ip: request.remote_ip,
          user_agent: request.user_agent
      }
    end

    def permitted(mt_params)
      allowed_params = [:account_id]
      mt_params.select{|k,v| allowed_params.include?(k.to_sym) }
    end
end
