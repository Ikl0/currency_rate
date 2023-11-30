Currency.all.each do |currency|
  (1..30).each do |i|
    date = Date.today - i
    url = URI("https://www.cbr-xml-daily.ru/archive/#{date.year}/#{date.strftime('%m')}/#{date.strftime('%d')}/daily_json.js")

    begin
      response = Net::HTTP.get(url)
      data = JSON.parse(response)
      if data["Valute"] && data["Valute"][currency.name]
        rate = data["Valute"][currency.name]["Value"]
      else
        rate = 0
      end
    rescue
      rate = 0
    end

    unless currency.exchange_rates.exists?(date: date)
      currency.exchange_rates.create(rate: rate, date: date)
    end
  end
end
