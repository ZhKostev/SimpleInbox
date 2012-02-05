module SimpleInbox

  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Copies files to application"

    def copy_files
      copy_file 'app/controllers/messages_controller.rb', 'app/controllers/messages_controller.rb'
      copy_file 'app/models/message.rb', 'app/models/message.rb'
      copy_file 'app/models/message_copy.rb', 'app/models/message_copy.rb'
      migration_name = "db/migrate/" + Time.now.strftime("%Y%m%d%H%M%S") + "_message_install_migration.rb"
      copy_file 'db/migrate/message_install_migration.rb', "#{migration_name}"
      copy_file 'app/views/messages/_form.html.erb', 'app/views/messages/_form.html.erb'
      copy_file 'app/views/messages/_message.html.erb', 'app/views/messages/_message.html.erb'
      copy_file 'app/views/messages/index.html.erb', 'app/views/messages/index.html.erb'
      copy_file 'app/views/messages/new.html.erb', 'app/views/messages/new.html.erb'
      copy_file 'app/views/messages/show.html.erb', 'app/views/messages/show.html.erb'
      copy_file 'app/assets/javascripts/messages.js.coffee', 'app/assets/javascripts/messages.js.coffee'
      copy_file 'app/assets/stylesheets/messages.css.scss', 'app/assets/stylesheets/messages.css.scss'
    end
  end
end
