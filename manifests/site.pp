
node default{
     file {'/tmp/mastersetup-success':                                   # resource type file and filename
       ensure  => present,                                               # make sure it exists
       mode    => 0644,                                                  # file permissions
       content => "Here is my Public IP Address: ${ipaddress_eth0}.\n",  # note the ipaddress_eth0 fact
     }
}
node 'puppetagent.us-west-2.compute.internal' {nginx::vhost::apply{"web1": 
                domain => "site1.training.puppet.in",
                root => "/home/ubuntu/site1",
                dir => "site1"
        }
        nginx::vhost::apply{"web2":
                domain => "site2.training.puppet.in",
                root => "/home/ubuntu/site2",
                dir => "site2"  
        }
}

