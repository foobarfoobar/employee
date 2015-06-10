class FormwithoutmodelController < ApplicationController
  def input
    # Anzeige des Form.
  end

  def output
    # Instanzvariable im View verfuegbar
    @example_text = params[:example_text] # Alle Werte eines Form. werden ueber den Hash params uebertragen!!
  end
end
