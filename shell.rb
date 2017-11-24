require 'readline'

while input = Readline.readline("> ", true)
  break if input == "exit"
  puts Readline::HISTORY.to_a if input == "hist"

  comp = proc { |s| Readline::HISTORY.grep(/^#{Regexp.escape(s)}/) }

  Readline.completion_append_character = " "
  Readline.completion_proc = comp

  system(input)
end
