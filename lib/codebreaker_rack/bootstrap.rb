# frozen_string_literal: true

require 'bundler'
Bundler.setup

require 'rack'
require 'tilt'
require 'slim'

require 'codebreker_manfly'

require_relative 'modules/helper'

require_relative 'entities/game_rack'
require_relative 'entities/codebreaker_rack_app'
