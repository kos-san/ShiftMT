class ShiftsController < ApplicationController
  before_action :set_date, only: [:new, :index, :edit, :create]
  before_action :set_admin
  before_action :set_member
  before_action :set_params, only: [:create, :update]
  def index
      @shifts = Shift.where(store_id: params[:store_id])
      @message = "シフト提出状況"
      @members = Member.where(store_id: @store.id)
  end

  def new
    @shifts = @store.shifts.includes(:user)
    @message = "希望シフトを提出します"
    @shift_where = Shift.where(user_id: current_user.id, store_id: @store.id)
    @shift = Shift.new
  end

  def create
    @store = Store.find(params[:store_id])
    @shift = Shift.new(workday: @workday, start: @start, ending: @ending, text: @text, user_id: @user_id, store_id: @store_id)
    if @shift.valid?
      @shift.save
      redirect_to action: :new
    else
      render :new
    end
  end

  def edit
    @message = "シフトを変更します"
    @shift = Shift.find(params[:id])
  end

  def update
    shift = Shift.find(params[:id])
    shift.update(workday: @workday, start: @start, ending: @ending, text: @text, user_id: @user_id, store_id: @store_id)
    redirect_to action: :new
  end

  def destroy
    shift = Shift.find(params[:id])
    if shift.user_id == current_user.id
      shift.destroy
    end
    redirect_to action: :new
  end

  def show
  end

  private

  def set_member
    store = Store.find(params[:store_id])
    store.members.each do |a|
      if a.user_id == current_user.id || store.user_id == current_user.id
        return @member = true
      else
        @member = false
      end
    end
  end

  def set_admin
    store = Store.find(params[:store_id])
    store.admins.each do |a|
      if a.member.user_id == current_user.id || store.user_id == current_user.id
        return @admin = true
      else
        @admin = false
      end
    end
  end

  # 日付を受け取れるように設定
  def set_date
    @d = Date.today
    @year = @d.year
    @month = @d.next_month.month #シフト提出は翌月分になるため、monthは来月の月を定義する
    # @monthが１月の場合、@yearが１年繰り上がるので、来年を表示できるように設定
    if @month == 1
      @year += 1
    end
    # ビューファイル用
    @all_days = Date.new(@year,@month,-1) #該当の月の存在する日数分の値を取り出す
    @count = 1 #ビューファイルで日付としてしようするため、定義する
    @store = Store.find(params[:store_id])
    @ja = %w(日 月 火 水 木 金 土)
  end

  def set_params
    @workday = params[:workday]
    @start = params[:start]
    @ending = params[:ending]
    @text = params[:text]
    @user_id = current_user.id
    @store_id = params[:store_id]
  end
 

 
end
