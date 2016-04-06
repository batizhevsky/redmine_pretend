module RedminePretend
  class Hooks < Redmine::Hook::ViewListener
    include ApplicationHelper
    render_on :view_users_form, :partial => 'user/pretend_to'
    render_on :view_account_left_bottom, :partial => 'user/pretend_to'
    render_on :view_layouts_base_html_head, :partial => 'user/unpretend'
  end
end
