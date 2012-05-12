module RedminePretend
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_account_left_bottom, :partial => 'user/pretend_to'
    render_on :view_my_account, :partial => 'user/unpretend'
  end
end
