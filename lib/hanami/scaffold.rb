require 'hanami'
require 'hanami/scaffold/version'
require 'hanami/cli_base'
require 'hanami/cli_sub_commands/generate'
require 'hanami/commands/generate/action'

module Hanami
  module Scaffold
  end
end

module Hanami
  module Scaffold
    module CLI
      class Generate < Hanami::Cli::Commands::Command
        ACTIONS = {
          'index'  => 'GET',
          'new'    => 'GET',
          'create' => 'POST',
          'edit'   => 'GET',
          'update' => 'PUT',
          'delete' => 'DELETE'
        }.freeze


        desc "Generate CRUD routes"
        argument :application_name, default: :web
        argument :project_name, required: true
        option :only, type: :array
        option :except, type: :array
        def call(application_name, project_name, **options)
          actions =
            if options[:except] && options[:except].any?
              ACTIONS.dup.delete_if { |key, _| options[:except].include?(key) }
            elsif options[:only] && options[:only].any?
              ACTIONS.dup.delete_if { |key, _| !options[:only].include?(key) }
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
  end
end

Hanami::Cli.register "generate scaffold", Hanami::Scaffold::CLI::Generate
