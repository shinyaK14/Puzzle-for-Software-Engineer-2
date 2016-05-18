module ControllerHelper
  def json
    JSON.parse(last_response.body)
  end

  def json_message
    JSON.parse(json['message'])
  end
end
