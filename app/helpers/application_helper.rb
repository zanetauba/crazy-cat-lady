module ApplicationHelper

ZERO_STAR_ICON_NAME =   'https://res.cloudinary.com/zaneta111uba111shula111/image/upload/v1595672127/star_empty.png'
FULL_STAR_ICON_NAME =  'https://res.cloudinary.com/zaneta111uba111shula111/image/upload/v1595672127/star_full.png'
HALF_STAR_ICON_NAME =  'https://res.cloudinary.com/zaneta111uba111shula111/image/upload/v1595672127/star_half_full.png'

  def render_stars(rating)
    round_by_half = (rating * 2).round / 2.0
    total_stars = Array.new(round_by_half, FULL_STAR_ICON_NAME)
    total_stars += [HALF_STAR_ICON_NAME] if round_by_half - round_by_half.to_i == 0.5
    total_stars += Array.new(5 - total_stars.size, ZERO_STAR_ICON_NAME) unless total_stars.size == 5
  end

end
