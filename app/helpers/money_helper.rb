module MoneyHelper

  def format_money(cents)
    dollar = cents.to_f / 100
    decimal = sprintf("%g", dollar.modulo(1)).split(".").last
    html = "<span class='dollar-symbol'>$</span>" +
    "<span class='dollar-amount'>#{dollar.floor}</span>" +
    "<span class='dollar-decimal'>.#{decimal}</span>"
    html.html_safe
  end
end
