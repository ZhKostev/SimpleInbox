module SimpleInbox

  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Copies files to application"

    def copy_files
      copy_file 'app/controllers/messages_controller.rb', 'app/controllers/messages_controller.rb'
      copy_file 'app/models/message.rb', 'app/models/message.rb'
      copy_file 'app/models/message_copy.rb', 'app/models/message_copy.rb'
    end
  end
end
