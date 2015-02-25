default[:osquery][:dir]                                       = '/etc/osquery'
default[:osquery][:config][:options][:osquery_log_dir]        = '/var/log/osquery'
default[:osquery][:config][:options][:db_path]                = '/tmp/osquery.db'
default[:osquery][:config][:options][:pidfile]                = '/var/run/osquery.pid'
default[:osquery][:config][:options][:lockfile]               = '/var/lock/subsys/osquery'
default[:osquery][:config][:options][:config_retriever]       = 'filesystem'
default[:osquery][:config][:options][:debug]                  = 'false'
default[:osquery][:config][:options][:disable_logging]        = 'false'
default[:osquery][:config][:options][:event_pubsub]           = 'true'
default[:osquery][:config][:options][:event_pubsub_expiry]    = 86000
default[:osquery][:config][:options][:host_identifier]        = 'hostname'
default[:osquery][:config][:options][:log_receiver]           = 'filesystem'
default[:osquery][:config][:options][:log_result_events]      = 'true'
default[:osquery][:config][:options][:schedule_splay_percent] = 10
default[:osquery][:config][:options][:use_in_memory_database] = 'false'
default[:osquery][:config][:options][:verbose_debug]          = 'false'
default[:osquery][:config][:options][:worker_threads]         = 4
default[:osquery][:config][:scheduledQueries] = 
    [
    {
      "name" => "processtest",
      "query" => "SELECT * FROM processes;",
      "interval" => 30
      },
      {
        "name" => "listening_ports",
        "query" => "SELECT uid, name FROM listening_ports l, processes p WHERE l.pid=p.pid;",
        "interval" => 86400 
      }
    ]
  
