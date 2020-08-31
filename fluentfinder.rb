require 'ankirb'
require 'sinatra'

get '/' do
  deck = create_deck
  create_anki_cards(deck, 'Hola', 'Hello', 123)
  create_anki_cards(deck, 'Hola2', 'Hello2', 124)
  Anki::apkg.export deck, 'FluentFinderDeck.apkg'
  'Hello world!'
end

def create_deck
  Anki::Deck.new 'FluentFinderDeck'
end

module Anki
  class Card
    attr_accessor :id
  end
end

def create_anki_cards(deck, f_text, n_text, i)
  card_f_n_text = Anki::Card.new(
    front: f_text, back: n_text
  )
  card_f_n_text.id = i

  deck.add_card card_f_n_text
end
