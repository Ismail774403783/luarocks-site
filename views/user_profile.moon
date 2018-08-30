
Header = require "widgets.user_header"

class UserProfile extends require "widgets.page"
  header_content: =>
    widget Header!

  inner_content: =>
    @term_snippet "luarocks install --server=#{@user\source_url @} <name>"

    h3 "Modules"
    @render_pager @pager
    @render_modules @modules
    @render_pager @pager


    if @current_user and @current_user\is_admin!
      p ->
        a href: @url_for("admin.user", id: @user.id), "Admin page"
    
