class CallMyApisController < ApplicationController
  def index
    render json: { error: "Ok. Let's get started! End Point is correct. But HTTP Method should be..." }, status: 405
  end

  def create
    render json: { error: "Nope. Keep trying. End Point is correct" }, status: 405
  end

  def update
    render json: { error: "Very close. Keep trying. As I said, End Point is correct" }, status: 405
  end

  def destroy
    render json: { message: \
"Well done! haha! Surprised? Yeah, the answer was DELETE. Ok. Next === /c2_users/:id/hacker_apply" }
  end

  def case
    render json: { error: "You know? End Point is a case-sensitive" }, status: 404
  end

  def title
    render json: { error: "You know? It's just a title. Not End Point" }, status: 404
  end

  def think
    render json: { error: "You think it's End Point? No way." }, status: 404
  end

  def myapi
    render json: { error: "Maybe you are right. But can you just call 'call/my/APIs'" }, status: 404
  end

  def something
    render json: { error: "Yo, this is just an example. Go back and 'call/my/APIs'" }, status: 404
  end

  def clue1
    render json: { message: \
"By the way, Have you already registered? This is the clue only for REGISTERED user. \
You should have your id before you check the clue. If you don't, go to /c2_users/ and register. \
Hey, Registered users! Here you go. === bit.ly/1T8gVdG === You don't know about 'bit.ly'? Google it!" }
  end

  def clue11
    render json: { error: "I said 'help/me/out'" }, status: 404
  end

  def clue2
    render json: { error: "Don't forget to say 'please'" }, status: 404
  end

  def clue21
    render json: { error: "I said 'give me a clue'" }, status: 404
  end

  def clue22
    render json: { error: "Please? Please what??" }, status: 404
  end

  def clue3
    render json: { message: "Here you go === bit.ly/1MWLnZr === You don't know about 'bit.ly'? Google it!" }
  end
end
