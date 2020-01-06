require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  # 1. 访问登录页面；
  # 2. 确认正确渲染了登录表单；
  # 3. 提交无效的 params 散列，向登录路径发起 post 请求；
  # 4. 确认重新渲染了登录表单，而且显示了一个闪现消息；
  # 5. 访问其他页面（例如首页）；
  # 6. 确认这个页面中没显示前面那个闪现消息。

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

end
