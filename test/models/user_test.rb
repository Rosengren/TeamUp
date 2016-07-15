require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_user_creation
    puts "Beginning user creation testing..."

    user = User.new
    assert_not user.save, user.errors.full_messages
    
    user = User.new({"username" => "test_user"})
    user.valid?
    assert_not user.save, user.errors.full_messages

    user = User.new({"password" => "test_password"})
    user.valid?
    assert_not user.save, user.errors.full_messages

    user = User.new({"email" => "test_email"})
    user.valid?
    assert_not user.save, user.errors.full_messages

    user = User.new({"username" => "test_user", "email" => "test_email@email.com"})
    user.valid?
    assert_not user.save, user.errors.full_messages

    user = User.new({"password" => "test_password", "email" => "test_email@email.com"})
    user.valid?
    assert_not user.save, user.errors.full_messages

    user = User.new({"password" => "test_password", "username" => "test_user"})
    user.valid?
    assert_not user.save, user.errors.full_messages

    user = User.new({"username" => "test_user", "password" => "test_password", "email" => "test_email@email.com"})
    user.valid?
    assert_not user.save, user.errors.full_messages

    user = User.new({"username" => "test_user", "password" => "test_password", "email" => "test_email@email.com", "slug" => "test_user"})
    user.valid?
    assert user.save, user.errors.full_messages

    puts "Finished user creation testing..."
  end

  def test_user_deletion
    puts "Beginning user deletion testing..."

    user = User.new({"username" => "test_user", "password" => "test_password", "email" => "test_email@email.com", "slug" => "test_user"})
    assert user.destroy, "User was not destroyed"

    puts "Finished user deletion testing..."
  end

  def test_other_methods
    puts "Beginning user model method testing..."

    user = User.new({"username" => "test_user", "password" => "test_password", "email" => "test_email@email.com", "slug" => "test_user"})
    wrong_ip = "1"
    test_ip = "192.168.2.1"

    assert_equal user.to_param, user.slug

    assert_not user.authenticated?(user.remember_token), "Not authenticated"

    user.set_ip(wrong_ip)
    assert_not_equal user.last_ip_address, test_ip, "IP address is set wrong"
    user.set_ip(test_ip)
    assert_equal user.last_ip_address, test_ip, "IP address is set right"

    assert_nil user.remember_digest, "User remember digest should be nil"
    user.remember
    assert_not_nil user.remember_digest, "User remember digest should be set"
    user.forget
    assert_nil user.remember_digest, "User remember digest should be nil again"

    confirm_token = user.confirmation_action
    assert_not_nil confirm_token, "User should now have a new confirmation token"
    assert_equal confirm_token, user.confirmation_action, "User should still have the same token on immediate method re-call"

    assert_not_nil user.confirmation_expiry, "User should need to confirm account"
    user.activate_account
    assert_nil user.confirmation_expiry, "User account should be active"

    puts "Finished user model method testing..."
  end
end
