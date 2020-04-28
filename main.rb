require './libs/game.rb'
begin
  puts 'Welcome!'
  play = true
  rematch = ''
  while play
    game = Game.new 'player 1', 'player 2'
    game.start
    valid = false
    until valid
      puts 'play again?[Y,n]'
      rematch = gets.chomp
      valid = true if %w[y Y n N].include? rematch
    end
    play = false unless %w[y Y].include? rematch
  end
rescue SystemExit, Interrupt
rescue Exception
  raise
ensure
  puts "\nbye..."
end
