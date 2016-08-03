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
      REGEX = /^https?:\/\/paga\.ninja(?::80)?\/lutim\/gallery(.*)/m
      matches_regexp REGEX

      def id
        @url.match(REGEX)[1]
      end

      def to_html
          "<iframe width='600' height='600' frameborder='0' src='http://paga.ninja/lutim/gallery#{id}'></iframe>"
       # else
      #    "<iframe width='475' height='497' frameborder='0' src='https://connect.garmin.com/modern/activity/embed/#{id}'></iframe>"
      end
    end
  end
end
