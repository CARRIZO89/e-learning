class InscriptionsController < ApplicationController
  def create
    inscription = Inscription.new(inscription_params)
    inscription.save!
    flash[:kind]   = 'success'
    flash[:header] = t('success')
    flash[:body]   = t('.success', id: inscription.id)
    redirect_back(fallback_location: '')
  end

  def destroy
    @inscription.destroy
    respond_to do |format|
      format.html { redirect_to inscriptions_url, notice: 'Inscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def inscription_params
    { person: current_person, course_id: params[:course_id] }
  end
end
