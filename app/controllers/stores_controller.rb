class StoresController < ApplicationController
  before_action :set_store, only: [:show, :update, :destroy]

  def show_stats
    if is_admin?
      @stores = Store.all.order('last_accessed desc').map do |s|
        {
          id: s.id,
          name: s.name,
          created: s.created_at,
          last_accessed: s.last_accessed,
          accessed_times: s.accessed_times
        }
      end
      render json: @stores
    else
      unauthorized_request
    end
  end

  def show
    @store.update_access
    render json: print_out(@store)
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      render json: print_out(@store)
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  def update
    @store = Store.find(params[:id])
    unless @store.token == params[:token]
      unauthorized_request
    end

    if @store.update(store_params)
      render json: print_out(@store)
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @store.destroy

    render json: {status: 'Your JSON is destroyed succesfully.'}
  end

  private

    def set_store
      @store = Store.find(params[:id])
      unless @store.token == params[:token] or @store.active
        unauthorized_request
      end
    end

    def store_params
      params.require(:store).permit!
    end

    def unauthorized_request
      render json: {
          error: "Unauthorized Request",
          status: 401
        }, status: 401
    end

    def print_out store
      {
        id: store.id,
        token: store.token,
        content: store.content
      }
    end
end
