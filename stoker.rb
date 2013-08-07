module Stoker

  class StokerREST < Grape::API
    version 'v1', using: :header, vendor: 'cyfronet'
    format :json

    resource :loads do
      # desc 'Generates given CPU load'
      # params do
      #   requires :cpu, type: Integer, desc: 'Number of cores to utilize'
      # end
      # post do
      #   puts "Generating load for #{params[:cpu]}"
      # end

      get do
        puts "Getting load..."
        {'h' => 'ura'}
      end
    end
  end

end