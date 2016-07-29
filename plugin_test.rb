require 'minitest/autorun'

module Onebox
  module Engine
    class GarminConnectOnebox
      attr_accessor :url
      def self.matches_regexp regex
        "stub"
      end
    end
  end
end

require './plugin.rb'

class TestRegex < Minitest::Test
  def setup
    @regex = Onebox::Engine::GarminConnectOnebox::REGEX
  end

  def test_regex
    assert_equal "123456", "http://connect.garmin.com:80/course/123456".match(@regex)[1]
    assert_equal "123456", "https://connect.garmin.com:80/course/123456".match(@regex)[1]
    assert_equal "123456", "https://connect.garmin.com/course/123456".match(@regex)[1]
    assert_equal "123456", "https://connect.garmin.com/course/embed/123456".match(@regex)[1]
  end

  def test_regex_modern
    assert_equal "123456", "https://connect.garmin.com/modern/activity/123456".match(@regex)[1]
    assert_equal "123456", "https://connect.garmin.com/modern/course/123456".match(@regex)[1]
    assert_equal "123456", "https://connect.garmin.com/modern/activity/embed/123456".match(@regex)[1]
  end
end

class TestGarminConnectOnebox < Minitest::Test
  def setup
    @box = Onebox::Engine::GarminConnectOnebox.new
  end

  def test_course_to_html
    @box.url = "https://connect.garmin.com:80/course/123456"
    assert_equal "<iframe width='600' height='600' frameborder='0' src='https://connect.garmin.com/course/embed/123456'></iframe>", @box.to_html
  end

  def test_activity_to_html
    @box.url = "https://connect.garmin.com:80/modern/activity/123456"
    assert_equal "<iframe width='475' height='497' frameborder='0' src='https://connect.garmin.com/modern/activity/embed/123456'></iframe>", @box.to_html
  end
end
