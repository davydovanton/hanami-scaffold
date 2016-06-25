require 'hanami'
require 'hanami/scaffold'
require 'hanami/scaffold/version'
require 'hanami/cli_sub_commands/generate'

module Hanami
end

Hanami::CliSubCommands::Generate.define_commands do
  desc 'scaffold', 'Generate CRUD routes'
  long_desc <<-EOS
  EOS
  def scaffold
    if options[:help]
      invoke :help, ['scaffold']
    else
      puts 'scaffold generated'
    end
  end
end
