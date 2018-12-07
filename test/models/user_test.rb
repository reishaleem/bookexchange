require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: 'Test Student', email: 'student.1@osu.edu', phone: '6141234567', rank: '4', age: '20', password: 'foobar', password_confirmation: 'foobar')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  # Test attribute presence
  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'rank should be present' do
    @user.rank = ''
    assert_not @user.valid?
  end

  test 'age should be present' do
    @user.age = ''
    assert_not @user.valid?
  end

  # Test attribute length constraints
  test 'name should not be too long' do
    @user.name = 'a' * 41
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'phone should not be too long' do
    @user.phone = '1' * 11
    assert_not @user.valid?
  end

  # Test age validation
  test 'user should not be too old' do
    @user.age = 101
    assert_not @user.valid?
  end
  
  test 'user should be at least 1' do
    @user.age = 0
    assert_not @user.valid?
  end
end
