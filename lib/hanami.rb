require 'hanami'
require 'hanami/scaffold'
require 'hanami/scaffold/version'
require 'hanami/cli_sub_commands/generate'
require 'hanami/commands/generate/action'

module Hanami
end

Hanami::CliSubCommands::Generate.define_commands do
  ACTIONS = {
    'index'  => 'GET',
    'new'    => 'GET',
    'create' => 'POST',
    'edit'   => 'GET',
    'update' => 'PUT',
    'delete' => 'DELETE'
  }.freeze

  desc 'scaffold', 'Generate CRUD routes'
  option :only, type: :array
  option :expect, type: :array
  long_desc <<-EOS
    `hanami generate scaffold` generates an an actions, views and templates along with specs and a routes.

    For Application architecture the application name is 'app'. For Container architecture the default application is called 'web'.

    > $ hanami generate scaffold cars

    > $ hanami generate scaffold web cars
  EOS
  def scaffold(application_name = :app, controller_name)
    if options[:help]
      invoke :help, ['scaffold']
    else
      actions =
        if options[:expect].any?
          ACTIONS.dup.delete_if { |key, value| options[:expect].include? key }
        else
          ACTIONS
        end

      actions.each do |action, method|
        say_status "Generate", "#{method} #{controller_name}##{action}"
        Hanami::CliSubCommands::Generate.new.invoke :actions,
          [application_name, "#{controller_name}##{action}"], method: method
        puts
      end
    end
  end
end
