class TablesController < ApplicationController
  before_action :set_month
  before_action :set_store, only: [:index, :new]
  before_action :set_table, only: [:index, :new]

  def index
  end

  def new
    unless params[:shift_id].nil?
      @shift = Shift.find(params[:shift_id])
      @table = Table.new
    end
  end

  def create
    table = Table.new(table_params)
    if table.valid?
      table.save
      redirect_to action: :new
    end
  end

  def update
    store = Store.find(params[:store_id])
    @shift = Shift.find(params[:shift_id])
    @shift.update(shift_params)
  end

  private

  def table_params
    params.require(:table).permit(:workday, :start, :ending, :user_id).merge(store_id: params[:store_id])
  end

  def set_month
    @today = Date.today
    @next = @today.next_month
    @day = Date.new(@next.year, @next.month, -1)
    @day_count = 0
    # @test = Date.new(@next.year,@next.month,@day_count)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_table
    @members = @store.members.includes(:store)
    shifts = Shift.where(store_id: params[:store_id])
    @shifts = shifts.where('workday like ?', "#{@next.year}-#{@next.month}%")
    tables = Table.where(store_id: params[:store_id])
    @tables = tables.where('workday like ?', "#{@next.year}-#{@next.month}%")
  end
end
