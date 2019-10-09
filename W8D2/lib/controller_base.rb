require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :request, :result, :params

  # Setup the controller
  def initialize(req, res)
    @request = req
    @response = res
  end

  # Helper method to alias @already_built_response
  def already_built_response?
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Double Render Error" if @already_built_response
    @already_built_response = true
    @response.location = url
    @response.status = 302
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Double Render Error" if @already_built_response
    @already_built_response = true
    @response.write(content)
    @response['CONTENT_TYPE'] = content_type
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

