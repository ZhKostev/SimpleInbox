$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_inbox/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_inbox"
  s.version     = SimpleInbox::VERSION
  s.authors     = ["Zhenya Kostev"]
  s.email       = ["zh.kostev@gmail.com"]
  s.summary     = "SimpleInbox gem is very simple gem for messaging in rails > 3.1 apps"
  s.description = "SimpleInbox gem is very simple gem for messaging in rails > 3.1 apps.
                   It fully customize => it copy all it's files to app.
                   How it works: After creating message it creates message copies for
                   sender(message_copy sender_id and recipient_id = sender.id) and for
                   recipients.
                   MessageCopy belongs to message and has delegated methods: body, subject, sender e.t.c "

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1"

  s.add_development_dependency "mysql2"
end
