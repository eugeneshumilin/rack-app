require_relative 'time_handler'

class App
  def call(env)
    request = Rack::Request.new(env)
    time = TimeHandler.new(request.params)

    if time.unknown.empty?
      response(200, Time.now.strftime(time.valid))
    else
      response(400, "Bad news...format #{time.unknown} is unknown")
    end
  end

  private

  def response(status, body)
    [
      status,
      { 'Content-Type' => 'text/plain' },
      [body]
    ]
  end
end
