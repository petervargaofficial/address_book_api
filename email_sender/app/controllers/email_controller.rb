class EmailController < ApplicationController

  def about
  end

  def email
    # TODO: send the email here.


    @email = Email.new(email: params[:email], subject: params[:subject], body: params[:body], user: params[:user_id])

    respond_to do |format|
      if @email.save
        SiteMailer.status_email(params[:email], params[:subject], params[:body]).deliver
        format.html { redirect_to root_path, notice: 'Email was successfully created.' }
        format.json { render action: 'show', status: :created}
      else
        format.html { render action: 'new' }
        format.json { render json: @email, status: :unprocessable_entity }
      end
    end
  end

  def show
    @email = Email.all
    respond_to do |format|
      format.html
      format.xml { render xml: @email.to_xml }
      format.json { render json: @email, status: :ok }
    end
  end


  private

  def email_params
    params.require(:email_info).permit(:email, :subject, :body, :user)
  end


end
