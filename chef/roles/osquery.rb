name 'osquery'
description 'This tests our build of osquery'
run_list  'recipe[yum-epel]',
          'recipe[osquery]'
