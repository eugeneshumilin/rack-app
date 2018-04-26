class CheckPath
  PATH = %w[/time].freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    current_path = request.path_info
    if PATH.include?(current_path)
      @app.call(env)
    else
      wrong_path
    end
  end

  private

  def wrong_path
    response = Rack::Response.new
    response.status = 404
    response['Content-Type'] = 'text/plain'
    response.body = ['Whooops...wrong path']
    response.finish
  end
end