class TablesController < ApplicationController
  before_action :set_month
  before_action :set_store, only: [:index, :new]

  def index
  end

  def new
    @members = @store.members.includes(:store)
    @shifts = Shift.where(store_id: params[:store_id])
    @table = Table.new

    if params[:shift_id] != nil
      @shift = Shift.find(params[:shift_id])
    end
  end

  def create
    @table = Table.new(table_params)
    binding.pry
  end

  def update
    store = Store.find(params[:store_id])
    @shift = Shift.find(params[:shift_id])
    @shift.update(shift_params)
  end

  private

  def table_params
    params.require(:table).permit(:workday, :start, :ending, :total, :shift_id).merge(store_id: params[:store_id])
  end

  def set_month
    @today = Date.today
    @next = @today.next_month
    @day = Date.new(@next.year,@next.month,-1)
    @day_count = 0
    # @test = Date.new(@next.year,@next.month,@day_count)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  
end
