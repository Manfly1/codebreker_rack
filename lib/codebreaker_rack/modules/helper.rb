# frozen_string_literal: true

module Helper
  def redirect(page)
    Rack::Response.new { |response| response.redirect(page) }
  end

  def response_not_found
    Rack::Response.new('Page not found', 404)
  end

  def create_response(page, status = 200, **args)
    Rack::Response.new(render(page, **args), status)
  end

  def render(filename, **args)
    layout = Tilt.new(full_path('index'))
    page = Tilt.new(full_path(filename))
    layout.render { page.render(Object.new, **args) }
  end

  def full_path(filename)
    "#{File.join('views', filename)}.html.erb"
  end
end
