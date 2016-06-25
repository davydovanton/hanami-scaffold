require 'hanami'
require 'hanami/scaffold'
require 'hanami/scaffold/version'
require 'hanami/cli_sub_commands/generate'
require 'hanami/commands/generate/action'

module Hanami
end

Hanami::CliSubCommands::Generate.define_commands do
  ACTIONS = {
    index:  'GET',
    new:    'GET',
    create: 'POST',
    edit:   'GET',
    update: 'PUT',
    delete: 'DELETE'
  }.freeze

  desc 'scaffold', 'Generate CRUD routes'
  option :only, type: :array
  option :expect, type: :array
  long_desc <<-EOS
  EOS
  def scaffold(application_name = nil, controller_name)
    if options[:help]
      invoke :help, ['scaffold']
    else
      ACTIONS.each do |action, method|
        say_status "Generate", "#{method} #{controller_name}##{action}"
        Hanami::CliSubCommands::Generate.new.invoke :actions,
          [application_name, "#{controller_name}##{action}"], method: method
        puts
      end
    end
  end
end
