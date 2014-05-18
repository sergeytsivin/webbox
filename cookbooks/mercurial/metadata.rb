name              "mercurial"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs mercurial"
version           "2.0.4"

recipe "mercurial", "Installs mercurial"

%w{ debian ubuntu }.each do |os|
  supports os
end

depends           "python"
