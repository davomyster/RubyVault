
class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts
    respond_to do |response|
      response.html
      response.xml { render :xml => @accounts.to_xml }
 end
  end
end
