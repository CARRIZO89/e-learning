class InscriptionsController < ApplicationController

  def show
    @inscription = Inscription.find(params[:id])
    @course = Course.find(@inscription.course_id)
    @student = Person.find(@inscription.person_id)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'invoice', layout: 'pdf', template: 'admin/inscriptions/show_pdf.html.erb'
      end
    end
  end

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
