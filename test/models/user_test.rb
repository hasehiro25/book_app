# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    DatabaseCleaner.start
    @hash = OmniAuth.config.add_mock(:github, { uid: "123456", info: { email: "sample4@sample.com", nickname: "git-sample" } })
  end

  teardown do
    DatabaseCleaner.clean
  end

  test "invalide postcode should not be saved" do
    user = users(:taro)
    user.postcode = "12345"
    assert_not user.valid?
  end

  test "#from_omniuath should create user the first time" do
    User.from_omniauth(@hash)
    user = User.last

    assert_equal user.uid, "123456"
    assert_equal user.email, "sample4@sample.com"
    assert_equal user.name, "git-sample"
    assert_equal user.provider, "github"
  end

  test "#from_omniauth should not create user if user exists" do
    assert_difference "User.count", 1 do
      User.from_omniauth(@hash)
    end

    assert_difference "User.count", 0 do
      User.from_omniauth(@hash)
    end
  end

  test "#from_omniauth should match user if user exists" do
    User.from_omniauth(@hash)
    user = User.last
    assert_equal user, User.from_omniauth(@hash)
  end

  test "#delete_avatar should delete image" do
    user =  users(:taro)
    user.avatar.attach(io: File.open(Rails.root.join("public", "sample_image.png").to_s), filename: "sample_image.jpg", content_type: "image/png")
    user.delete_avatar
    assert_not user.avatar.attached?
  end

  test "#followings? should return true if follwed" do
    assert users(:taro).following?(users(:jiro))
  end
end
