module Karajoker::Rest::Resource
  class IndexResource < Grape::API
    desc 'Index service'
    resource :index do
      desc 'Index'
      params do
        requires :limit, type: Integer, desc: 'first songs of chart'
        requires :years, type: String, desc: 'Range of years'
      end
      post do
        limit = params[:limit].to_i unless params[:limit].nil?
        Karajoker::Job::Indexer.perform_async(limit, params[:years])
      end
    end
  end
end
