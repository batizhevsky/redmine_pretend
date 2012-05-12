module RedminePretend
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_account_left_bottom, :partial => 'user/pretend_to'
    render_on :view_layouts_base_html_head, :partial => 'user/unpretend'
    #render_on :, :partial => 'user/test'
  end
end
