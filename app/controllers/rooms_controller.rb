class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    
    respond_to do |format|
      if @room.save
        trivia_category = (@room.category.eql? "any") ? '' : "category=" + @room.category
        
        questions_response = RestClient::Request.execute(
          method: :get,
          url: 'https://opentdb.com/api.php?amount=7&type=multiple&' + trivia_category
        )
        questions = JSON.parse(questions_response)['results']

        questions.each do |question|
          Question.create(
            :problem => question['question'],
            :category => question['category'],
            :correct_answer => question["correct_answer"],
            :incorrect_answer_one => question["incorrect_answers"][0],
            :incorrect_answer_two => question["incorrect_answers"][1],
            :incorrect_answer_three => question["incorrect_answers"][2],
            :room_id => @room.id
          )
        end
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /rooms/play/:id/:question
  def play
    @question = Question.where(:room_id => params[:id])[params[:question].to_i]
    @answers = [@question.incorrect_answer_one, @question.incorrect_answer_two, @question.incorrect_answer_three, @question.correct_answer].shuffle
  end

  # POST /rooms/play/:id/:question
  def answer
    next_page = params[:question].to_i + 1
    redirect_to action: 'play', id: params[:id], question: next_page.to_s
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:category, :name).merge(host_id: current_user.id, isactive: true)
    end
end
