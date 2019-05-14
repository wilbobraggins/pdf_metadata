class UrlController < ApplicationController
  
  def index
    @url = Url.output
    respond_to do |format|
      format.html
      format.pdf { doc_raptor_send }
    end
  end

  private

  def doc_raptor_send
    options = {
      :name               => controller_name,
      :document_content   => render_to_string("index.html"),
      :document_type      => "pdf",
      :test               => true
    }

    response = DocRaptor.create(options)
    if response.code == 200
      send_data response, :filename => "#{options[:name]}.pdf", :type => "pdf"
    else
      render render :inline => response.body, :status => response.code
    end
  end
end
