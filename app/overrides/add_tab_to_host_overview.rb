tab_content = "<div id='params' class='tab-pane'
                data-ajax-url='<%= parameters_host_path(@host)%>'
                data-on-complete='onContentLoad'>
  <%= spinner(_('Loading Parameters information ...')) %>
</div>"

Deface::Override.new(:virtual_path => 'hosts/show',
                     :name => 'add_host_params_tab',
                     :insert_bottom => 'ul',
                     :text => "<li><a href='#params' data-toggle='tab'>Params</a></li>")

Deface::Override.new(:virtual_path => 'hosts/show',
                     :name => 'add_host_params_tab_content',
                     :insert_bottom => 'div#myTabContent',
                     :text => tab_content)

