class StaticController < ApplicationController
  def home
    render json: {
      about: 'APIStore is a simple JSON storing API. Post any json enclosed in `store` key and it will save it and will give you an ID and a token. Save it and access it your JSON later. Useful for static api storing and lightweight* JSON backups.',
      url: 'https://github.com/avinoth/apistore',
      faq: {
        create_endpoint: 'The endpoint to create is `/stores` make sure you send in a proper JSON and set the header content-type',
        access_endpoint: 'You can access the JSON by following `/stores/:id/?token=:token`',
        can_i_delete: 'Ofcourse you can delete. The endpoint is same as access endpoint but send in a delete request.',
        retention_period: 'If the JSON dump stored is unused for 60 days it will be deleted.',
        stack: 'The site is built on rails-api.',
        can_i_self_host: 'You are welcome to. The source is available in github and you can use it to host your own instance.',
        issues: 'https://github.com/avinoth/apistore/issues',
        contact: 'mail@avinoth.com'
      }
    }
  end
end
