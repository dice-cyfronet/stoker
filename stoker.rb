module Stoker

  class StokerREST < Grape::API
    version 'v1', using: :header, vendor: 'cyfronet'
    format :json

    get do
      'REST service for generating load at the machine it is hosted at.'
    end

    resource :loads do
      # desc 'Generates given CPU load'
      # params do
      #   requires :cpu, type: Integer, desc: 'Number of cores to utilize'
      # end
      # post do
      #   puts "Generating load for #{params[:cpu]}"
      # end

      get do
        system 'stress --cpu 1 --timeout 5 > /dev/null 2> /dev/null &'
        'zestresowalem'
      end
    end
  end

end