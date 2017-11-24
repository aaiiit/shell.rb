# http://www.rubyguides.com/2016/07/writing-a-shell-in-ruby/
require 'readline'

while input = Readline.readline("> ", true)
  break if input == "exit"
  puts Readline::HISTORY.to_a if input == "hist"

  comp = proc do |s|
    dir_list = Dir.glob("#{s}*")

    if dir_list.size > 0
      dir_list
    else
      Readline::HISTORY.grep(/^#{Regexp.escape(s)}/)
    end
  end

  Readline.completion_append_character = " "
  Readline.completion_proc = comp

  system(input)
end
