module Karajoker::Rest::Resource
  class TagResource < Grape::API
    Tag = Karajoker::Entity::Tag

    desc 'Tag CRUD'
    resource :tags do
      desc 'Add new tag'
      params { requires :name, type: String, desc: 'A tab name' }
      post { Tag.create(name: params[:name]) }

      desc 'Get all tags'
      get { Tag.all }
    end
  end
end
