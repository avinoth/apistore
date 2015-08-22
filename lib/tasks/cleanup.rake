namespace :cleanup do
   task stores: [:environment] do
    Store.where('last_accessed < ?', 60.days.ago).each do |store|
      store.update_attributes(active: false)
    end
  end
end
