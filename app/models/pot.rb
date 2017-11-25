class Pot < ApplicationRecord
    has_many :pot_images
    accepts_nested_attributes_for :pot_images
    
    #COLORS = ["red", "blue", "green", "yellow", "brown", "white", "black", "pink", "purple", "orange", "other"]
end
