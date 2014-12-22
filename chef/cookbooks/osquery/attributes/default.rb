default[:osquery][:dir]                    = '/etc/osquery'
default[:osquery][:logdir]                 = '/var/log/osquery'
default[:osquery][:db_path]                = '/etc/osquery/osquery.db'
default[:osquery][:pidfile]                = '/var/run/osquery.pid'
default[:osquery][:lockfile]               = '/var/lock/subsys/osquery'
default[:osquery][:config_retriever]       = 'filesystem'
default[:osquery][:debug]                  = 'false'
default[:osquery][:disable_logging]        = 'false'
default[:osquery][:event_pubsub]           = 'true'
default[:osquery][:event_pubsub_expiry]    = '86000'
default[:osquery][:host_identifier]        = 'hostname'
default[:osquery][:log_receiver]           = 'filesystem'
default[:osquery][:log_result_events]      = 'true'
default[:osquery][:schedule_splay_percent] = '10'
default[:osquery][:use_in_memory_database] = 'false'
default[:osquery][:verbose_debug]          = 'false'
default[:osquery][:worker_threads]         = '4'
default[:osquery][:config] = {
        "scheduledQueries" => [
        {
          "name" => "processtest",
          "query" => "SELECT * FROM processes;",
          "interval" => 30 
        },
        {
          "name" => "aprtest",
          "query" => "SELECT * FROM arp_cache;",
          "interval" => 110 
        }
      ]
    }
