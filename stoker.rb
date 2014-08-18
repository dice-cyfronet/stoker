module Stoker

  class StokerREST < Grape::API
    version 'v1', using: :header, vendor: 'cyfronet'
    format :json

    helpers do

      def get_child_processes_pids(ppid)
        eval("`pgrep -P #{ppid}`").split
      end

    end

    get do
      'REST service for generating load at the machine it is hosted at.'
    end

    resource :loads do
      
      desc 'Generates given CPU load'
      params do
        requires :core_percentage, type: Integer, values: 1..100, desc: 'Percentage of single core usage ranging from 1 to 100'
        requires :timeout, type: Integer, desc: 'How long the process generating load will run in seconds'
      end
      post do
        puts "Generating load at #{params[:core_percentage]}% for #{params[:timeout]}"
        sh_pid = spawn("stress --cpu 1 --timeout #{params[:timeout]} > /dev/null 2> /dev/null")
        stress_pid = get_child_processes_pids(sh_pid).first
        puts "Stress pid: #{stress_pid}"
        Process.detach(sh_pid)
        stress_children_pids = get_child_processes_pids(stress_pid)
        stress_children_pids.each {|pid|
          puts "Setting limit for process #{pid}"
          Process.detach(spawn("cpulimit -l #{params[:core_percentage]} -p #{pid} -b > /dev/null 2> /dev/null"))
          Process.detach(pid.to_i)
        }
        {msg: 'Load is being generated!'}
      end

    end

  end

end