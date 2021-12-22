# frozen_string_literal: true

module Entities
  class CodebreakerRackApp
    include Helper

    ARRAY_STATE = %(game win lose hint restart)

    def self.call(env)
      new(env).response.finish
    end

    def initialize(env)
      @env = env
      @request = Rack::Request.new(env)
    end

    def response
      command = @request.path.delete('/')
      case command
      when '' then home
      when 'statistics' then statistics
      when 'rules' then rules
      else
        ARRAY_STATE.include?(command) ? GameRack.call(@env) : response_not_found
      end
    end

    private

    def home
      @request.session.clear
      create_response('home')
    end

    def statistics
      create_response('statistics')
    end

    def rules
      create_response('rules')
    end
  end
end
