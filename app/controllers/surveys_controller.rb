class SurveysController < ApplicationController
  @@count = 0
  @@student = []
  def index
    @errors = flash[:errors]
  end
  def check
    @errors = []
    @@student = params[:dojo]
    if @@student[:name].empty?
      @errors.push('Name can not be blank!')
    end 

    if @errors.empty?
      redirect_to '/surveys/result'
    else 
      flash[:errors] = @errors
      redirect_to '/'
    end
  end
  def result
    @@count += 1
    @count = @@count
    @student = @@student
  end
end


----------------------------------------
Coding Dojo Answersheet

class SurveyController < ApplicationController
    def index
        # Set session views to zero if it doesn't exist yet
        if !session[:views]
            session[:views] = 0
        end 
    end 

    def process_survey
        # Increment the session views upon submission of the form          
        session[:views] = session[:views] + 1

        # Save the post data (params[:survey]) to session
        session[:result] = params[:survey]

        # Save success message to flash to show it once
        flash[:success] = "Thanks for submitting this form! You have submitted this form #{ session[:views] } time(s) now."
        
        # To prevent submission of form with page reload
        redirect_to '/survey/result'
    end

    def result
        # Save the data to variable accessible in the views
        @success_message = flash[:success]
        @result = session[:result]
    end
end



