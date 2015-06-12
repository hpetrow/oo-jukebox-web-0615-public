require 'pry'

class Jukebox

  def initialize(songs)
    @songs = songs
  end

  def call
    puts "Welcome. Please enter a command"
    command = gets.strip
    while command != "exit"
      case command
        when "help"
          help
        when "list"
          list
        when "play"
          puts "Please enter the song you would like to play"
          song = gets.strip
          play(song)
        when /play.+/
          song = command.split("play ").last
          play(song)
      end
      puts "Please enter a command"
      command = gets.strip
    end
  end

  def help
    puts "Commands: (?=.*help)(?=.*list)(?=.*play)(?=.*exit)"
  end

  def list
    @songs.each {|song|
      puts song
    }
  end

  def play(input = gets.strip)
    song = input.to_i.to_s == input ? @songs[input.to_i-1] : input
    puts "Now Playing: #{song}"
  end
end
