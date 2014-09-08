Onebox = Onebox

module Onebox
  module Engine
    class GarminConnectOnebox
      include Engine
      REGEX = /^https?:\/\/connect\.garmin\.com(?::80)?\/course\/(?:embed\/)?([0-9]*)/
      matches_regexp REGEX

      def id
        @url.match(REGEX)[1]
      end

      def url
        "//connect.garmin.com/course/embed/#{id}"
      end

      def to_html
        "<iframe width='600' height='600' frameborder='0' src='#{'url'}'></iframe>"
      end
    end
  end
end
