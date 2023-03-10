# typed: false
# frozen_string_literal: true

module RedSands
  # BaseModel is the base class for the stateful objects in the game
  # it includes the Ma.publisher module and also the RedSands publisher module
  class BaseModel
    include Wisper::Publisher
    include Events::Publisher
  end
end
