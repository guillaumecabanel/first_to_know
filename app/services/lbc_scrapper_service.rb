require 'open-uri'

class LbcScrapperService
  def initialize(params = {})
    @base_url  = ENV['LBC_BASE_URL']
    @search    = Search.find(params[:search_id])
    @url_query = url_query
  end

  def call
    html_doc = get_html(@url_query)

    html_doc.css('section.tabsContent').search('li').each do |offer|
      title = offer.css('h2.item_title').text.strip.capitalize
      lbc_id = get_lbc_id(offer.css('a').attribute('href'))
      price =  offer.css('h3.item_price').text.strip.match(/\d+/).to_s.to_i

      unless title.empty? || lbc_id.nil? || price <= 1
        Offer.find_or_create_by(lbc_id: lbc_id) do |offer|
          offer.title = title
          # offer.price = price
          offer.url   = "https://www.leboncoin.fr/#{lbc_theme}/#{lbc_id}.htm"
        end
      end
    end
  end

  private

  def url_query
    uri_params = URI.encode_www_form(
      category: @search.category.lbc_id,
      text:     @search.query,
      location: @search.zip_code
    )

    "#{@base_url}?#{uri_params}"
  end

  def get_html(url)
    # TODO: use capybara to get html
    raise
  end

  def get_lbc_id(offer_link)
    offer_link.to_s.match(/\d{10}/)[0]
  end
end
