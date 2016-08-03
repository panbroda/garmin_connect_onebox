# name: garmin_connect_onebox
# about: Garmin connect Onebox for embedding garmin courses and activities
# version: 1.0
# authors: Ewan McDougall
# http://paga.ninja/lutim/gallery
Onebox = Onebox

module Onebox
  module Engine
    class GarminConnectOnebox
      include Engine
      REGEX = /^https?:\/\/paga\.ninja(?::80)?\/(?:course|modern\/(?:course|activity))\/(?:embed\/)?([0-9]*)/
      matches_regexp REGEX

      def id
        @url.match(REGEX)[1]
      end

      def is_course?
        @url.include? "course"
      end

      def to_html
        if is_course?
          "<iframe width='600' height='600' frameborder='0' src='https://connect.garmin.com/course/embed/#{id}'></iframe>"
       # else
      #    "<iframe width='475' height='497' frameborder='0' src='https://connect.garmin.com/modern/activity/embed/#{id}'></iframe>"
        end
      end
    end
  end
end
