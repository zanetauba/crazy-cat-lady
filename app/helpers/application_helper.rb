module ApplicationHelper




ZERO_STAR_ICON_NAME =   'star_empty'
FULL_STAR_ICON_NAME =  'star_full'
HALF_STAR_ICON_NAME =  'star_half_full'

def render_stars(rating)
  round_by_half = (rating * 2).round / 2.0
  total_stars = Array.new(round_by_half, FULL_STAR_ICON_NAME)
  total_stars += [HALF_STAR_ICON_NAME] if round_by_half - round_by_half.to_i == 0.5
  total_stars += Array.new(5 - total_stars.size, ZERO_STAR_ICON_NAME) unless total_stars.size == 5
end

end
