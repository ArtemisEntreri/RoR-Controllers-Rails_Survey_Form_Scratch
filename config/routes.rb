Rails.application.routes.draw do
  root 'surveys#index'
  # get 'surveys/index'

  post 'surveys/check'
  get 'surveys/result'

end



-----------------------------
CodingDojo Answersheet


Rails.application.routes.draw do
  root "surveys#index"

  get 'surveys/index'

  get 'surveys/result'

  post 'surveys' => 'surveys#process_survey'

end