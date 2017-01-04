module Onebox
  module Engine
    class CoubOnebox
      include Engine
      include StandardEmbed

      matches_regexp(/^https?:\/\/coub\.com\/view\//)
      always_https

      def placeholder_html
        oembed = get_oembed
        "<img src='#{oembed[:thumbnail_url]}' height='#{oembed[:thumbnail_height]}' width='#{oembed[:thumbnail_width]}' #{Helpers.title_attr(oembed)}>"
      end

      def to_html
        get_oembed[:html]
      end

    end
  end
end
