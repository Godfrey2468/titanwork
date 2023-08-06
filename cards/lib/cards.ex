defmodule Cards do
@moduledoc """
This provides a method for creating and handling a deck of cards
"""

  def create_deck do
    values = ["Ace", "two", "three","Four", "Five"]
      suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    #cards =   for value <- values do
        for suit <- suits, value <- values do
         "#{value} of #{suit}"
        end
      #end

      #List.flatten(cards)
  end

  #======================================================================================================
  def shuffle(deck) do

    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
#==================================================================================================
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  #=================================================================================================
  def load(filename) do
    {status, binary} = File.read(filename)
    :erlang.binary_to_term binary
  end
# This function creates a new deck,shuffle it and deal it in one call
  def create_hand(hand_size) do
       Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end

Cards.create_deck()
#Cards.shuffle()
#Cards.create_hand()
