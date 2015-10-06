defmodule Excountries.Radar do
  def all(client \\ Excountries.API) do
    client.call("/all") |> Poison.decode!(as: [Excountries.Country])
  end

  def by_full_name(name, client \\ Excountries.API) do
    name = String.downcase name
    client.call("/name/#{name}?fullText=true") |> Poison.decode!(as: [Excountries.Country]) |> List.first
  end
  
  def by_name(name, client \\ Excountries.API) do
    name = String.downcase name
    client.call("/name/#{name}") |> Poison.decode!(as: [Excountries.Country])
  end

  def by_language(lang, client \\ Excountries.API) do
    client.call("/lang/#{lang}") |> Poison.decode!(as: [Excountries.Country])
  end

  def by_currency(currency, client \\ Excountries.API) do
    client.call("/currency/#{currency}") |> Poison.decode!(as: [Excountries.Country])
  end

  def by_capital(capital, client \\ Excountries.API) do
    client.call("/capital/#{capital}") |> Poison.decode!(as: [Excountries.Country]) |> List.first
  end

  def by_calling_code(code, client \\ Excountries.API) do
    client.call("/calling_code/#{code}") |> Poison.decode!(as: [Excountries.Country])
  end

  def by_region(region, client \\ Excountries.API) do
    client.call("/region/#{region}") |> Poison.decode!(as: [Excountries.Country])
  end

  def by_subregion(subregion, client \\ Excountries.API) do
    client.call("/subregion/#{subregion}") |> Poison.decode!(as: [Excountries.Country])
  end

  def by_country_code(code, client \\ Excountries.API) do
    client.call("/alpha/#{code}") |> Poison.decode!(as: [Excountries.Country])
  end
end
