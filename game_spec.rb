require_relative 'game'

describe Game do
  it 'scores a gutter game' do
    game = Game.new

    roll_many(20, 0, game)

    expect(game.score).to eq 0
  end

  it 'scores a game with all ones' do
    game = Game.new

    roll_many(20, 1, game)

    expect(game.score).to eq 20
  end

  it 'scores a game with one spare' do
    game = Game.new

    game.roll 5
    game.roll 5
    game.roll 3
    roll_many(17, 0, game)

    expect(game.score).to eq 16
  end

  it 'scores a game with one strike' do
    game = Game.new

    game.roll 10
    game.roll 3
    game.roll 4
    roll_many(16, 0, game)

    expect(game.score).to eq 24
  end

  it 'scores the perfect game' do
    game = Game.new

    roll_many(12, 10, game)

    expect(game.score).to eq 300
  end
end

def roll_many(number_of_rolls, pins, game)
  1.upto(number_of_rolls) do |play_num|
    game.roll pins
  end
end
